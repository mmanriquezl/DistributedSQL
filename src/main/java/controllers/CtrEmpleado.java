package controllers;

import models.Empleado;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

public class CtrEmpleado {
    private Sql2o sql2o[];
    public CtrEmpleado(Sql2o[] sql2o) {
        this.sql2o = sql2o;
    }

    public List<Empleado> getEmpleados(){
        try {
            ExecutorService executor = Executors.newFixedThreadPool(sql2o.length);
            List<Empleado> [] results = new ArrayList[sql2o.length];
            for( int i = 0; i < sql2o.length; i++){
                final int db = i;
                results[i] = new ArrayList<Empleado>();
                executor.execute(new Runnable() {
                    @Override
                    public void run() {
                        try(Connection conn = sql2o[db].open()){
                            results[db] = conn.createQuery("select * from empleado")
                                    .executeAndFetch(Empleado.class);
                        }
                    }
                });
            }
            executor.shutdown();
            executor.awaitTermination(24*3600, TimeUnit.SECONDS);
            List<Empleado> merged = new ArrayList<Empleado>();
            for( int i = 0; i < sql2o.length; i++){
                merged.addAll(results[i]);
            }
            return merged;
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return null;

    }

//    public List<Empleado> getEmpleadosPaginated(int limit, int offset){
//        try(Connection conn = sql2o.open()){
//            return conn.createQuery("select * from empleado limit :limit offset :offset")
//                    .addParameter("limit", limit)
//                    .addParameter("offset", offset)
//                    .executeAndFetch(Empleado.class);
//        }
//    }

    public Empleado creaEmpleado(Empleado emp){
        int db = emp.getDigito() % sql2o.length;
        try(Connection conn = sql2o[db].open()){
            conn.createQuery(
                    "insert into empleado(rut, nombre, cargo, email) values (:rut, :nombre, :cargo, :email)")
                    .addParameter("rut", emp.getRut())
                    .addParameter("nombre", emp.getNombre())
                    .addParameter("cargo", emp.getCargo())
                    .addParameter("email", emp.getEmail())
                    .executeUpdate();
            return emp;
        }
    }
}







