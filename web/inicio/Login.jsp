
<%@page import="modelo.aLogin"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Funciones.Flogin"%>
<%@page import="Funciones.Encryp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.lang.String"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Funciones.Conexion"%>
<%@page import="Servlets.ServLogin"%>
<%@ page language="java"%>
<%@ page import = "java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@page session='true'%>

<!doctype html>
<html lang="es">



    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../CSS/stylelog.css" rel="stylesheet" type="text/css"/>
        <title>Login</title>
        <script src="jscapslock.js" type="text/javascript"></script>
        <script src="Scripts/scripts.js" type="text/javascript"></script>
    </head>

    <body>

        <div id="logo"></div>
         
        <div class="contenido">
            <img class="usuario" src="../images/Eduweb1220.png" alt="">
            <h3>Iniciar Sesión</h3>
            <form action="../ServLogin" method="POST">
                <div>
                    <img class="icon" src="../images/user-50.png" alt="">
                    <input type="text" name="usuario" autocomplete="off" placeholder="Usuario" required> 
                </div> 
                <div>
                    <div>
                        <img class="icon" alt="" src="../images/lock-50.png">

                        <input type="password" name="password" autocomplete="off" placeholder="contraseña" required onKeyPress="capLock(event)">

                    </div>    
                    <button class="submit" type="submit" onclick=''>Entrar</button >
                </div>   
                <div id="aviso" style="visibility:hidden">El bloqueo de mayuculas esta activado</div>
                <BR class='alert-danger'>
                
                <%
                    HttpSession sec = request.getSession();
                    aLogin dts = new aLogin();
                   
                    if (sec.getAttribute("mensaje") != null) {
                        out.println("<p class='alert alert-danger'>" + sec.getAttribute("mensaje") + "</p>");
                    } 
                %>  
</div> 

        <%@ include file="footer.jsp" %> 
    </body> 
</html>
