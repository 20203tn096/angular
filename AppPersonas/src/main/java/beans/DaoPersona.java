package beans;
 
import utils.ConnectionMySQL;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoPersona {

    private static ResultSet rs;
    private static CallableStatement cstm;
    private static Connection con;

    public static List<BeanPersona> findAll() {
        List<BeanPersona> personas = new ArrayList<>();
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("CALL findAll()");
            rs = cstm.executeQuery();

            while (rs.next()) {
                BeanPersona persona = new BeanPersona();
                persona.setId(rs.getLong("id"));
                persona.setName(rs.getString("name_person"));
                persona.setSurname(rs.getString("surname"));
                persona.setLastname(rs.getString("lastname"));
                persona.setEdad(rs.getInt("edad"));
                persona.setCurp(rs.getString("curp"));
                persona.setEstado(rs.getInt("estado"));
                personas.add(persona);
            }

        } catch (SQLException e) {
            System.out.printf("Hubo un error en el metodo de findAll " + e.getMessage());
        } finally {
            ConnectionMySQL.closeConnections(con, cstm, rs);
        }

        return personas;
    }

    public static BeanPersona getById(long id) {
        BeanPersona persona = new BeanPersona();
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("CALL getById(?)");
            cstm.setLong("p_id", id);
            rs = cstm.executeQuery();

            if (rs.next()) {
                persona.setId(rs.getLong("id"));
                persona.setName(rs.getString("name_person"));
                persona.setSurname(rs.getString("surname"));
                persona.setLastname(rs.getString("lastname"));
                persona.setEdad(rs.getInt("edad"));
                persona.setCurp(rs.getString("curp"));
                persona.setEstado(rs.getInt("estado"));
            } else {
                persona = null;
            }

        } catch (SQLException e) {
            System.out.printf("Hubo un error en el metodo de getById " + e.getMessage());
        } finally {
            ConnectionMySQL.closeConnections(con, cstm, rs);
        }

        return persona;
    }

    public static boolean register(BeanPersona persona) {
        boolean flag = false;
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("CALL register(?,?,?,?,?)");
            cstm.setString("p_name_person", persona.getName());
            cstm.setString("p_surname", persona.getSurname());
            cstm.setString("p_lastname", persona.getLastname());
            cstm.setInt("p_edad", persona.getEdad());
            cstm.setString("p_curp", persona.getCurp());
            flag = cstm.execute();

        } catch (SQLException e) {
            System.out.printf("Hubo un error en el metodo de register " + e.getMessage());
        } finally {
            ConnectionMySQL.closeConnections(con, cstm);
        }

        return !flag;
    }

    public static boolean update(BeanPersona persona, long id) {
        boolean flag = false;
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("CALL updatePerson(?,?,?,?,?,?)");
            cstm.setLong("p_id", id);
            cstm.setString("p_name_person", persona.getName());
            cstm.setString("p_surname", persona.getSurname());
            cstm.setString("p_lastname", persona.getLastname());
            cstm.setInt("p_edad", persona.getEdad());
            cstm.setString("p_curp", persona.getCurp());
            flag = cstm.execute();

        } catch (SQLException e) {
            System.out.printf("Hubo un error en el metodo de update " + e.getMessage());
        } finally {
            ConnectionMySQL.closeConnections(con, cstm);
        }

        return !flag;
    }

    public static boolean delete(long id) {
        boolean flag = false;
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("CALL deletePerson(?)");
            cstm.setLong("p_id", id);
            flag = cstm.execute();

        } catch (SQLException e) {
            System.out.printf("Hubo un error en el metodo de delete " + e.getMessage());
        } finally {
            ConnectionMySQL.closeConnections(con, cstm);
        }

        return !flag;
    }

     public static boolean restablecer(long id) {
        boolean flag = false;
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("CALL restablecer(?)");
            cstm.setLong("p_id", id);
            flag = cstm.execute();

        } catch (SQLException e) {
            System.out.printf("Hubo un error en el metodo de restablecer " + e.getMessage());
        } finally {
            ConnectionMySQL.closeConnections(con, cstm);
        }

        return !flag;
    }
     
     
    public static void main(String[] args) {
        /*List<BeanPersona> personas = new ArrayList<>();
        personas = DaoPersona.findAll();
        System.out.println(personas.size());
        for (BeanPersona persona:
             personas) {
            System.out.println("Nombre " + persona.getId());
            System.out.println("Nombre " + persona.getName());
            System.out.println("Nombre " + persona.getSurname());
            System.out.println("Nombre " + persona.getLastname());
            System.out.println("Nombre " + persona.getCurp());
            System.out.println("Nombre " + persona.getEdad());
            System.out.println("Nombre " + persona.getEstado());
        }
*/



/*
        BeanPersona persona = new BeanPersona(1, "Miguel", "Mora", "Delfino", 14, "MDODODAOAHAS", 1);
        if (update(persona, persona.getId())) System.out.println("Se ha modificado");
        else System.out.println("No se actualizo");
            if(delete(3)) System.out.println("Se ha eliminado");
    else System.out.println("No se ha eliminado");
     BeanPersona persona = getById(1);
        System.out.println("Nombre "+ persona.getName());

 */


    }


}
