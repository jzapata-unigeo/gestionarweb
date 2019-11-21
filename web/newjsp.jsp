<%-- 
    Document   : newjsp
    Created on : 9/09/2018, 08:55:56 PM
    Author     : jeiso
--%>

<%@page import="modelo.aLogin"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Funciones.Flogin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session='true'%>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css"/>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <script src="Scripts/sweetalert2.min.js" type="text/javascript"></script>
    <link href="CSS/sweetalert2.min.css" rel="stylesheet" type="text/css"/>
    <title>JSP Page</title>
</head>



<header class="modal-header">
    <div class="container-fluid">
        <h1>prueba</h1>
    </div>
</header>



<div class="container">
    <form action="#" method="POST">
        <input class="form-check-input" type="text" name="usuario" autocomplete="off" placeholder="Usuario" required> 
        <br>
        <br>
        <br>   
        <input class="form-check-input" type="password" name="contrasena" autocomplete="off" placeholder="contraseña" required> 
        <br>
        <br>
        <input class="btn-success" type="submit">
    </form>

    
</div>
<%
 if (request.getParameter("usuario") !=null ) {
      String usuario = request.getParameter("usuario");
      
   %> <script>Swal.fire({
  title: '<%=usuario%>',
  width: 600,
  padding: '3em',
  background: '#fff url(images/abstracto-azul.jpg)',
  backdrop: `
    rgba(255,255,255,0.4)
    center left
    no-repeat`
})</script>
<%}%>


  
