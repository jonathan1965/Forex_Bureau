<%-- 
    Document   : newLocation
    Created on : June 17, 2019, 3:02:29 PM
    Author     : kay
--%>

<%@page import="rw.ofbmrs.entities.ForeignCurrency"%>
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
            <input name="type" type="hidden" value="exchangeRate"/>

            <div class="form-group">
                <label class="control-label">Actual Selling Rate</label>
                <input class="form-control" name="actualSellRate" type="number" required="true"/>
            </div>
            <div class="form-group">
                <label class="control-label">Minimum Selling Rate</label>
                <input class="form-control" name="minSellRate" type="number" required="true"/>
            </div>
            <div class="form-group">
                <label class="control-label">Maximum Selling Rate</label>
                <input class="form-control" name="maxSellRate" type="number" required="true"/>
            </div>

            <div class="form-group">
                <label class="control-label">Actual Purchasing Rate</label>
                <input class="form-control" name="actualPurRate" type="number" required="true"/>
            </div>
            <div class="form-group">
                <label class="control-label">Minimum Purchasing Rate</label>
                <input class="form-control" name="minPurRate" type="number" required="true"/>
            </div>
            <div class="form-group">
                <label class="control-label">Maximum Purchasing Rate</label>
                <input class="form-control" name="maxPurRate" type="number" required="true"/>
            </div>

            <div class="form-group">
                <label class="control-label">Foreign Currency</label>
                <select class="form-control" name="foreignCurrencyId">
                    <%

                        ForeignCurrency currency = new ForeignCurrency();
                        for(ForeignCurrency foreignCurrency : currency.getAll()){
                            out.println("<option value='" + foreignCurrency.getId() + "'>" + foreignCurrency.getUnit() + "</option>");
                        }

                    %>
                </select>
            </div>
            <div class="form-group text-center">
                <input class="btn btn-xs btn-success" type="submit" value="SAVE"/>
            </div>
        </form>
    </body>
</html>
