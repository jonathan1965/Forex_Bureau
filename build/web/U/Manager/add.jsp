<%@page import="rw.ofbmrs.entities.Sale"%>
<%@page import="rw.ofbmrs.entities.Client"%>
<%@page import="rw.ofbmrs.entities.Purchase"%>
<%@page import="rw.ofbmrs.entities.ExchangeRate"%>
<%@page import="rw.ofbmrs.entities.ForeignCurrency"%>
<%@page import="rw.ofbmrs.entities.User"%>
<%@page import="rw.ofbmrs.entities.Manager"%>
<%@page import="rw.ofbmrs.entities.Teller"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="rw.ofbmrs.passwordEncryption.Encryption"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
    String output = "";
    String type = request.getParameter("type");
    if (type.equals("teller")) {
        Manager manager = new Manager();
        manager.setUsername(((User) session.getAttribute("user")).getUsername());
        manager = manager.getByUsername();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Teller teller = new Teller();
        teller.setFirstName(request.getParameter("firstName"));
        teller.setLastName(request.getParameter("lastName"));
        teller.setGender(request.getParameter("gender"));
        teller.setPhone(request.getParameter("phone"));
        teller.setEmail(request.getParameter("email"));
        teller.setDateOfBirth(sdf.parse(request.getParameter("dateOfBirth")));
        teller.setUsername(request.getParameter("username"));
        teller.setPassword(Encryption.md5(request.getParameter("password")));
        teller.setRole("Teller");
        teller.setStatus("Active");
        teller.setForexBureau(manager.getForexBureau());
        long dob = teller.getDateOfBirth().getTime() / 1000 / 3600 / 24;
        long tdy = new Date().getTime() / 1000 / 3600 / 24;

        try {
            if ((tdy - dob) / 365 > 17) {
                teller.create();
                output = "The Teller is added";
            } else{
                output = "Sorry, a teller should not be under 18 years!";
            }
        } catch (Exception e) {
            output = e.getMessage();
        }

    } else if (type.equals("purchase")) {
        ForeignCurrency foreignCurrency = new ForeignCurrency();
        foreignCurrency.setId(Integer.parseInt(request.getParameter("foreignCurrency")));
        foreignCurrency = foreignCurrency.getById();

        ExchangeRate exchangeRate = new ExchangeRate();
        exchangeRate.setForeignCurrency(foreignCurrency);
        exchangeRate = exchangeRate.getFcLatestRate();
        if (request.getParameter("exchangeRate") != null) {
            float rate = Float.parseFloat(request.getParameter("exchangeRate"));
            if (rate < exchangeRate.getMinPurchasingRate() || rate > exchangeRate.getMaxPurchasingRate()) {
                output = "The minimum rate is Rwf" + exchangeRate.getMinPurchasingRate() + " and the maximum is Rwf" + exchangeRate.getMaxPurchasingRate() + " for purchasing a " + foreignCurrency.getUnit();
            } else {
                float lcAmount = rate * Float.parseFloat(request.getParameter("amount"));
                Purchase purchase = new Purchase();
                Client client = new Client();
                client.setId(request.getParameter("nationalId"));
                client.setNames(request.getParameter("names"));
                client.setResidenceType(request.getParameter("residenceType"));
                try {
                    client.create();
                } catch (Exception e) {
                    output = e.getMessage();
                }
                purchase.setClient(client);
                purchase.setExchangeRate(exchangeRate);
                purchase.setFcAmount(Float.parseFloat(request.getParameter("amount")));
                purchase.setLcAmount(lcAmount);
                purchase.setPurpose(request.getParameter("purpose"));
                purchase.setSourcesOfFund(request.getParameter("source"));
                purchase.setTransDate(new Date());
                purchase.setUser((User) session.getAttribute("user"));

                try {
                    purchase.create();
                    output = "The purchase is recorded";
                } catch (Exception e) {
                    output = e.getMessage();
                }

            }
        } else {
            float lcAmount = exchangeRate.getActualPurchasingRate() * Float.parseFloat(request.getParameter("amount"));
            Purchase purchase = new Purchase();
            Client client = new Client();
            client.setId(request.getParameter("nationalId"));
            client.setNames(request.getParameter("names"));
            client.setResidenceType(request.getParameter("residence"));
            try {
                client.create();
            } catch (Exception e) {
                output = e.getMessage();
            }
            purchase.setClient(client);
            purchase.setExchangeRate(exchangeRate);
            purchase.setFcAmount(Float.parseFloat(request.getParameter("amount")));
            purchase.setLcAmount(lcAmount);
            purchase.setPurpose(request.getParameter("purpose"));
            purchase.setSourcesOfFund(request.getParameter("source"));
            purchase.setTransDate(new Date());
            purchase.setUser((User) session.getAttribute("user"));

            try {
                purchase.create();
                output = "The purchase is recorded";
            } catch (Exception e) {
                output = e.getMessage();
            }
        }
    } else if (type.equals("sale")) {
        ForeignCurrency foreignCurrency = new ForeignCurrency();
        foreignCurrency.setId(Integer.parseInt(request.getParameter("foreignCurrency")));
        foreignCurrency = foreignCurrency.getById();

        ExchangeRate exchangeRate = new ExchangeRate();
        exchangeRate.setForeignCurrency(foreignCurrency);
        exchangeRate = exchangeRate.getFcLatestRate();
        if (request.getParameter("exchangeRate") != null) {
            float rate = Float.parseFloat(request.getParameter("exchangeRate"));
            if (rate < exchangeRate.getMinSellingRate() || rate > exchangeRate.getMaxSellingRate()) {
                output = "The minimum rate is Rwf" + exchangeRate.getMinPurchasingRate() + " and the maximum is Rwf" + exchangeRate.getMaxPurchasingRate() + " for selling a " + foreignCurrency.getUnit();
            } else {
                float lcAmount = rate * Float.parseFloat(request.getParameter("amount"));
                Sale sale = new Sale();
                Client client = new Client();
                client.setId(request.getParameter("nationalId"));
                client.setNames(request.getParameter("names"));
                client.setResidenceType(request.getParameter("residenceType"));
                try {
                    client.create();
                } catch (Exception e) {
                    output = e.getMessage();
                }
                sale.setClient(client);
                sale.setExchangeRate(exchangeRate);
                sale.setFcAmount(Float.parseFloat(request.getParameter("amount")));
                sale.setLcAmount(lcAmount);
                sale.setPurpose(request.getParameter("purpose"));
                sale.setDestinationCountry(request.getParameter("destination"));
                sale.setTransDate(new Date());
                sale.setUser((User) session.getAttribute("user"));

                try {
                    sale.create();
                    output = "The sale is recorded";
                } catch (Exception e) {
                    output = e.getMessage();
                }

            }
        } else {
            float lcAmount = exchangeRate.getActualPurchasingRate() * Float.parseFloat(request.getParameter("amount"));
            Sale sale = new Sale();
            Client client = new Client();
            client.setId(request.getParameter("nationalId"));
            client.setNames(request.getParameter("names"));
            client.setResidenceType(request.getParameter("residence"));
            try {
                client.create();
            } catch (Exception e) {
                output = e.getMessage();
            }
            sale.setClient(client);
            sale.setExchangeRate(exchangeRate);
            sale.setFcAmount(Float.parseFloat(request.getParameter("amount")));
            sale.setLcAmount(lcAmount);
            sale.setPurpose(request.getParameter("purpose"));
            sale.setDestinationCountry(request.getParameter("destination"));
            sale.setTransDate(new Date());
            sale.setUser((User) session.getAttribute("user"));

            try {
                sale.create();
                output = "The sale is recorded";
            } catch (Exception e) {
                output = e.getMessage();
            }
        }
    }
    out.println(output);
%>
