/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rw.ofbmrs.entities;

import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import org.hibernate.Query;
import org.hibernate.Session;
import rw.ofbmrs.hibernate.util.HibernateUtility;
import rw.ofbmrs.passwordEncryption.Encryption;


/**
 *
 * @author kay
 */
@Entity
@Inheritance(strategy = InheritanceType.JOINED)
public class User {
    private String firstName;
    private String lastName;
    private String gender;
    private Date dateOfBirth;
    private String role;
    private String phone;
    private String email;
    @Id
    private String username;
    private String password;
    private String status;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public void create(){
        Session session = HibernateUtility.getSession();
        session.beginTransaction();
        session.save(this);
        session.getTransaction().commit();
        session.close();
    }
    
    public void update(){
        Session session = HibernateUtility.getSession();
        session.beginTransaction();
        session.update(this);
        session.getTransaction().commit();
        session.close();
    }
    
    public void delete(){
        Session session = HibernateUtility.getSession();
        session.beginTransaction();
        session.delete(this);
        session.getTransaction().commit();
        session.close();
    }
    
    public List<User>getAll(){
        Session session = HibernateUtility.getSession();
        return session.createQuery("FROM User WHERE role != 'Admin'").list();
    }
    
    public User login(){
        Session session = HibernateUtility.getSession();
        Query query = session.createQuery("FROM User WHERE username = ?");
        query.setString(0, username);
        User user = (User) query.uniqueResult();
        if(user != null){
            if(Encryption.md5(password).equals(user.getPassword())){
                return user;
            }
            else{
                return null;
            }
        }
        else{
            return null;
        }
    }
    
    public User getUserByUsername(){
        Session session = HibernateUtility.getSession();
        Query query = session.createQuery("FROM User WHERE username = ?");
        query.setString(0, username);
        return (User) query.uniqueResult();
    }
}
