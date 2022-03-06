<%-- 
    Document   : newLocation
    Created on : June 17, 2019, 3:02:30 PM
    Author     : Kay
--%>

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
            <input name="type" type="hidden" value="sector"/>
            <div class="form-group">
                <label class="control-label">Name</label>
                <input class="form-control" name="name" type="text" required="true"/>
            </div>
            <div class="form-group">
                <label class="control-label">District</label>
                <select class="form-control" name="district">
                    <%
                        District district = new District();
                        for (District dis : district.getAll()) {
                            out.println("<option value='" + dis.getId() + "'>" + dis.getName() + "</option>");
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
