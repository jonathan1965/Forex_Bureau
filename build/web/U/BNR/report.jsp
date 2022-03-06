<%-- 
    Document   : forex
    Created on : July 9, 2019, 9:53:28 PM
    Author     : kay
--%>

<%@page import="rw.ofbmrs.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="col-lg-12">
            <div class="text-right">
                <div class="form-group col-lg-3">
                    <select class="form-control" id="reportType">
                        <option value="selling">Selling transactions</option>
                        <option value="purchasing">Purchasing transactions</option>
                    </select>
                </div>
            </div>
            <div id="t_data" class="col-lg-12">

            </div>
        </div>
    </body>
</html>
