package mx.cds.utez.inventario.actions;

import com.opensymphony.xwork2.ActionSupport;
import mx.cds.utez.inventario.model.categoria.BeanCategoria;
import mx.cds.utez.inventario.model.categoria.DaoCategoria;
import mx.cds.utez.inventario.utils.Mensaje;

import java.util.List;

public class CategoriaAction extends ActionSupport {
    String datos;
    private BeanCategoria categoria = new BeanCategoria();
     Mensaje mensaje = new Mensaje();

    public String findActivas (){
        mensaje = DaoCategoria.findActivas();
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
