package com.cds.utez.AngularJS.persona.controller;

import com.cds.utez.AngularJS.persona.model.Persona;
import com.cds.utez.AngularJS.persona.model.PersonaRepository;
import com.cds.utez.AngularJS.utils.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLException;

@Service
@Transactional
public class PersonaService {
    @Autowired
    PersonaRepository personaRepository;

    @Transactional(readOnly = true)
    public ResponseEntity<Message> getAll(){
        return new ResponseEntity<Message>(new Message("ok", false, personaRepository.findAll()), HttpStatus.OK);
    }

    @Transactional(rollbackFor = {SQLException.class})
    public ResponseEntity<Message> insert (PersonaDTO personaDTO){
        Persona persona = new Persona(personaDTO.getName(), personaDTO.getSurname(), personaDTO.getLastname());

        Persona savePersona = personaRepository.saveAndFlush(persona);

        return new ResponseEntity<Message>(new Message("ok", false, savePersona),HttpStatus.OK);
    }

}
