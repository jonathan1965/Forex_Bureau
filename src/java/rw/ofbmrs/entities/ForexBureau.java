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
public class ForexBureau implements Serializable {
    @Id
    private String licenseNo;
    private String name;
    @ManyToOne
    private Cell cell = new Cell();

    public String getLicenseNo() {
        return licenseNo;
    }

    public void setLicenseNo(String licenseNo) {
        this.licenseNo = licenseNo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Cell getCell() {
        return cell;
    }

    public void setCell(Cell cell) {
        this.cell = cell;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 53 * hash + Objects.hashCode(this.cell);
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
        final ForexBureau other = (ForexBureau) obj;
        if (!Objects.equals(this.cell, other.cell)) {
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
    
    public List<ForexBureau>getAll(){
        Session session = HibernateUtility.getSession();
        return session.createQuery("FROM ForexBureau").list();
    }
    
    public List<ForexBureau>getAllByCell(){
        Session session = HibernateUtility.getSession();
        Query query = session.createQuery("FROM ForexBureau WHERE cell_id = ?");
        query.setInteger(0, cell.getId());
        return query.list();
    }
}
