<%@page import="rw.ofbmrs.entities.Sale"%>
<%@page import="rw.ofbmrs.entities.Teller"%>
<%@page import="rw.ofbmrs.entities.User"%>
<%@page import="rw.ofbmrs.entities.Manager"%>
<%@page import="java.util.List"%>
<%@page import="rw.ofbmrs.entities.Purchase"%>
<%

    String output = "";
    String type = request.getParameter("type");
    if (type.equals("purchasing")) {
        output += "<div class='col-lg-2 text-right'><form action='purchaseReport.jsp' method='POST'><div class='form-group'>"
                + "<button type='submit' class='btn btn-xs btn-primary' id='pdf'>PDF REPORT</button>"
                + "</div></form></div>"
                + "<div class='table-responsive col-lg-12'><table style='border-radius:5px; overflow:hidden; font-family:cambria;' class='table table-bordered'>"
                + "<tr style='background-color: #245269; color:lightgray;'>"
                + "<th class='text-center'>ID</th>"
                + "<th class='text-center'>CLIENT</th>"
                + "<th class='text-center'>FOREIGN CURRENCY</th>"
                + "<th class='text-center'>EXCHANGE RATE</th>"
                + "<th class='text-center'>AMOUNT IN FOREIGN CURRENCY</th>"
                + "<th class='text-center'>AMOUNT IN RWANDAN FRANCS</th>"
                + "<th class='text-center'>DATE</th>"
                + "<th class='text-center'>PURPOSE</th>"
                + "<th class='text-center'>SOURCE OF FUND</th>"
                + "<th class='text-center'>FOREX BUREAU</th>"
                + "</tr>";
        Purchase purchase = new Purchase();
        List<Purchase> purchases = purchase.getAllPurchases();
        Manager manager = new Manager();
        manager.setUsername(((User) session.getAttribute("user")).getUsername());
        manager = manager.getByUsername();

        if (purchases.size() > 0) {
            for (Purchase pur : purchases) {
                Teller teller = new Teller();
                teller.setUsername(pur.getUser().getUsername());
                teller = teller.getByUsername();
                output += "<tr>"
                        + "<td>" + pur.getId() + "</td>"
                        + "<td>" + pur.getClient().getNames() + "</td>"
                        + "<td>" + pur.getExchangeRate().getForeignCurrency().getUnit() + "</td>"
                        + "<td>" + pur.getExchangeRate().getActualPurchasingRate() + "</td>"
                        + "<td>" + pur.getFcAmount() + "</td>"
                        + "<td>" + pur.getLcAmount() + "</td>"
                        + "<td>" + pur.getTransDate() + "</td>"
                        + "<td>" + pur.getPurpose() + "</td>"
                        + "<td>" + pur.getSourcesOfFund() + "</td>"
                        + "<td>" + teller.getForexBureau().getName() + "</td>"
                        + "</tr>";
            }
        } else {
            output += "<tr>"
                    + "<td colspan='10'>No record found</td>"
                    + "</tr>";
        }
    } else if (type.equals("selling")) {

        output += "<div class='col-lg-2 text-right'><form action='saleReport.jsp' method='POST'><div class='form-group'>"
                + "<button type='submit' class='btn btn-xs btn-primary' id='pdf'>PDF REPORT</button>"
                + "</div></form></div>"
                + "<div class='table-responsive col-lg-12'><table style='border-radius:5px; overflow:hidden; font-family:cambria;' class='table table-bordered'>"
                + "<tr style='background-color: #245269; color:lightgray;'>"
                + "<th class='text-center'>ID</th>"
                + "<th class='text-center'>CLIENT</th>"
                + "<th class='text-center'>FOREIGN CURRENCY</th>"
                + "<th class='text-center'>EXCHANGE RATE</th>"
                + "<th class='text-center'>AMOUNT IN FOREIGN CURRENCY</th>"
                + "<th class='text-center'>AMOUNT IN RWANDAN FRANCS</th>"
                + "<th class='text-center'>DATE</th>"
                + "<th class='text-center'>PURPOSE</th>"
                + "<th class='text-center'>DESTINATION</th>"
                + "<th class='text-center'>FOREX BUREAU</th>"
                + "</tr>";
        Sale sale = new Sale();
        List<Sale> sales = sale.getAllSales();
        Manager manager = new Manager();
        manager.setUsername(((User) session.getAttribute("user")).getUsername());
        manager = manager.getByUsername();

        if (sales.size() > 0) {
            for (Sale sl : sales) {
                Teller teller = new Teller();
                teller.setUsername(sl.getUser().getUsername());
                teller = teller.getByUsername();
                output += "<tr>"
                        + "<td>" + sl.getId() + "</td>"
                        + "<td>" + sl.getClient().getNames() + "</td>"
                        + "<td>" + sl.getExchangeRate().getForeignCurrency().getUnit() + "</td>"
                        + "<td>" + sl.getExchangeRate().getActualPurchasingRate() + "</td>"
                        + "<td>" + sl.getFcAmount() + "</td>"
                        + "<td>" + sl.getLcAmount() + "</td>"
                        + "<td>" + sl.getTransDate() + "</td>"
                        + "<td>" + sl.getPurpose() + "</td>"
                        + "<td>" + sl.getDestinationCountry() + "</td>"
                        + "<td>" + teller.getForexBureau().getName() + "</td>"
                        + "</tr>";
            }
        } else {
            output += "<tr>"
                    + "<td colspan='10'>No record found</td>"
                    + "</tr>";
        }
    }

    out.println(output);

%>