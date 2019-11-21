<%-- 
    Document   : newjsp
    Created on : 13/05/2018, 06:21:11 PM
    Author     : jeison
--%>

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
                <li><a href="../ServEditEs">Consulta</a></li>
                <li><a href="">Contraseña</a>
                    <ul>
                        <li><a href="Cambiopas.jsp">Reseteo</a></li>
                    </ul> 
                </li>    
                
                <li>
                <ul>
                   
                </ul> 
                    
                <li><a href="Salir.jsp">Salir</a></li>

                <%
                    HttpSession sec = request.getSession();
                    String user = (String) sec.getAttribute("nomuser");
                    if (user == null) {
                        response.sendRedirect("Salir.jsp");
                    }
                %>

                 <div id="user">
                    <li><a href="">Estudiante: <%=user%></a> </li>
                </div>
            </ul>
        </nav>
    </body>
</html>
