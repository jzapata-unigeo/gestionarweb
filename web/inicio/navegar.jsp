<%-- 
    Document   : newjsp
    Created on : 13/05/2018, 06:21:11 PM
    Author     : jeison
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <link href="../CSS/Stylnav.css" rel="stylesheet" type="text/css"/>
        <title>Nav</title>
    </head>
    <body>
        <nav>
            <ul class="menu">
                <li><a class="back" href="javascript:window.history.go(-1);"></a></li>

                <li><a href="">Registro</a>
                    <ul>
                        <li><a href="../admin/Estudiantes.jsp">Estudiantes</a></li>
                        <li><a href="../admin/Usuario.jsp">Usuarios</a></li>
                    </ul>
                </li>

                <li><a href="../admin/Consulta.jsp">Consulta</a></li>
                <li><a href="">Contraseña</a>
                    <ul>
                        <li><a href="../admin/Cambiopas_usu.jsp">Reseteo</a></li>
                    </ul>        
                </li> 
                <li><a href="../admin/Salir.jsp">Salir</a></li>

                <%
                    HttpSession sec1 = request.getSession();
                    
                    if (sec1.getAttribute("nomuser") == null) {
                        response.sendRedirect("../admin/Salir.jsp");
                    }else{
                    String user = (String) sec1.getAttribute("nomuser");
                                    %>

                <div id="user">
                    <li><a href=""><%=user%></a> </li>
                      <%}%>         
                </div>
            </ul>
        </nav>
    </body>
</html>
