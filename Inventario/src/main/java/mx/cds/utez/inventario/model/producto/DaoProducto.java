package mx.cds.utez.inventario.model.producto;

import mx.cds.utez.inventario.model.categoria.BeanCategoria;
import mx.cds.utez.inventario.utils.ConnectionMySQL;
import mx.cds.utez.inventario.utils.Mensaje;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    public static Mensaje registrar(BeanProducto producto){
        Mensaje mensaje = new Mensaje();
        int error, errorNombre, errorCategoria;
        Map<String, String> errores = new HashMap<>();
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("CALL registrar_producto(?, ?, ?, ?, ?, ?, ?, ?)");
            cstm.setString("p_nombre", producto.getNombre());
            cstm.setString("p_marca", producto.getMarca());
            cstm.setInt("p_precio", producto.getPrecio());
            cstm.setInt("p_cantidad", producto.getCantidad());
            cstm.setInt("p_categoria", producto.getIdCategoria().getId());
            cstm.registerOutParameter("p_error", Types.INTEGER);
            cstm.registerOutParameter("error_nombre", Types.INTEGER);
            cstm.registerOutParameter("error_categoria", Types.INTEGER);
            cstm.execute();

            error = cstm.getInt("p_error");
            errorNombre = cstm.getInt("error_nombre");
            errorCategoria = cstm.getInt("error_categoria");

            if(error == 0){
                mensaje.setMensaje("Se ha registrado correctamente");
                mensaje.setDatos(null);
                mensaje.setErrores(null);
                mensaje.setError(false);
            }else{
                mensaje.setMensaje("No se pudo registrar");
                mensaje.setDatos(null);
                if(errorNombre == 1) errores.put("nombre", "El nombre ya existe");
                if (errorCategoria == 1) errores.put("categoria", "La categoria no existe");
                mensaje.setErrores(errores);
                mensaje.setError(true);
            }


        }catch(SQLException e){
            System.out.printf("Hubo un error en el metodo de registrar producto " + e.getMessage());

        }finally {
            ConnectionMySQL.closeConnections(con, cstm);
        }

        return mensaje;
    }


    public static Mensaje actualizar(BeanProducto producto){
        Mensaje mensaje = new Mensaje();
        int error, errorNombre, errorCategoria, errorId;
        Map<String, String> errores = new HashMap<>();
        try{
            System.out.println(producto.getId());
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("CALL actualizar_producto(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            cstm.setInt("p_id", producto.getId());
            cstm.setString("p_nombre", producto.getNombre());
            cstm.setString("p_marca", producto.getMarca());
            cstm.setInt("p_precio", producto.getPrecio());
            cstm.setInt("p_cantidad", producto.getCantidad());
            cstm.setInt("p_categoria", producto.getIdCategoria().getId());
            cstm.registerOutParameter("p_error", Types.INTEGER);
            cstm.registerOutParameter("error_nombre", Types.INTEGER);
            cstm.registerOutParameter("error_categoria", Types.INTEGER);
            cstm.registerOutParameter("error_id", Types.INTEGER);
            cstm.execute();

            error = cstm.getInt("p_error");
            errorNombre = cstm.getInt("error_nombre");
            errorCategoria = cstm.getInt("error_categoria");
            errorId = cstm.getInt("error_id");

            if(error == 0){
                mensaje.setMensaje("Se ha actualizado correctamente");
                mensaje.setDatos(null);
                mensaje.setErrores(null);
                mensaje.setError(false);
            }else{
                mensaje.setMensaje("No se pudo actualizar");
                mensaje.setDatos(null);
                if(errorNombre == 1) errores.put("nombre", "El nombre ya existe");
                if (errorCategoria == 1) errores.put("categoria", "La categoria no existe");
                if (errorId == 1) errores.put("id", "El producto no existe");
                mensaje.setErrores(errores);
                mensaje.setError(true);
            }


        }catch(SQLException e){
            System.out.printf("Hubo un error en el metodo de actualizar producto " + e.getMessage());

        }finally {
            ConnectionMySQL.closeConnections(con, cstm);
        }

        return mensaje;
    }

    public static Mensaje eliminar(BeanProducto producto){
        Mensaje mensaje = new Mensaje();
        int error, errorId;
        Map<String, String> errores = new HashMap<>();
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("CALL eliminar_producto(?,?,?)");
             cstm.setInt("p_id", producto.getId());
            cstm.registerOutParameter("p_error", Types.INTEGER);
            cstm.registerOutParameter("error_id", Types.INTEGER);
            cstm.execute();

            error =cstm.getInt("p_error");
            errorId = cstm.getInt("error_id");

            if(error == 0){
                mensaje.setMensaje("Se ha hecho el cambio correctamente");
                mensaje.setDatos(null);
                mensaje.setErrores(null);
                mensaje.setError(false);
            }else{
                mensaje.setMensaje("No se pudo realizar el cambio");
                mensaje.setDatos(null);
                if (errorId == 1) errores.put("id", "El producto no existe");
                mensaje.setErrores(errores);
                mensaje.setError(true);
            }

        }catch(SQLException e){
            System.out.println("Hubo un error en el método eliminar " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con, cstm);
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
      BeanCategoria categoria = new BeanCategoria(1, null, 0);
        BeanProducto producto = new BeanProducto("Leche", "Lala", 200, 100, null, 0,categoria);
        Mensaje mensaje = DaoProducto.registrar(producto);
        System.out.println(mensaje.getMensaje());
         */


        BeanCategoria categoria = new BeanCategoria(1, null, 0);
        BeanProducto producto = new BeanProducto(1,"Pila", "Lala", 200, 100, null, 0,categoria);
        Mensaje mensaje = DaoProducto.actualizar(producto);
        System.out.println(mensaje.getMensaje());
        System.out.println(mensaje.getErrores().get("nombre"));
        System.out.println(mensaje.getErrores().get("categoria"));
        System.out.println(mensaje.getErrores().get("id"));


    }

}
