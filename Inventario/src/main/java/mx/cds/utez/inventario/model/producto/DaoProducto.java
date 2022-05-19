package mx.cds.utez.inventario.model.producto;

import mx.cds.utez.inventario.model.categoria.BeanCategoria;
import mx.cds.utez.inventario.utils.ConnectionMySQL;
import mx.cds.utez.inventario.utils.Mensaje;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoProducto {
    private static ResultSet rs;
    private static Connection con;
    private static CallableStatement cstm;

    public static Mensaje findAll (){
        Mensaje mensaje = new Mensaje();
        List<BeanProducto> productos = new ArrayList<>();
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("CALL find_all()");
            rs = cstm.executeQuery();

            while(rs.next()){
                BeanProducto producto = new BeanProducto();
                BeanCategoria categoria = new BeanCategoria();
                producto.setId(rs.getInt("id_producto"));
                producto.setNombre(rs.getString("nombre_producto"));
                producto.setMarca(rs.getString("marca"));
                producto.setPrecio(rs.getInt("precio"));
                producto.setCantidad(rs.getInt("cantidad"));
                producto.setFecha(rs.getString("fecha"));
                producto.setEstado(rs.getInt("estado"));
                producto.setId(rs.getInt("id_producto"));
                categoria.setId(rs.getInt("id_categoria"));
                categoria.setNombre(rs.getString("nombre_categoria"));
                producto.setIdCategoria(categoria);
                productos.add(producto);
            }
            mensaje.setError(false);
            mensaje.setErrores(null);
            mensaje.setDatos(productos);
            mensaje.setMensaje("Ok");



        }catch (SQLException e){
            System.out.println("Hubo un error en el método findAll" + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con, cstm, rs);
        }

        return mensaje;
    }

    public static void main(String[] args) {
        /*
        Mensaje mensaje = DaoProducto.findAll();
        List<BeanProducto> productos = (List<BeanProducto> ) mensaje.getDatos();
        for (BeanProducto producto: productos) {
            System.out.println("Nombre " +  producto.getNombre());
        }

         */
    }

}
