import static spark.Spark.*;

import com.google.gson.GsonBuilder;
import controllers.CtrEmpleado;
import com.google.gson.Gson;
import controllers.CtrParticipantes;
import controllers.CtrReunion;
import models.Empleado;
import models.Participante;
import models.Reunion;
import org.sql2o.Sql2o;

public class Main {

    public static void main(String[] args) {
        Sql2o sql2o[] = new Sql2o[2];
        sql2o[0] = new Sql2o("jdbc:postgresql://127.0.0.1:5432/tbd","tbduser","tbdpass");
        sql2o[1] = new Sql2o("jdbc:postgresql://127.0.0.1:5432/tbd2","tbduser","tbdpass");

        CtrEmpleado ctrEmpleado = new CtrEmpleado(sql2o);
        CtrReunion ctrReunion = new CtrReunion(sql2o);
        CtrParticipantes ctrParticipantes = new CtrParticipantes(sql2o);

        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();

        get("/", (req, res) -> "{\"mensaje\":\"Corriendo\"}");



        post("/empleados", (req, res) -> {
            Empleado emp = gson.fromJson(req.body(), Empleado.class);
            Empleado insertado = ctrEmpleado.creaEmpleado(emp);
            res.status(201);
            return gson.toJson(insertado);
        });

        get("/empleados", (req, res) -> {
            return gson.toJson(ctrEmpleado.getEmpleados());
        });

        post("/reunion", (req, res) -> {
            Reunion reu = gson.fromJson(req.body(), Reunion.class);
            Reunion insertado = ctrReunion.creaReunion(reu);
            res.status(201);
            return gson.toJson(insertado);
        });

        get("/reunion", (req, res) -> {
            return gson.toJson(ctrReunion.getReuniones());
        });

        post("/participantes",(req, res)->{
            Participante p = gson.fromJson(req.body(), Participante.class);
            Participante insertado = ctrParticipantes.agregaParticipante(p);
            res.status(201);
            return gson.toJson(insertado);
        });

        get("/participantes/data", (req, res) -> {
            return gson.toJson(ctrParticipantes.getFilledParticipante());
        });

        after((req, res) -> {
            res.type("application/json");
        });
    }


}
