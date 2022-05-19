package mx.cds.utez.inventario.utils;

import java.util.List;
import java.util.Map;

public class Mensaje {
    private boolean error;
    private String mensaje;
    private Object datos;
    private Map<String, String> errores;

    public Mensaje() {
    }

    public Mensaje(boolean error, String mensaje, Object datos, Map<String, String> errores) {
        this.error = error;
        this.mensaje = mensaje;
        this.datos = datos;
        this.errores = errores;
    }

    public boolean isError() {
        return error;
    }

    public void setError(boolean error) {
        this.error = error;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public Object getDatos() {
        return datos;
    }

    public void setDatos(Object datos) {
        this.datos = datos;
    }

    public Map<String, String> getErrores() {
        return errores;
    }

    public void setErrores(Map<String, String> errores) {
        this.errores = errores;
    }
}
