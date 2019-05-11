package edu.fjbatresv.edutec.librariesapplication;

public class Mascota {
    private String nombre;
    private static Mascota instance;

    public static Mascota getInstance() {
        if (instance == null) {
            instance = new Mascota();
        }
        return instance;
    }

    private Mascota() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
