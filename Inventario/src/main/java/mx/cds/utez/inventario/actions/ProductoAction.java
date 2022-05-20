package mx.cds.utez.inventario.actions;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import mx.cds.utez.inventario.model.producto.BeanProducto;
import mx.cds.utez.inventario.model.producto.DaoProducto;
import mx.cds.utez.inventario.utils.Mensaje;

public class ProductoAction extends ActionSupport {

    Gson gs  = new Gson();
    String datos;
    Mensaje mensaje;
    private BeanProducto producto;

    public String findAll(){
        mensaje = DaoProducto.findAll();
        return SUCCESS;
    }

    public String registrarProducto(){
        producto = gs.fromJson(datos, BeanProducto.class);
        try {
            mensaje = DaoProducto.registrar(producto);
        }catch (Exception e){
            System.out.println("error" + e.getMessage());
        }
        return SUCCESS;
    }

    public String actualizarProducto(){
        producto = gs.fromJson(datos, BeanProducto.class);
        try {
            mensaje = DaoProducto.actualizar(producto);
        }catch (Exception e){
            System.out.println("error" + e.getMessage());
        }
        return SUCCESS;
    }

    public String eliminarProducto(){
        producto = gs.fromJson(datos, BeanProducto.class);
        try {
            mensaje = DaoProducto.eliminar(producto);
        }catch (Exception e){
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
