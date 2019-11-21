<%-- 
    Document   : Salir
    Created on : 13/05/2018, 04:50:07 PM
    Author     : jeison
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%HttpSession sec = request.getSession(false);
            sec.setAttribute("nomuser", "");
            response.setHeader("Cache-Control","no-store");  
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            request.getSession().invalidate();
            response.sendRedirect("../inicio/Login.jsp");
        %>
    </body>
</html>
