package mx.cds.utez.inventario.actions;

import com.opensymphony.xwork2.ActionSupport;
import mx.cds.utez.inventario.model.producto.DaoProducto;
import mx.cds.utez.inventario.utils.Mensaje;

public class ProductoAction extends ActionSupport {

    String datos;
    Mensaje mensaje;

    public String findAll(){
        mensaje = DaoProducto.findAll();
        return SUCCESS;
    }

    public String getDatos() {
        return datos;
    }

    public void setDatos(String datos) {
        this.datos = datos;
    }

    public Mensaje getMensaje() {
        return mensaje;
    }

    public void setMensaje(Mensaje mensaje) {
        this.mensaje = mensaje;
    }
}
