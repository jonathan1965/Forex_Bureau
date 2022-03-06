<%-- 
    Document   : newLocation
    Created on : June 17, 2019, 3:02:29 PM
    Author     : kay
--%>

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
            <input name="type" type="hidden" value="bnrEmployee"/>
            <div class="form-group">
                <label class="control-label">First name:</label>
                <input class="form-control" name="firstName" type="text" required="true"/>
            </div>
            <div class="form-group">
                <label class="control-label">Last name:</label>
                <input class="form-control" name="lastName" type="text" required="true"/>
            </div>
            <div class="form-group">
                <label class="control-label">Gender:</label>
                <select class="form-control" name="gender">
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                </select>
            </div>
            <div class="form-group">
                <label class="control-label">Email:</label>
                <input class="form-control" name="email" type="text" required="true"/>
            </div>
            <div class="form-group">
                <label class="control-label">Phone:</label>
                <input class="form-control" name="phone" type="text" required="true"/>
            </div>
            <div class="form-group">
                <label class="control-label">Date of birth:</label>
                <input class="form-control" name="dateOfBirth" type='date' required="true"/>
            </div>
            <div class="form-group">
                <label class="control-label">Username:</label>
                <input class="form-control" name="username" type="text" required="true"/>
            </div>
            <div class="form-group">
                <label class="control-label">Password:</label>
                <input class="form-control" name="password" type="password" required="true"/>
            </div>
            <div class="form-group">
                <label class="control-label">Confirm password:</label>
                <input class="form-control" name="cpassword" type="password" required="true"/>
            </div>
            <div class="form-group text-center">
                <input class="btn btn-xs btn-success" type="submit" value="SAVE"/>
            </div>
        </form>
    </body>
</html>
