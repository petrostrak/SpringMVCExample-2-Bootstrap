/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.afdemp.trainermvc.services;

import java.util.List;
import org.afdemp.trainermvc.dao.TrainerDaoImpl;
import org.afdemp.trainermvc.entities.Trainer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author petros_trak
 */
@Service("trainerService")
@Transactional
public class TrainerImpl implements ITrainer {

    private String listurl = "list";
    private String editurl = "edit";
    private String deleteurl = "delete";
    private String updateurl = "update";

    public String getListUrl() {
        return listurl;
    }

    public String getEditUrl() {
        return editurl;
    }

    public String getDeleteUrl() {
        return deleteurl;
    }

    public String getUpdateUrl() {
        return updateurl;
    }

    @Autowired
    TrainerDaoImpl dao;

    public List<Trainer> findAll() {
        List<Trainer> trainers = dao.findAll();
        return trainers;
    }

    public Trainer findById(int id) {
        return dao.findById(id);
    }

    public boolean save(Trainer trainer) {
        return dao.save(trainer);
    }

    public boolean delete(int id) {
        return dao.delete(id);
    }

    public boolean update(Trainer trainer) {
        return dao.update(trainer);
    }

    protected String convertTextToUpper(String text) {
        return text.toUpperCase();
    }
}
