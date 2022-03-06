<%-- 
    Document   : forex
    Created on : June 9, 2019, 9:53:28 PM
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
        <div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
            <div class="text-left">
                <div class="col-lg-6">
                    <p>
                        <select id="loc">
                            <option value="province">Province</option>
                            <option value="district">District</option>
                            <option value="sector">Sector</option>
                            <option value="cell">Cell</option>
                        </select>
                    </p>
                </div>
                
                <div class="col-lg-6 text-right">
                    <p>
                        <button id="new_loc" class="btn btn-success btn-xs" type="button">
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
