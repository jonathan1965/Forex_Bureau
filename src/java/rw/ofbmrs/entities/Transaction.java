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
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToOne;
import org.hibernate.Query;
import org.hibernate.Session;
import rw.ofbmrs.hibernate.util.HibernateUtility;

/**
 *
 * @author kay
 */
@Entity
@Inheritance(strategy = InheritanceType.JOINED)
public class Transaction implements Serializable {
    @Id @GeneratedValue
    private int id;
    @ManyToOne
    private Client client;
    @ManyToOne
    private User user;
    @ManyToOne
    private ExchangeRate exchangeRate;
    private float lcAmount;
    private float fcAmount;
    private String purpose;
    private Date transDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getTransDate() {
        return transDate;
    }

    public void setTransDate(Date transDate) {
        this.transDate = transDate;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public ExchangeRate getExchangeRate() {
        return exchangeRate;
    }

    public void setExchangeRate(ExchangeRate exchangeRate) {
        this.exchangeRate = exchangeRate;
    }

    public float getLcAmount() {
        return lcAmount;
    }

    public void setLcAmount(float lcAmount) {
        this.lcAmount = lcAmount;
    }

    public float getFcAmount() {
        return fcAmount;
    }

    public void setFcAmount(float fcAmount) {
        this.fcAmount = fcAmount;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 67 * hash + Objects.hashCode(this.client);
        hash = 67 * hash + Objects.hashCode(this.user);
        hash = 67 * hash + Objects.hashCode(this.exchangeRate);
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
        final Transaction other = (Transaction) obj;
        if (!Objects.equals(this.client, other.client)) {
            return false;
        }
        if (!Objects.equals(this.user, other.user)) {
            return false;
        }
        if (!Objects.equals(this.exchangeRate, other.exchangeRate)) {
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
    
    public List<Transaction>getAll(){
        Session session = HibernateUtility.getSession();
        return session.createQuery("FROM Transaction").list();
    }
    
    public List<Transaction>getAllByER(){
        Session session = HibernateUtility.getSession();
        Query query = session.createQuery("FROM Transaction WHERE exchangeRate_id = ? AND exchangeRate_foreignCurrency_id = ?");
        query.setInteger(0, exchangeRate.getId());
        query.setInteger(1, exchangeRate.getForeignCurrency().getId());
        return query.list();
    }
    
    public List<Transaction>getAllByClient(){
        Session session = HibernateUtility.getSession();
        Query query = session.createQuery("FROM Transaction WHERE client_id = ?");
        query.setString(0, client.getId());
        return query.list();
    }
    
    public List<Transaction>getAllByUser(){
        Session session = HibernateUtility.getSession();
        Query query = session.createQuery("FROM Transaction WHERE user_username");
        query.setString(0, user.getUsername());
        return query.list();
    }
}
