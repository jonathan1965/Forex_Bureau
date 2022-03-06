/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rw.ofbmrs.entities;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import org.hibernate.Query;
import org.hibernate.Session;
import rw.ofbmrs.hibernate.util.HibernateUtility;

/**
 *
 * @author kay
 */
@Entity
@PrimaryKeyJoinColumn(name = "userId")
public class Administrator extends User implements Serializable{
    public Administrator getByUsername(){
        Session session = HibernateUtility.getSession();
        Query query = session.createQuery("FROM Administrator WHERE username = ?");
        query.setString(0, this.getUsername());
        return (Administrator) query.uniqueResult();
    }
}
