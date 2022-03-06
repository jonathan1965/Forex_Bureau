/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rw.ofbmrs.model;

import java.util.List;
import rw.ofbmrs.entities.ForexBureau;

/**
 *
 * @author kay
 */
public class ForexBureauModel {
    private ForexBureau forexBureau = new ForexBureau();

    public ForexBureau getForexBureau() {
        return forexBureau;
    }

    public void setForexBureau(ForexBureau forexBureau) {
        this.forexBureau = forexBureau;
    }
    
    public void create(){
        forexBureau.create();
    }
    
    public void update(){
        forexBureau.update();
    }
    
    public void delete(){
        forexBureau.delete();
    }
    
    public List<ForexBureau> getAll(){
        return forexBureau.getAll();
    }
}
