<%@page import="java.util.List"%>
<%@page import="rw.ofbmrs.entities.Teller"%>
<%@page import="rw.ofbmrs.entities.User"%>
<%@page import="rw.ofbmrs.entities.Manager"%>
<%

    String output = "<div class='text-center'><table style='border-radius:5px; overflow:hidden; font-family:cambria;' class='table table-bordered'>";
    Manager manager = new Manager();
    manager.setUsername(((User) session.getAttribute("user")).getUsername());
    manager = manager.getByUsername();

    Teller teller = new Teller();
    teller.setForexBureau(manager.getForexBureau());
    List<Teller> list = teller.getByForexBureau();
    output += "<tr style='background-color: #245269; color:lightgray;'>"
            + "<th class='text-center'>FIRST NAME</th>"
            + "<th class='text-center'>LAST NAME</th>"
            + "<th class='text-center'>GENDER</th>"
            + "<th class='text-center'>PHONE</th>"
            + "<th class='text-center'>EMAIL</th>"
            + "<th class='text-center'>USERNAME</th>"
            + "<th class='text-center'>STATUS</th>"
            + "</tr>";
    if (list.size() > 0) {
        for (Teller tel : list) {
            output += "<tr><td>" + tel.getFirstName() + "</td>"
                    + "<td>" + tel.getLastName() + "</td>"
                    + "<td>" + tel.getGender() + "</td>"
                    + "<td>" + tel.getPhone() + "</td>"
                    + "<td>" + tel.getEmail() + "</td>"
                    + "<td>" + tel.getUsername() + "</td>"
                    + "<td>" + tel.getStatus() + "</td></tr>";
        }
    } else {
        output += "<tr><td colspan='7'>No data found</td></tr>";
    }
    out.println(output + "</table></div>");

%>