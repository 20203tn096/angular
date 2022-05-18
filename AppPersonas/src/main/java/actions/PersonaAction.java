package actions;

import beans.BeanPersona;
import beans.DaoPersona;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;


import java.util.ArrayList;
import java.util.List;


public class PersonaAction extends ActionSupport {

    private BeanPersona persona = new BeanPersona();
    List<BeanPersona> personas =new ArrayList<>();
    String datos;
    boolean insert;
    boolean update;
    boolean delete;
    boolean restablecer;
    Gson gs  = new Gson();

    public String findAll (){
        personas = DaoPersona.findAll();
        return SUCCESS;
    }
    public String update (){
        persona = gs.fromJson(datos, BeanPersona.class);
        update = DaoPersona.update(persona, persona.getId());
        return SUCCESS;
    }
    
     public String insert (){
        persona = gs.fromJson(datos, BeanPersona.class);
        insert = DaoPersona.register(persona);
        return SUCCESS;
    }
     
      public String delete (){
       persona = gs.fromJson(datos, BeanPersona.class);
        delete = DaoPersona.delete(persona.getId());
        return SUCCESS;
    }
     public String restablecer (){
       persona = gs.fromJson(datos, BeanPersona.class);
         System.out.println("Persona" + persona.getId());
         try{
       restablecer = DaoPersona.restablecer(persona.getId());
         }catch(Exception e){
             System.out.println("error" + e.getMessage());
         }
       return SUCCESS;
    }

    public List<BeanPersona> getPersonas() {
        return personas;
    }

    public void setPersonas(List<BeanPersona> personas) {
        this.personas = personas;
    }


    public String getDatos() {
        return datos;
    }

    public void setDatos(String datos) {
        this.datos = datos;
    }

    public boolean isInsert() {
        return insert;
    }

    public void setInsert(boolean insert) {
        this.insert = insert;
    }

    public boolean isUpdate() {
        return update;
    }

    public void setUpdate(boolean update) {
        this.update = update;
    }

    public boolean isDelete() {
        return delete;
    }

    public void setDelete(boolean delete) {
        this.delete = delete;
    }

    public boolean isRestablecer() {
        return restablecer;
    }

    public void setRestablecer(boolean restablecer) {
        this.restablecer = restablecer;
    }
    
}
