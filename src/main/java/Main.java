import static spark.Spark.*;

import com.google.gson.Gson;
import org.sql2o.Sql2o;


public class Main {

    public static void main(String[] args) {

        Sql2o sql2o = new Sql2o("jdbc:postgresql://127.0.0.1:5432/tbd","tbduser","tbdpass");

        get("/", (req, res) -> "{\"mensaje\":\"Corriendo\"}");

        after((req, res) -> {
            res.type("application/json");
        });
    }


}
