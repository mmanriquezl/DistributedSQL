package controllers;

import models.Empleado;
import models.Reunion;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

public class CtrReunion {
    private Sql2o sql2o[];
    public CtrReunion(Sql2o[] sql2o) {
        this.sql2o = sql2o;
    }

    public Reunion creaReunion(Reunion reu){
        int db = reu.getCod() % sql2o.length;
        try(Connection conn = sql2o[db].open()){
            conn.createQuery(
                    "insert into " +
                    "reunion(cod, tema, ubicacion, capacidad, hora) " +
                    "values (:cod, :tema, :ubicacion, :capacidad, :hora)")
                    .addParameter("cod", reu.getCod())
                    .addParameter("tema", reu.getTema())
                    .addParameter("ubicacion", reu.getUbicacion())
                    .addParameter("capacidad", reu.getCapacidad())
                    .addParameter("hora", reu.getHora())
                    .executeUpdate();
            return reu;
        }
    }

    public List<Reunion> getReuniones(){
        try {
            ExecutorService executor = Executors.newFixedThreadPool(sql2o.length);
            List<Reunion> [] results = new ArrayList[sql2o.length];
            for( int i = 0; i < sql2o.length; i++){
                final int db = i;
                results[i] = new ArrayList<Reunion>();
                executor.execute(new Runnable() {
                    @Override
                    public void run() {
                        try(Connection conn = sql2o[db].open()){
                            results[db] = conn.createQuery("select * from reunion")
                                    .executeAndFetch(Reunion.class);
                        }
                    }
                });
            }
            executor.shutdown();
            executor.awaitTermination(24*3600, TimeUnit.SECONDS);
            List<Reunion> merged = new ArrayList<Reunion>();
            for( int i = 0; i < sql2o.length; i++){
                merged.addAll(results[i]);
            }
            return merged;
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return null;

    }
}
