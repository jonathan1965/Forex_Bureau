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
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import org.hibernate.Query;
import org.hibernate.Session;
import rw.ofbmrs.hibernate.util.HibernateUtility;

/**
 *
 * @author kay
 */
@Entity
public class Sector implements Serializable {
    @Id @GeneratedValue
    private int id;
    private String name;
    @ManyToOne
    private District district = new District();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public District getDistrict() {
        return district;
    }

    public void setDistrict(District district) {
        this.district = district;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 29 * hash + Objects.hashCode(this.district);
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
        final Sector other = (Sector) obj;
        if (!Objects.equals(this.district, other.district)) {
            return false;
        }
        return true;
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
    
    public List<Sector>getAll(){
        Session session = HibernateUtility.getSession();
        return session.createQuery("FROM Sector").list();
    }
    
    public List<Sector>getAllByDistrict(){
        Session session = HibernateUtility.getSession();
        Query query = session.createQuery("FROM Sector WHERE district_id = ?");
        query.setInteger(0, district.getId());
        return query.list();
    }
}
