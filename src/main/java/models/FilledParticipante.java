package models;

public class FilledParticipante {
        private Participante original;
        private Reunion reunion;
        private Empleado empleado;

    public Empleado getEmpleado() {
        return empleado;
    }

    public Participante getOriginal() {
        return original;
    }

    public Reunion getReunion() {
        return reunion;
    }

    public void setEmpleado(Empleado empleado) {
        this.empleado = empleado;
    }

    public void setOriginal(Participante original) {
        this.original = original;
    }

    public void setReunion(Reunion reunion) {
        this.reunion = reunion;
    }
}
