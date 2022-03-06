/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rw.ofbmrs.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
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
public class ExchangeRate implements Serializable {
    @Id @GeneratedValue
    private int id;
    @ManyToOne
    private ForeignCurrency foreignCurrency = new ForeignCurrency();
    private float actualSellingRate;
    private float minSellingRate;
    private float maxSellingRate;
    private float actualPurchasingRate;
    private float minPurchasingRate;
    private float maxPurchasingRate;
    private String status;
    private Date date;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ForeignCurrency getForeignCurrency() {
        return foreignCurrency;
    }

    public void setForeignCurrency(ForeignCurrency foreignCurrency) {
        this.foreignCurrency = foreignCurrency;
    }

    public float getActualSellingRate() {
        return actualSellingRate;
    }

    public void setActualSellingRate(float actualSellingRate) {
        this.actualSellingRate = actualSellingRate;
    }

    public float getMinSellingRate() {
        return minSellingRate;
    }

    public void setMinSellingRate(float minSellingRate) {
        this.minSellingRate = minSellingRate;
    }

    public float getMaxSellingRate() {
        return maxSellingRate;
    }

    public void setMaxSellingRate(float maxSellingRate) {
        this.maxSellingRate = maxSellingRate;
    }

    public float getActualPurchasingRate() {
        return actualPurchasingRate;
    }

    public void setActualPurchasingRate(float actualPurchasingRate) {
        this.actualPurchasingRate = actualPurchasingRate;
    }

    public float getMinPurchasingRate() {
        return minPurchasingRate;
    }

    public void setMinPurchasingRate(float minPurchasingRate) {
        this.minPurchasingRate = minPurchasingRate;
    }

    public float getMaxPurchasingRate() {
        return maxPurchasingRate;
    }

    public void setMaxPurchasingRate(float maxPurchasingRate) {
        this.maxPurchasingRate = maxPurchasingRate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 53 * hash + Objects.hashCode(this.foreignCurrency);
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
        final ExchangeRate other = (ExchangeRate) obj;
        if (!Objects.equals(this.foreignCurrency, other.foreignCurrency)) {
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
    
    public List<ExchangeRate>getAll(){
        Session session = HibernateUtility.getSession();
        List<ExchangeRate>all = session.createQuery("FROM ExchangeRate where status = 'On use'").list();
        return all;
    }
    
    public List<ExchangeRate>getAllByFC(){
        Session session = HibernateUtility.getSession();
        Query query = session.createQuery("FROM ExchangeRate WHERE foreignCurrency_id = ?");
        query.setInteger(0, foreignCurrency.getId());
        return query.list();
    }
    
    public ExchangeRate getFcLatestRate(){
        Session session = HibernateUtility.getSession();
        Query query = session.createQuery("FROM ExchangeRate WHERE foreignCurrency_id = ? AND status = 'On use'");
        query.setInteger(0, foreignCurrency.getId());
        return (ExchangeRate) query.uniqueResult();
    }
}
