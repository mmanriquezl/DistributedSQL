import static spark.Spark.*;

import controllers.CtrEmpleado;
import com.google.gson.Gson;
import models.Empleado;
import org.sql2o.Sql2o;

public class Main {

    public static void main(String[] args) {

        Sql2o sql2o = new Sql2o("jdbc:postgresql://127.0.0.1:5432/tbd","tbduser","tbdpass");
        CtrEmpleado ctrEmpleado = new CtrEmpleado(sql2o);

        get("/", (req, res) -> "{\"mensaje\":\"Corriendo\"}");

        get("/empleados", (req, res) -> {
            return new Gson().toJson(ctrEmpleado.getEmpleados());
        });

        post("/empleados", (req, res) -> {
            Empleado emp = new Gson().fromJson(req.body(), Empleado.class);
            Empleado insertado = ctrEmpleado.creaEmpleado(emp);
            res.status(201);
            return new Gson().toJson(insertado);
        });

        after((req, res) -> {
            res.type("application/json");
        });
    }


}
