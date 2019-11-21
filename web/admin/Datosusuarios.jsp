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
<%@page session='true'%>
 <!DOCTYPE html>
<html lang="es">
    <head>
        <title>JSP Page</title>
    </head>
    <body>

        <%
            Conexion cn = new Conexion();
            Encryp pass = new Encryp();
            Flogin func = new Flogin();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String vencimiento = formatter.format(func.fecven(func.fecha()));
            HttpSession sec = request.getSession();
            String tipdoc = request.getParameter("tipoc").trim();
            sec.setAttribute("tipdoc", tipdoc);
            String numdoc = request.getParameter("numdoc").trim();
            sec.setAttribute("numdoc", numdoc);
            String nombre = request.getParameter("nombre").trim();
            String password = pass.encrypt("92AE31A79FEEB2A3", "0123456789ABCDEF", numdoc).trim();
            String apellido = request.getParameter("apellido").trim();
            String nombres = nombre + " " + apellido;
            sec.setAttribute("nombres", nombres);
            String tipgen = request.getParameter("tipgen").trim();
            String fecha = request.getParameter("fecha").trim();
            String mail = request.getParameter("mail").trim();
            String telefono = request.getParameter("telefono").trim();
            String direccion = request.getParameter("direccion").trim();
            String ciudad = request.getParameter("ciudad").trim();
            String celular = request.getParameter("celular").trim();

            int r;

            String SQL = "insert into estudiantes (IdDocumento ,NumDocumento, NomEstudiante, ApllEstudiante, Sexo, FecNacimiento, Email, Telefono, Direccion, Ciudad,Celular, password, passven, tipo) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement ps = cn.obtener().prepareStatement(SQL);

            ps.setString(1, tipdoc);
            ps.setString(2, numdoc);
            ps.setString(3, nombre);
            ps.setString(4, apellido);
            ps.setString(5, tipgen);
            ps.setString(6, fecha);
            ps.setString(7, mail);
            ps.setString(8, telefono);
            ps.setString(9, direccion);
            ps.setString(10, ciudad);
            ps.setString(11, celular);
            ps.setString(12, password);
            ps.setString(13, vencimiento);
            ps.setInt(14, 1);

            r = ps.executeUpdate();
            if (r != 0) {

            }
            SQL = "Select IdEstudiante from Estudiantes where NumDocumento = ?";
            PreparedStatement pst = cn.obtener().prepareStatement(SQL);
            pst.setString(1, numdoc);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                int idusuario = rs.getInt("IdEstudiante");
                HttpSession Sec = request.getSession();
                Sec.setAttribute("idusuario", idusuario);
                response.sendRedirect("../admin/Inicio.jsp");
            }

        %>

    </body>
</html>
