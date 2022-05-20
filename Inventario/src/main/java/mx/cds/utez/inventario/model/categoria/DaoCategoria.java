package mx.cds.utez.inventario.model.categoria;

import mx.cds.utez.inventario.utils.ConnectionMySQL;
import mx.cds.utez.inventario.utils.Mensaje;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoCategoria {
    private static ResultSet rs;
    private static Connection con;
    private static CallableStatement cstm;

    public static Mensaje  findActivas (){
        Mensaje mensaje = new Mensaje();
        List<BeanCategoria> categorias = new ArrayList<>();
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("CALL find_activas()");
            rs = cstm.executeQuery();

            while(rs.next()){
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

        }catch (SQLException e){
            System.out.println("Hubo un error en el metodo de findActivas " + e.getMessage());
        }finally {
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
    }
}
