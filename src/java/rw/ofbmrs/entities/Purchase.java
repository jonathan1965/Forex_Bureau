/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rw.ofbmrs.entities;

import java.util.List;
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
@PrimaryKeyJoinColumn(name = "transactionId")
public class Purchase extends Transaction{
    private String sourcesOfFund;

    public String getSourcesOfFund() {
        return sourcesOfFund;
    }

    public void setSourcesOfFund(String sourcesOfFund) {
        this.sourcesOfFund = sourcesOfFund;
    }
    
    public List<Purchase>getAllPurchases(){
        Session session = HibernateUtility.getSession();
        return session.createQuery("FROM Purchase").list();
    }
    
    public List<Purchase>getAllPurchasesByER(){
        Session session = HibernateUtility.getSession();
        Query query = session.createQuery("FROM Purchase WHERE exchangeRate_id = ? AND exchangeRate_foreignCurrency_id = ?");
        query.setInteger(0, this.getExchangeRate().getId());
        query.setInteger(1, this.getExchangeRate().getForeignCurrency().getId());
        return query.list();
    }
    
    public List<Purchase>getAllPurchasesByClient(){
        Session session = HibernateUtility.getSession();
        Query query = session.createQuery("FROM Purchase WHERE client_id = ?");
        query.setString(0, this.getClient().getId());
        return query.list();
    }
    
    public List<Purchase>getAllPurchasesByUser(){
        Session session = HibernateUtility.getSession();
        Query query = session.createQuery("FROM Purchase WHERE user_username");
        query.setString(0, this.getUser().getUsername());
        return query.list();
    }
}
