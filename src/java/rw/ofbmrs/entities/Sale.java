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
public class Sale extends Transaction {

    private String destinationCountry;

    public String getDestinationCountry() {
        return destinationCountry;
    }

    public void setDestinationCountry(String destinationCountry) {
        this.destinationCountry = destinationCountry;
    }

    public List<Sale> getAllSales() {
        Session session = HibernateUtility.getSession();
        return session.createQuery("FROM Sale").list();
    }

    public List<Sale> getAllSalesByER() {
        Session session = HibernateUtility.getSession();
        Query query = session.createQuery("FROM Sale WHERE exchangeRate_id = ? AND exchangeRate_foreignCurrency_id = ?");
        query.setInteger(0, this.getExchangeRate().getId());
        query.setInteger(1, this.getExchangeRate().getForeignCurrency().getId());
        return query.list();
    }

    public List<Sale> getAllSalesByClient() {
        Session session = HibernateUtility.getSession();
        Query query = session.createQuery("FROM Sale WHERE client_id = ?");
        query.setString(0, this.getClient().getId());
        return query.list();
    }

    public List<Sale> getAllSalesByUser() {
        Session session = HibernateUtility.getSession();
        Query query = session.createQuery("FROM Sale WHERE user_username");
        query.setString(0, this.getUser().getUsername());
        return query.list();
    }
}
