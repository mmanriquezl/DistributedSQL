package controllers;

import models.Empleado;
import models.FilledParticipante;
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

    public List<FilledParticipante> getFilledParticipante(){
        try {
            ExecutorService executor = Executors.newFixedThreadPool(sql2o.length);
            List<Participante> [] results = new ArrayList[sql2o.length];
            for( int i = 0; i < sql2o.length; i++){
                final int db = i;
                results[i] = new ArrayList<Participante>();
                executor.execute(new Runnable() {
                    @Override
                    public void run() {
                        try(Connection conn = sql2o[db].open()){
                            results[db] = conn.createQuery("select * from participantes")
                                    .executeAndFetch(Participante.class);
                        }
                    }
                });
            }
            executor.shutdown();
            executor.awaitTermination(24*3600, TimeUnit.SECONDS);
            List<Participante> merged = new ArrayList<Participante>();
            for( int i = 0; i < sql2o.length; i++){
                merged.addAll(results[i]);
            }
            //averiguar a que maquina pedir los datos de reuniones y empleados
            Set<Integer>[] codigos = new HashSet[sql2o.length];
            Set<String>[] ruts = new HashSet[sql2o.length];
            for( int i = 0; i < sql2o.length; i++){
                codigos[i] = new HashSet<Integer>();
                ruts[i] = new HashSet<String>();
            }
            for(Participante p : merged){
                int c = p.getCod()%sql2o.length;
                codigos[c].add(p.getCod());
                int digito;
                String tmp = p.getRut().toLowerCase();
                String[] arr = tmp.split("-");
                if (arr[1].equals("k")){
                    digito = 10;
                }
                else{
                    digito = Integer.parseInt(arr[1]);
                }
                int r = digito%sql2o.length;

                ruts[r].add(p.getRut());
            }

            List<FilledParticipante> resultado = new ArrayList<FilledParticipante>();
            executor = Executors.newFixedThreadPool(sql2o.length);
            List<Reunion> [] dataReuniones = new ArrayList[sql2o.length];
            for( int i = 0; i < sql2o.length; i++){
                final int db = i;
                dataReuniones[db] = new ArrayList<Reunion>();
                executor.execute(new Runnable() {
                    @Override
                    public void run() {
                        try(Connection conn = sql2o[db].open()){
                            String joinedString = "[";
                            for (int c:codigos[db]) {
                                joinedString+=Integer.valueOf(c)+",";
                            }
                            StringBuilder str = new StringBuilder(joinedString);
                            str.setCharAt(joinedString.length()-1,']');

                            String query = "select * from reunion " +
                                    "where cod = ANY (ARRAY "+ str +")";
                            System.out.println(query);
                            dataReuniones[db] = conn.createQuery(query)
                                    .executeAndFetch(Reunion.class);
                        }
                    }
                });
            }
            executor.shutdown();
            executor.awaitTermination(24*3600, TimeUnit.SECONDS);
            List<Reunion> mergedReuniones = new ArrayList<Reunion>();
            for( int i = 0; i < sql2o.length; i++){
                mergedReuniones.addAll(dataReuniones[i]);
            }

            for(Reunion r: mergedReuniones){
                System.out.println("Cod: "+r.getCod()+", Tema: "+r.getTema());
            }

            executor = Executors.newFixedThreadPool(sql2o.length);
            List<Empleado> [] dataEmpleados = new ArrayList[sql2o.length];
            for( int i = 0; i < sql2o.length; i++){
                final int db = i;
                dataEmpleados[db] = new ArrayList<Empleado>();
                executor.execute(new Runnable() {
                    @Override
                    public void run() {
                        try(Connection conn = sql2o[db].open()){
                            String joinedString = "[";
                            for (String r:ruts[db]) {
                                joinedString+="'"+r+"',";
                            }
                            StringBuilder str = new StringBuilder(joinedString);
                            str.setCharAt(joinedString.length()-1,']');

                            String query = "select * from empleado " +
                                    "where rut = ANY (ARRAY "+ str +")";
                            System.out.println(query);
                            dataEmpleados[db] = conn.createQuery(query)
                                    .executeAndFetch(Empleado.class);
                        }
                    }
                });
            }
            executor.shutdown();
            executor.awaitTermination(24*3600, TimeUnit.SECONDS);
            List<Empleado> mergedEmpleados = new ArrayList<Empleado>();
            for( int i = 0; i < sql2o.length; i++){
                mergedEmpleados.addAll(dataEmpleados[i]);
            }

            for(Empleado e: mergedEmpleados){
                System.out.println("Rut: "+e.getRut()+", Nombre: "+e.getNombre());
            }
            for(Participante p:merged){
                Reunion r = buscaReunion(p.getCod(),mergedReuniones);
                Empleado e = buscaEmpleado(p.getRut(), mergedEmpleados);
                FilledParticipante aux =new FilledParticipante();
                aux.setEmpleado(e);
                aux.setOriginal(p);
                aux.setReunion(r);
                resultado.add(aux);
            }


            return resultado;
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return null;
    }

}


