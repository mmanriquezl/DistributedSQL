package controllers;

import models.Empleado;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

public class CtrEmpleado {
    private Sql2o sql2o;
    public CtrEmpleado(Sql2o sql2o) {
        this.sql2o = sql2o;
    }

    public List<Empleado> getEmpleados(){
        try(Connection conn = sql2o.open()){
            return conn.createQuery("select * from empleado")
                    .executeAndFetch(Empleado.class);
        }
    }

    public List<Empleado> getEmpleadosPaginated(int limit, int offset){
        try(Connection conn = sql2o.open()){
            return conn.createQuery("select * from empleado limit :limit offset :offset")
                    .addParameter("limit", limit)
                    .addParameter("offset", offset)
                    .executeAndFetch(Empleado.class);
        }
    }

    public Empleado creaEmpleado(Empleado emp){
        try(Connection conn = sql2o.open()){
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







