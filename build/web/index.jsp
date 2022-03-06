<%-- 
    Document   : index
    Created on : Jul 22, 2016, 4:05:43 AM
    Author     : Josh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Rwanda Forex Bureau</title>
        <link href="bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
        <link href="bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
        <link href="css/forex.css" type="text/css" rel="stylesheet"/>
        <link href="css/fbureau.css" type="text/css" rel="stylesheet"/>
        <link href="css/font-awesome.css" type="text/css" rel="stylesheet"/>
        <link href="css/font-awesome.min.css" type="text/css" rel="stylesheet"/>
    </head>
    <body id="body">
        <div class="bradiv col-lg-12">
            <span class="col-lg-3">
                <img src="img/fblogo.JPG"/>
            </span>
        </div>

        <div class="seadiv col-lg-12">
            <div class="col-lg-offset-3 col-lg-6 col-lg-offset-3 search input-group">
                <input type="text" class="form-control"/>
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button">
                        <i class="glyphicon glyphicon-search"></i>
                    </button>
                </span>
            </div>
        </div>

        <div class="topnav col-lg-12">
            <div class="col-lg-11">
                
            </div>

            <div class="col-lg-1 text-right">
                <a class="btn btn-link" style="color:gray; font-family: cambria;" href="Login/index.jsp">Sign in</a>
            </div>
        </div>

        <div class="content col-lg-12">
            <div class="col-lg-offset-3 col-lg-6 col-lg-offset-3">
                <div id="slider">
<!--                   <div class="sliderItem">
                        <img src="img/Presid.ent.jpg"/>
                    </div>-->

                     <div class="sliderItem">
                        <img src="img/NOTES.PNG"/>
                    </div>

<!--                    <div class="sliderItem">
                        <img src="img/Jo.hn.jpg"/>
                    </div>-->

                    <div class="sliderItem">
                        <img src="img/Rwandaise_coins.png"/>
                    </div>

<!--                        <div class="sliderItem">
                        <img src="img/Ministe.r.jpg"/>
                    </div>-->

                    <div class="sliderItem">
                        <img src="img/forexnotes.jpg"/>
                    </div>

                </div>
            </div>

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
                Copyright 2019 National Bank of Rwanda. All rights reserved
            </p>
        </div>

        <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
        <script src="js/jquery.cycle.all.js" type="text/javascript"></script>
        <script src="js/forex.js" type="text/javascript"></script>
        <script src="js/fbureau.js" type="text/javascript"></script>
    </body>
</html>
