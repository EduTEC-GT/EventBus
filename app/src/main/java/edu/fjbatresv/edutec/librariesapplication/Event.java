package edu.fjbatresv.edutec.librariesapplication;

import java.io.Serializable;

public class Event implements Serializable {

    public static final int toUpper = 1;

    private int tipo;
    private String mensaje;
    private String error;
    private Object obj;

    public Event(int tipo, String mensaje, String error, Object obj) {
        this.tipo = tipo;
        this.mensaje = mensaje;
        this.error = error;
        this.obj = obj;
    }

    public Event(int tipo, Object obj) {
        this.tipo = tipo;
        this.obj = obj;
    }

    public Event(int tipo, String mensaje, Object obj) {
        this.tipo = tipo;
        this.mensaje = mensaje;
        this.obj = obj;
    }

    public Event(String error) {
        this.error = error;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public Object getObj() {
        return obj;
    }

    public void setObj(Object obj) {
        this.obj = obj;
    }
}
