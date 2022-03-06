/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rw.ofbmrs.model;

import rw.ofbmrs.entities.User;

/**
 *
 * @author kay
 */
public class UserModel {
    private User user = new User();

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
    public void update(){
        
    }
    
    public User login(){
        return  user.login();
    }
    
    public User getByUsername(){
        return user.getUserByUsername();
    }
    
    public void create(){
        user.create();
    }
}
