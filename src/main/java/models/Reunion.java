package models;


import java.util.Date;

//REUNIONES( ​ cod​ , tema, ubicacion, fecha, hora, capacidad_sala )
public class Reunion {
    private int cod;
    private String tema;
    private String ubicacion;
    private Date hora;
    private int capacidad;

    public int getCod() {
        return cod;
    }

    public String getTema() {
        return tema;
    }

    public Date getHora() {
        return hora;
    }

    public int getCapacidad() {
        return capacidad;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setCod(int cod) {
        this.cod = cod;
    }

    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }

    public void setHora(Date hora) {
        this.hora = hora;
    }

    public void setTema(String tema) {
        this.tema = tema;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }
}
