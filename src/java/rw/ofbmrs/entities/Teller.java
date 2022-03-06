/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rw.ofbmrs.entities;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
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
public class Teller extends User implements Serializable{
    @ManyToOne
    private ForexBureau forexBureau;

    public ForexBureau getForexBureau() {
        return forexBureau;
    }

    public void setForexBureau(ForexBureau forexBureau) {
        this.forexBureau = forexBureau;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 17 * hash + Objects.hashCode(this.forexBureau);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Teller other = (Teller) obj;
        if (!Objects.equals(this.forexBureau, other.forexBureau)) {
            return false;
        }
        return true;
    }
    
    public List<Teller>getAllTellers(){
        Session session = HibernateUtility.getSession();
        return session.createQuery("FROM Teller").list();
    }
    
    public List<Teller> getByForexBureau(){
        Session session = HibernateUtility.getSession();
        Query query = session.createQuery("FROM Teller WHERE forexBureau_licenseNo = ?");
        query.setString(0, forexBureau.getLicenseNo());
        return query.list();
    }
    
    
    public Teller getByUsername(){
        Session session = HibernateUtility.getSession();
        Query query = session.createQuery("FROM Teller WHERE username = ?");
        query.setString(0, this.getUsername());
        return (Teller) query.uniqueResult();
    }
}
