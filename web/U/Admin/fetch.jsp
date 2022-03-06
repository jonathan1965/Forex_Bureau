<%@page import="rw.ofbmrs.entities.ForexBureau"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="rw.ofbmrs.model.ForexBureauModel"%>
<%
    String output = "<div class='text-center'><table class='table table-bordered'>";
    String key = request.getParameter("key");
    if (key.equals("forexBureau")) {
        ForexBureauModel fbModel = new ForexBureauModel();
        List<ForexBureau> list = fbModel.getAll();
        output += "<tr>"
                + "<th width='30%' class='text-center'>LICENSE N<sup>o</sup></th>"
                + "<th width='40%' class='text-center'>NAME</th>"
                + "<th width='30%' class='text-center'>CELL</th>"
                + "</tr>";
        if (list.size() > 0) {
            for (ForexBureau fb : list) {
                output += "<tr><td>" + fb.getLicenseNo() + "</td>"
                        + "<td>" + fb.getName() + "</td>"
                        + "<td>" + fb.getCell().getName() + "</td></tr>";
            }
        } else {
            output += "<tr><td colspan='3'>No data found</td></tr>";
        }
    }
    
    if(key.equals("location")){
        
    }
    out.println(output + "</table></div>");
%>