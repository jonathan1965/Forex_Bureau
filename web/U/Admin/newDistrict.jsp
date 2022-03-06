<%-- 
    Document   : newLocation
    Created on : June 17, 2016, 3:02:29 PM
    Author     : kay
--%>

<%@page import="rw.ofbmrs.entities.Province"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
        <title>JSP Page</title>
    </head>
    <body>
        <form class="form-horizontal formData" action="add.jsp" method="POST">
            <input name="type" type="hidden" value="district"/>
            <div class="form-group">
                <label class="control-label">Name</label>
                <input class="form-control" name="name" type="text" required="true"/>
            </div>
            <div class="form-group">
                <label class="control-label">Province</label>
                <select class="form-control" name="province">
                    <%
                        Province province = new Province();
                        for (Province prov : province.getAll()) {
                            out.println("<option value='" + prov.getId() + "'>" + prov.getName() + "</option>");
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
