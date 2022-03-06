<%-- 
    Document   : index
    Created on : June 22, 2019, 4:05:43 AM
    Author     : kay
--%>
<%@page import="rw.ofbmrs.entities.User"%>
<jsp:useBean id="u" class="rw.ofbmrs.entities.User" scope="session"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

    if (session.getAttribute("user") == null) {
        response.sendRedirect("../../Login/index.jsp");
    }

%>
<html>
    <head>
        <title>Rwanda Forex Bureau</title>
        <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
        <link href="../../css/forex.css" type="text/css" rel="stylesheet"/>
        <link href="../../css/fbureau.css" type="text/css" rel="stylesheet"/>
        <link href="../../css/font-awesome.css" type="text/css" rel="stylesheet"/>
        <link href="../../css/font-awesome.min.css" type="text/css" rel="stylesheet"/>
        <link href="../../css/jquery-ui.css" type="text/css" rel="stylesheet"/>
    </head>
    <body id="body">
        <div class="bradiv col-lg-12">
            <span class="col-lg-3">
                <img src="../../img/fblogo.JPG"/>
            </span>
        </div>

        <div class="seadiv col-lg-12 text-right" style="padding-top: 10px; padding-bottom: 10px;">
            <div>
                <%                    if (session.getAttribute("user") != null) {
                %>
                <div class="col-lg-12">
                    <i class="text-muted">Logged in as </i><b style="color:lightgray;"><% out.println(((User) session.getAttribute("user")).getUsername() + "[" + ((User) session.getAttribute("user")).getFirstName() + " " + ((User) session.getAttribute("user")).getLastName() + "]");%></b>
                </div>
                <%
                    } else {
                        response.sendRedirect("../../Login/index.jsp");
                    }
                %>
                <div class="col-lg-12">
                    <form action="../../Login/logout.jsp">
                        <input type="submit" class="btn btn-xs fa fa-sign-out bg-primary" value="Logout"/>
                    </form>
                </div>
            </div>
        </div>

        <div class="topnav col-lg-12">
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="forexBureau">Forex bureau</a>
                    </li>
                    <li>
                        <a href="foreignCurrency">Foreign currency</a>
                    </li>
                    <li>
                        <a href="exchangeRate">Exchange rate</a>
                    </li>
                    <li>
                        <a href="users">Users</a>
                    </li>
                    <li>
                        <a href="location">FB Location</a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="content col-lg-12" id="content">

            <div class="dashboard col-lg-12">

                <div class="col-lg-3">
                    <div class="col-lg-12 text-center h4">
                        Forex Bureau
                    </div>
                    <div class="col-lg-12">
                        Forex Bureau is a business of which primary purpose is the selling and buying of a foreign currency in exchange of the local currency
                    </div>
                </div>

                <div class="col-lg-3">
                    <div class="col-lg-12 text-center h4">
                        Foreign Currency
                    </div>
                    <div class="col-lg-12">
                        Foreign Currency is any currency which is currently used in a foreign country
                    </div>
                </div>

                <div class="col-lg-3">
                    <div class="col-lg-12 text-center h4">
                        Exchange Rate 
                    </div>
                    <div class="col-lg-12">
                        Exchange Rate is the rate at which a foreign country is sold or bought
                    </div>
                </div>

                <div class="col-lg-3">
                    <div class="col-lg-12 text-center h4">
                        Local Currency
                    </div>
                    <div class="col-lg-12">
                        Local Currency is the currency which is currently used in a local country
                    </div>
                </div>

            </div>
        </div>

        <div class="footer text-center col-lg-12">
            <p>
                Copyright 2019 Kalisa Jonathan. All rights reserved
            </p>
        </div>

        <div id="dialog">

        </div>

        <script src="../../js/jquery-1.10.2.min.js" type="text/javascript"></script>
        <script src="../../js/jquery.cycle.all.js" type="text/javascript"></script>
        <script src="../../js/jquery-ui.min.js" type="text/javascript"></script>
        <script src="../../js/forex.js" type="text/javascript"></script>
        <script src="../../js/fbureau.js" type="text/javascript"></script>
        <script src="../../js/fb.js" type="text/javascript"></script>
    </body>
</html>
