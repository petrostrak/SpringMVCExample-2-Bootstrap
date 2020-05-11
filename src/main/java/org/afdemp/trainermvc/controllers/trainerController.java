/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.afdemp.trainermvc.controllers;

import java.util.List;
import org.afdemp.trainermvc.entities.Trainer;
import org.afdemp.trainermvc.services.ITrainer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author petros_trak
 */

@Controller
public class trainerController {
    
    @Autowired
    ITrainer trainerService;
    
    @Autowired
    MessageSource messageSource;
    
    @RequestMapping(value = {"/", "/list"}, method = RequestMethod.GET)
    public String listAllTrainers(ModelMap view, @RequestParam(required = false) String msg){
        List<Trainer> trainers = trainerService.findAll();
        view.addAttribute("trainers", trainers);
        view.addAttribute("editurl", trainerService.getEditUrl());
        view.addAttribute("deleteurl", trainerService.getDeleteUrl());
        view.addAttribute("msg", msg);
        return("trainerlist");
    }
    
    @RequestMapping(value = "/new")
    public String newTrainer(ModelMap view){
        Trainer trainer = new Trainer();
        view.addAttribute("trainer", trainer);
        view.addAttribute("listurl", trainerService.getListUrl());
        return("newtrainer");
    }
    
    @RequestMapping(value = "/new", method = RequestMethod.POST)
    public String saveTrainer(ModelMap view, Trainer trainer){
        if(trainerService.save(trainer)){
            view.addAttribute("success", "User " + trainer.getFirstName() + " "+ trainer.getLastName() + " registered successfully");
            return("registrationsuccess");
            //view.addAttribute("msg", new String("The new Trainer has been saved!"));
        }
        else
        view.addAttribute("msg", new String("Something went wrong.."));
        view.addAttribute("listurl", trainerService.getListUrl());
        return("newtrainer");
    }
    
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String deleteTrainer(ModelMap view, @PathVariable int id){
        if(trainerService.delete(id))
            view.addAttribute("msg", new String("The Trainer has been deleted successfully!"));
        else
            view.addAttribute("msg", new String("Something went wrong.."));
        return("redirect:/list");
    }
    
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String editTrainer(ModelMap view, @PathVariable int id){
        Trainer trainer = trainerService.findById(id);
        view.addAttribute("trainer", trainer);
        view.addAttribute("updateurl", trainerService.getUpdateUrl());
        return("edittrainer");
    }
    
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateTrainer(ModelMap view, Trainer trainer){
        trainerService.update(trainer);
        view.addAttribute("msg", new String(""));
        return("redirect:/list");
    }
}
