<%-- 
    Document   : forex
    Created on : July 9, 2019, 9:53:28 PM
    Author     : kay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="col-lg-12">
            <div class="text-left">
                <div class="col-lg-6">
                    <p>
                        <select id="users">
                            <option value="allUsers">All</option>
                            <option value="FBManagers">Forex Bureau Managers</option>
                            <option value="BNRUsers">BNR Users</option>
                        </select>
                    </p>
                </div>
                
                <div class="col-lg-6 text-right">
                    <p>
                        <button id="new_user" class="btn btn-success btn-xs" type="button">
                            ADD NEW
                        </button>
                    </p>
                </div>
            </div>
            <div id="t_data">
                
            </div>
        </div>
    </body>
</html>
