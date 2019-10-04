package models;


//EMPLEADOS( rut, nombre, cargo, correo )
public class Empleado {
    private String rut;
    private String nombre;
    private String cargo;
    private String email;

    public String getRut(){
        return rut;
    }

    public String getCargo() {
        return cargo;
    }

    public String getEmail() {
        return email;
    }

    public String getNombre() {
        return nombre;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

}

