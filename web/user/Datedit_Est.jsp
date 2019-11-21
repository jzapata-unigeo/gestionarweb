<%-- 
   Document   : datosestudiante
   Created on : 13/04/2018, 02:00:42 PM
   Author     : jzapata
--%>

<%@page import="java.util.Calendar.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Funciones.Flogin"%>
<%@page import="Funciones.Encryp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Funciones.fEstudiante"%>
<%@page import="Funciones.aEstudiante"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="Funciones.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session='true'%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <link href="CSS/stylest.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function redireccionarPagina() {
                window.location = "Consulta_Est.jsp";
            }
        </script>
    </head>

    <body>
        
        <%   Conexion cn = new Conexion();
            HttpSession sec1 = request.getSession();
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String nombres = nombre + " " + apellido;
            sec1.setAttribute("nombres", nombres);
            String mail = request.getParameter("email");
            String telefono = request.getParameter("telefono");
            String direccion = request.getParameter("direccion");
            String ciudad = request.getParameter("ciudad");
            String celular = request.getParameter("celular");
            String idusuario = (String) sec1.getAttribute("idestudiante");
            String IdEstudiante = idusuario;
            int r;
            String SQL = "UPDATE Estudiantes set NomEstudiante = ?, ApllEstudiante = ?, Email = ?,"
                    + "Telefono = ?, Direccion = ?, Ciudad = ?, Celular = ? WHERE IdEstudiante =  ?";
            PreparedStatement ps = cn.obtener().prepareStatement(SQL);
            ps.setString(1, nombre);
            ps.setString(2, apellido);
            ps.setString(3, mail);
            ps.setString(4, telefono);
            ps.setString(5, direccion);
            ps.setString(6, ciudad);
            ps.setString(7, celular);
            ps.setString(8, IdEstudiante);

            r = ps.executeUpdate();
            if (r != 0) {
                
                 %> 
         <script>
            alert("usuario actualizado correctamente");
            setTimeout("redireccionarPagina()", 100);
        </script>
        
        <%

            } else {
                 response.sendRedirect("Salir.jsp");
            }
          

        %>
        <%@ include file="../inicio/footer.jsp" %>  
    </body>
</html>



