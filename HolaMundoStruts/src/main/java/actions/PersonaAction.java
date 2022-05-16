/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package actions;

import beans.Persona;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.util.Random;

/**
 *
 * @author CDS
 */
public class PersonaAction extends ActionSupport {

    String params;
    private Persona persona = new Persona();
    private String curp;
    Gson gs = new Gson();

    public String getParams() {
        return params;
    }

    public void setParams(String params) {
        this.params = params;
    }

    

    public String getPersona() {
        System.out.println("Datos " +  params);
        persona = gs.fromJson(params, Persona.class);
        System.out.println("Hola");
        System.out.println("Persona" +  persona);
        String resultado = sustraerNombre(persona.getNombre(), persona.getApellidoPaterno(), persona.getApellidoMaterno()) + sustraerFecha(persona.getFecha()) + persona.getGenero() +  
                     persona.getEntidad() +  primeraConstante(persona.getNombre()) + primeraConstante(persona.getApellidoPaterno()) + primeraConstante(persona.getApellidoMaterno()) +
                    numeroAleatorio() + numeroAleatorio();
        this.curp = resultado.toUpperCase();
        return SUCCESS;
    }

    public String sustraerNombre(String nombre, String apellido1, String apellido2) {
        String resultado = apellido1.substring(0, 2) + apellido2.substring(0, 1) + nombre.substring(0, 1);
        return resultado.toUpperCase();
    }

    public String sustraerFecha(String fecha) {
        String resultado = fecha.substring(2, 4) + fecha.substring(5, 7) + fecha.substring(8, 10);
        return resultado;
    }

    public char primeraConstante(String cadena) {
        char resultado = 0;
        for (int i = 0; i < cadena.length(); i++) {
            char letra = cadena.charAt(i);
            if (esConsonante(letra)) {
                resultado = letra;
                break;
            }
        }
        return resultado;
    }

    public String getCurp() {
        return curp;
    }

    public void setCurp(String curp) {
        this.curp = curp;
    }

    public static boolean esConsonante(char letra) {
        return "bcdfghjklmnñpqrstvwxyz".contains(String.valueOf(letra).toLowerCase());
    }
    
    public int numeroAleatorio(){
       Random random = new Random();
       return random.nextInt(10 + 1) + 1;
    }
}
