package mx.cds.utez.inventario.model.producto;

import mx.cds.utez.inventario.model.categoria.BeanCategoria;

public class BeanProducto {
    private int id;
    private String nombre;
    private String marca;
    private int precio;
    private int cantidad;
    private String fecha;
    private int estado;
    private BeanCategoria idCategoria;

    public BeanProducto() {
    }

    public BeanProducto(String nombre, String marca, int precio, int cantidad, String fecha, int estado, BeanCategoria idCategoria) {
        this.nombre = nombre;
        this.marca = marca;
        this.precio = precio;
        this.cantidad = cantidad;
        this.fecha = fecha;
        this.estado = estado;
        this.idCategoria = idCategoria;
    }

    public BeanProducto(int id, String nombre, String marca, int precio, int cantidad, String fecha, int estado, BeanCategoria idCategoria) {
        this.id = id;
        this.nombre = nombre;
        this.marca = marca;
        this.precio = precio;
        this.cantidad = cantidad;
        this.fecha = fecha;
        this.estado = estado;
        this.idCategoria = idCategoria;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public BeanCategoria getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(BeanCategoria idCategoria) {
        this.idCategoria = idCategoria;
    }
}
