<%-- 
    Document   : index
    Created on : April 22, 2019, 4:01:36 AM
    Author     : kay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Rwanda Forex Bureau</title>
        <link href="../bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
        <link href="../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
        <link href="../css/forex.css" type="text/css" rel="stylesheet"/>
        <link href="../css/fbureau.css" type="text/css" rel="stylesheet"/>
        <link href="../css/font-awesome.css" type="text/css" rel="stylesheet"/>
        <link href="../css/font-awesome.min.css" type="text/css" rel="stylesheet"/>
    </head>
    <body id="body">
        <div class="col-lg-12 topnavlog">

        </div>

        <div class="logintop col-lg-offset-4 text-center col-lg-4 col-lg-offset-4">
            <span>
                <img src="../img/fblogo.JPG"/>
            </span>
        </div>

        <div class="logincontent col-lg-12">
            <div class="col-lg-offset-4 col-lg-4 col-lg-offset-4 logindiv">
                <div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
                    <div class="form-horizontal" id="loginform">

                        <div class="form-group">
                            <input type="text" class="form-control" id="username" placeholder="Enter your username" required="true"/>
                        </div>

                        <div class="form-group">
                            <input type="password" class="form-control" id="password" placeholder="Password" required="true"/>
                        </div>
                        <div class="form-group text-center">
                            <button type="button" id="login_btn" class="btn btn-default col-sm-12" style="background-color: #269abc; color: white;">Sign in</button>
                        </div>
                        <div class="form-group text-right">
                            <a href="#" style="color: #269abc;">Forgot password?</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-center col-lg-12">
                <span id="login_error" class="text-danger">

                </span>
            </div>
        </div>

        <div class="footer text-center navbar navbar-fixed-bottom">
            <p>
                Copyright 2019 National Bank of Rwanda. All rights reserved
            </p>
        </div>

        <script src="../js/jquery-1.10.2.min.js" type="text/javascript"></script>
        <script src="../js/jquery.cycle.all.js" type="text/javascript"></script>
        <script src="../js/forex.js" type="text/javascript"></script>
        <script src="../js/fbureau.js" type="text/javascript"></script>
        <script src="../js/fb.js" type="text/javascript"></script>
    </body>
</html>
