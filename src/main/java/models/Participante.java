package models;

public class Participante {
    private int cod;
    private String rut;

    public void setRut(String rut) {
        this.rut = rut;
    }

    public String getRut() {
        return rut;
    }

    public int getCod() {
        return cod;
    }

    public void setCod(int cod) {
        this.cod = cod;
    }
}
