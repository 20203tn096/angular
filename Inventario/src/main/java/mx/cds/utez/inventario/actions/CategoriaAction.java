package mx.cds.utez.inventario.actions;

import com.google.gson.Gson;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import mx.cds.utez.inventario.model.categoria.BeanCategoria;
import mx.cds.utez.inventario.model.categoria.DaoCategoria;
import mx.cds.utez.inventario.utils.Mensaje;

import java.util.List;

public class CategoriaAction extends ActionSupport {

    Gson gs = new Gson();
    String datos;
    private BeanCategoria categoria = new BeanCategoria();
    Mensaje mensaje = new Mensaje();
    
    public String findActivas() {
        mensaje = DaoCategoria.findActivas();
        return SUCCESS;
    }
    
    public String findAllCategorias() {
        mensaje = DaoCategoria.findAll();
        return SUCCESS;
    }
    
    public String registrarCategoria() {
        categoria = gs.fromJson(datos, BeanCategoria.class);
        try {
            mensaje = DaoCategoria.registrar(categoria);
            System.out.println(mensaje.getErrores().get("nombre"));
        } catch (Exception e) {
            System.out.println("error" + e.getMessage());
        }
        return SUCCESS;
    }

    public String actualizarCategoria() {
        categoria = gs.fromJson(datos, BeanCategoria.class);
        try {
            mensaje = DaoCategoria.modificar(categoria);
            System.out.println(mensaje.getErrores().get("nombre"));
        } catch (Exception e) {
            System.out.println("error" + e.getMessage());
        }
        return SUCCESS;
    }
    
    public String eliminarCategoria() {
        categoria = gs.fromJson(datos, BeanCategoria.class);
        try {
            mensaje = DaoCategoria.eliminar(categoria);
            System.out.println(mensaje.getErrores().get("nombre"));
        } catch (Exception e) {
            System.out.println("error" + e.getMessage());
        }
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
