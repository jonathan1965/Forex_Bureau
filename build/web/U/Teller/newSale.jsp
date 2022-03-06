<%-- 
    Document   : newLocation
    Created on : June 17, 2019, 3:02:29 PM
    Author     : kay
--%>

<%@page import="rw.ofbmrs.entities.ForeignCurrency"%>
<%@page import="rw.ofbmrs.entities.ForexBureau"%>
<%@page import="rw.ofbmrs.entities.Cell"%>
<%@page import="rw.ofbmrs.entities.District"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
        <title>JSP Page</title>
    </head>
    <body>
        <form class="form-horizontal formData" action="add.jsp" method="POST">
            <input name="type" type="hidden" value="sale"/>
            <div class="form-group">
                <label class="control-label">National ID/Passport:</label>
                <input class="form-control" name="nationalId" type="text" required="true"/>
            </div>
            <div class="form-group">
                <label class="control-label">Names:</label>
                <input class="form-control" name="names" type="text" required="true"/>
            </div>
            <div class="form-group">
                <label class="control-label">Residence type:</label>
                <select class="form-control" name="residenceType">
                    <option value="Citizen">Citizen</option>
                    <option value="Foreigner">Foreigner</option>
                </select>
            </div>
            <div class="form-group">
                <label class="control-label">Foreign currency:</label>
                <select class="form-control" name="foreignCurrency">
                    <%

                        ForeignCurrency foreignCurrency = new ForeignCurrency();
                        for (ForeignCurrency currency : foreignCurrency.getAll()) {
                            out.println("<option value='" + currency.getId() + "'>" + currency.getUnit() + "</option>");
                        }

                    %>
                </select>
            </div>
            <div class="form-group">
                <label class="control-label">Exchange rate:</label>
                <input class="form-control" name="exchangeRate" type="number"/>
            </div>
            <div class="form-group">
                <label class="control-label">Amount:</label>
                <input class="form-control" name="amount" type="number" required="true"/>
            </div>
            <div class="form-group">
                <label class="control-label">Destination country:</label>
                <input class="form-control" name="destination" type='text' required="true"/>
            </div>
            <div class="form-group">
                <label class="control-label">Purpose:</label>
                <textarea class="form-control" name="purpose" required="true"></textarea>
            </div>
            <div class="form-group text-center">
                <input class="btn btn-xs btn-success" type="submit" value="SAVE"/>
            </div>
        </form>
    </body>
</html>
