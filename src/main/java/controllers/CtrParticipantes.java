package controllers;

import models.Empleado;
import models.Participante;
import models.Reunion;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.*;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

public class CtrParticipantes {
    private Sql2o sql2o[];

    public CtrParticipantes(Sql2o[] sql2o) {
        this.sql2o = sql2o;
    }
    public Participante agregaParticipante(Participante participante){
        int db = participante.getCod() % sql2o.length;
        try(Connection conn = sql2o[db].open()){
            conn.createQuery(
                    "insert into participantes(cod, rut) " +
                    "values (:cod, :rut)")
                    .addParameter("cod", participante.getCod())
                    .addParameter("rut", participante.getRut())
                    .executeUpdate();
            return participante;
        }
    }

    public Empleado buscaEmpleado(String rut, List<Empleado> lista){
        for(Empleado e: lista){
            if(rut.equals(e.getRut())){
                return e;
            }
        }
        return null;
    }
    public Reunion buscaReunion(int cod, List<Reunion> lista){
        for(Reunion r: lista){
            if(r.getCod()==cod){
                return r;
            }
        }
        return null;
    }

    public int hashRut(String rut){
        int digito;
        String tmp = rut.toLowerCase();
        String[] arr = tmp.split("-");
        if (arr[1].equals("k")){
            digito = 10;
        }
        else{
            digito = Integer.parseInt(arr[1]);
        }
        return digito%sql2o.length;
    }

    public List<Empleado> getFilledParticipanteByDate(String date){
        try{
            /*
            * 1.- Obtener los rut de los asistentes a las reuniones que ocurrieron desde la fecha
            *     dada en adelante. Aprovecho de que reuniones y participantes estan distribuidas
            *     por la misma llave.
            */
            ExecutorService executor = Executors.newFixedThreadPool(sql2o.length);
            /*
            * 2.- Los resultados de cada consulta se guardaran en un arreglo de ruts, donde
            *     cada hilo escribe en el elemento del arreglo que le corresponde
            */
            List<String> [] ruts= new ArrayList[sql2o.length];
            for( int i = 0; i < sql2o.length; i++){
                final int db = i;
                ruts[i] = new ArrayList<String>();
                executor.execute(new Runnable() {
                    @Override
                    public void run() {
                        try(Connection conn = sql2o[db].open()){
                            ruts[db] = conn.createQuery("select P.rut from reunion as R, participantes as P " +
                                    "where hora::date > '"+date+"' and P.cod = R.cod group by P.rut")
                                    .executeAndFetch(String.class);
                        }
                    }
                });
            }

            /*
            * "Sincronizacion"
            */
            executor.shutdown();
            executor.awaitTermination(24*3600, TimeUnit.SECONDS);

            /*
            * 3.- Guardo los ruts en la maquina donde estan almacenados para consultarlos
            * */
            List<String>[] mergedRuts = new ArrayList[sql2o.length];
            for( int i = 0; i < sql2o.length; i++){
                mergedRuts[i] = new ArrayList<String>();
            }

            for( int i = 0; i < sql2o.length; i++){
                for(String rut: ruts[i]){
                    int r = hashRut(rut);
                    mergedRuts[r].add(rut);
                }
            }

            /*
            * 4.- Preparo los hilos para consultar a cada bd los datos de empleados
            * */
            executor = Executors.newFixedThreadPool(sql2o.length);

            List<Empleado> [] empleados= new ArrayList[sql2o.length];
            for( int i = 0; i < sql2o.length; i++){
                final int db = i;
                empleados[i] = new ArrayList<Empleado>();
                executor.execute(new Runnable() {
                    @Override
                    public void run() {
                        try(Connection conn = sql2o[db].open()){
                            String joinedString = "[";
                            for (String r:mergedRuts[db]) {
                                joinedString+="'"+r+"',";
                            }
                            StringBuilder str = new StringBuilder(joinedString);
                            str.setCharAt(joinedString.length()-1,']');

                            /*
                            * 5.- filtro que los empleados sean gerentes
                            * */
                            String query = "select * from empleado " +
                                    "where cargo='Gerente' and rut = ANY (ARRAY "+ str +")";
                            empleados[db] = conn.createQuery(query)
                                    .executeAndFetch(Empleado.class);
                        }
                    }
                });
            }
            executor.shutdown();
            executor.awaitTermination(24*3600, TimeUnit.SECONDS);
            /*
            * 6.- Merge de los resultados
            * */
            List<Empleado> mergedEmpleados = new ArrayList<Empleado>();
            for( int i = 0; i < sql2o.length; i++){
                mergedEmpleados.addAll(empleados[i]);
            }

            return mergedEmpleados;

        }catch (InterruptedException e) {
            e.printStackTrace();
        }
        return null;

    }


}


