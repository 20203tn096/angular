package beans;

public class BeanPersona {
    private long id;
    private String name;
    private String surname;
    private String lastname;
    private int edad;
    private String curp;
    private int estado;

    public BeanPersona() {
    }

    public BeanPersona(String name, String surname, String lastname, int edad, String curp, int estado) {
        this.name = name;
        this.surname = surname;
        this.lastname = lastname;
        this.edad = edad;
        this.curp = curp;
        this.estado = estado;
    }

    public BeanPersona(long id, String name, String surname, String lastname, int edad, String curp, int estado) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.lastname = lastname;
        this.edad = edad;
        this.curp = curp;
        this.estado = estado;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getCurp() {
        return curp;
    }

    public void setCurp(String curp) {
        this.curp = curp;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
}
