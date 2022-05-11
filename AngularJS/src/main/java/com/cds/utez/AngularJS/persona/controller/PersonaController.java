package com.cds.utez.AngularJS.persona.controller;

import com.cds.utez.AngularJS.utils.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/persona")
@CrossOrigin(origins = {"*"})
public class PersonaController {
    @Autowired
    PersonaService personaService;

    @GetMapping("/")
    public ResponseEntity<Message> getAll(){
        return personaService.getAll();
    }

    @PostMapping("/")
    public  ResponseEntity<Message> insert(@RequestBody PersonaDTO personaDTO){
        System.out.println(personaDTO.getName());
        System.out.println(personaDTO.getSurname());
        System.out.println(personaDTO.getLastname());
        return personaService.insert(personaDTO);
    }
}
