<%@page import="rw.ofbmrs.entities.User"%>
<jsp:useBean class="rw.ofbmrs.entities.User" id="u" scope="session"/>
<%
    session.invalidate();
    response.sendRedirect("../index.jsp");
%>
