<%-- 
    Document   : newLocation
    Created on : June 17, 2019, 3:02:29 PM
    Author     : kay
--%>

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
            <input name="type" type="hidden" value="foreignCurrency"/>
            <div class="form-group">
                <label class="control-label">Unit</label>
                <input class="form-control" name="unit" type="text" required="true"/>
            </div>
            <div class="form-group">
                <label class="control-label">Country</label>
                <input class="form-control" name="country" type="text" required="true"/>
            </div>
            <div class="form-group text-center">
                <input class="btn btn-xs btn-success" type="submit" value="SAVE"/>
            </div>
        </form>
    </body>
</html>
