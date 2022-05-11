package com.cds.utez.AngularJS.persona.model;

import javax.persistence.*;

@Entity
public class Persona {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @Column(name = "name", nullable = false, length = 25)
    private String name;
    @Column(name = "surname", nullable = false, length = 25)
    private String surname;
    @Column(name = "lastname", nullable = false, length = 25)
    private String lastname;

    public Persona() {
    }

    public Persona(String name, String surname, String lastname) {
        this.name = name;
        this.surname = surname;
        this.lastname = lastname;
    }

    public Persona(long id, String name, String surname, String lastname) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.lastname = lastname;
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
}
