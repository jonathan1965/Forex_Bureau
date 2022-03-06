<%@page import="rw.ofbmrs.entities.User"%>
<%@page import="rw.ofbmrs.model.UserModel"%>
<jsp:useBean class="rw.ofbmrs.entities.User" id="u" scope="session"/>
<%
    
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    UserModel uModel = new UserModel();
    uModel.getUser().setUsername(username);
    uModel.getUser().setPassword(password);
    User user = uModel.login();
    if(user != null){
        if(user.getStatus().equals("Active")){
            session.setAttribute("user", user);
            out.println(user.getRole());
        }
        else{
            out.println("Your account is currently locked. Please contact the System Admin");
        }
    }
    else{
        out.println("Invalid username or password");
    }
    
%>