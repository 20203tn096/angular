package mx.cds.utez.inventario.model.categoria;

import mx.cds.utez.inventario.utils.ConnectionMySQL;
import mx.cds.utez.inventario.utils.Mensaje;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import mx.cds.utez.inventario.model.producto.BeanProducto;

public class DaoCategoria {

    private static ResultSet rs;
    private static Connection con;
    private static CallableStatement cstm;

    public static Mensaje findActivas() {
        Mensaje mensaje = new Mensaje();
        List<BeanCategoria> categorias = new ArrayList<>();
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("CALL find_activas()");
            rs = cstm.executeQuery();

            while (rs.next()) {
                BeanCategoria categoria = new BeanCategoria();
                categoria.setId(rs.getInt("id_categoria"));
                categoria.setNombre(rs.getString("nombre_categoria"));
                categoria.setEstado(rs.getInt("estado"));
                categorias.add(categoria);
            }
            mensaje.setError(false);
            mensaje.setDatos(categorias);
            mensaje.setErrores(null);
            mensaje.setMensaje("Ok");

        } catch (SQLException e) {
            System.out.println("Hubo un error en el metodo de findActivas " + e.getMessage());
        } finally {
            ConnectionMySQL.closeConnections(con, cstm);
        }

        return mensaje;
    }

    public static Mensaje findAll() {
        Mensaje mensaje = new Mensaje();
        List<BeanCategoria> categorias = new ArrayList<>();
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("CALL find_all_categorias()");
            rs = cstm.executeQuery();

            while (rs.next()) {
                BeanCategoria categoria = new BeanCategoria();
                categoria.setId(rs.getInt("id_categoria"));
                categoria.setNombre(rs.getString("nombre_categoria"));
                categoria.setEstado(rs.getInt("estado"));
                categorias.add(categoria);
            }
            mensaje.setError(false);
            mensaje.setDatos(categorias);
            mensaje.setErrores(null);
            mensaje.setMensaje("Ok");

        } catch (SQLException e) {
            System.out.println("Hubo un error en el metodo de findAll " + e.getMessage());
        } finally {
            ConnectionMySQL.closeConnections(con, cstm);
        }

        return mensaje;
    }

    public static Mensaje registrar(BeanCategoria categoria) {
        Mensaje mensaje = new Mensaje();
        int error, errorNombre;
        Map<String, String> errores = new HashMap<>();
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("CALL registrar_categoria(?, ?, ?)");
            cstm.setString("p_nombre", categoria.getNombre());
            cstm.registerOutParameter("p_error", Types.INTEGER);
            cstm.registerOutParameter("error_nombre", Types.INTEGER);
            cstm.execute();

            error = cstm.getInt("p_error");
            errorNombre = cstm.getInt("error_nombre");

            if (error == 0) {
                mensaje.setMensaje("Se ha registrado correctamente");
                mensaje.setDatos(null);
                mensaje.setErrores(null);
                mensaje.setError(false);
            } else {
                mensaje.setMensaje("No se pudo registrar");
                mensaje.setDatos(null);
                if (errorNombre == 1) {
                    errores.put("nombre", "El nombre ya existe");
                }
                mensaje.setErrores(errores);
                mensaje.setError(true);
            }

        } catch (SQLException e) {
            System.out.printf("Hubo un error en el metodo de registrar categoria " + e.getMessage());

        } finally {
            ConnectionMySQL.closeConnections(con, cstm);
        }

        return mensaje;
    }

    public static Mensaje modificar(BeanCategoria categoria) {
        Mensaje mensaje = new Mensaje();
        int error, errorNombre, errorId;
        Map<String, String> errores = new HashMap<>();
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("CALL actualizar_categoria(?, ?, ?, ?, ?)");
            cstm.setInt("p_id", categoria.getId());
            cstm.setString("p_nombre", categoria.getNombre());
            cstm.registerOutParameter("p_error", Types.INTEGER);
            cstm.registerOutParameter("error_nombre", Types.INTEGER);
            cstm.registerOutParameter("error_id", Types.INTEGER);

            cstm.execute();

            error = cstm.getInt("p_error");
            errorNombre = cstm.getInt("error_nombre");
            errorId = cstm.getInt("error_id");

            if (error == 0) {
                mensaje.setMensaje("Se ha actualizado correctamente");
                mensaje.setDatos(null);
                mensaje.setErrores(null);
                mensaje.setError(false);
            } else {
                mensaje.setMensaje("No se pudo actualizar");
                mensaje.setDatos(null);
                if (errorNombre == 1) {
                    errores.put("nombre", "El nombre ya existe");
                }
                if (errorId == 1) {
                    errores.put("id", "La categoría no existe");
                }
                mensaje.setErrores(errores);
                mensaje.setError(true);
            }

        } catch (SQLException e) {
            System.out.printf("Hubo un error en el metodo de actualizar categoria " + e.getMessage());

        } finally {
            ConnectionMySQL.closeConnections(con, cstm);
        }

        return mensaje;
    }

    public static Mensaje eliminar(BeanCategoria categoria) {
        Mensaje mensaje = new Mensaje();
        int error, errorId, errorForanea;
        Map<String, String> errores = new HashMap<>();
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("CALL eliminar_categoria(?,?,?,?)");
            cstm.setInt("p_id", categoria.getId());
            cstm.registerOutParameter("p_error", Types.INTEGER);
            cstm.registerOutParameter("error_foranea", Types.INTEGER);
            cstm.registerOutParameter("error_id", Types.INTEGER);
            cstm.execute();

            error = cstm.getInt("p_error");
            errorId = cstm.getInt("error_id");
            errorForanea = cstm.getInt("error_foranea");

            if (error == 0) {
                mensaje.setMensaje("Se ha hecho el cambio correctamente");
                mensaje.setDatos(null);
                mensaje.setErrores(null);
                mensaje.setError(false);
            } else {
                mensaje.setMensaje("No se pudo realizar el cambio");
                mensaje.setDatos(null);
                if (errorId == 1) {
                    errores.put("id", "La categoría no existe");
                }
                 if (errorForanea == 1) {
                    errores.put("foranea", "La categoría contiene productos enlazados");
                }
                mensaje.setErrores(errores);
                mensaje.setError(true);
            }

        } catch (SQLException e) {
            System.out.println("Hubo un error en el método eliminar " + e.getMessage());
        } finally {
            ConnectionMySQL.closeConnections(con, cstm);
        }
        return mensaje;
    }

    public static void main(String[] args) {
        /*Mensaje mensaje = DaoCategoria.findActivas();
        List<BeanCategoria> categorias = (List<BeanCategoria>) mensaje.getDatos();
        for (BeanCategoria categoria: categorias) {
            System.out.println("Nombre " +  categoria.getNombre());
        }

         */

        BeanCategoria categoria = new BeanCategoria(3, "hhhh", 0);
        Mensaje mensaje = DaoCategoria.eliminar(categoria);
        System.out.println(mensaje.getMensaje());
    }
}
