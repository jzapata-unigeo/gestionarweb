<%-- 
    Document   : datosmatricula
    Created on : 16/04/2018, 03:23:50 PM
    Author     : jzapata
--%>

<%@page import="Funciones.Conexion"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page session='true'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script>
        function redireccionarPagina() {
            window.location = "Matricula.jsp";
        }
    </script>
    <body>

        <%
            HttpSession sec = request.getSession();
            Integer idusuario = (Integer) sec.getAttribute("idusuario");
            int IdEstudiante = idusuario;
            String anio = request.getParameter("anio");
            sec.setAttribute("anio", anio);
            String semestre = request.getParameter("semestre");
            sec.setAttribute("semestre", semestre);
            String jornada = request.getParameter("jornada");
            sec.setAttribute("jornada", jornada);
            String ciclo = request.getParameter("ciclo");
            sec.setAttribute("ciclo", ciclo);
            try {
                int r;
                Conexion cn = new Conexion();
                String SQL = "insert into Matricula (IdEstudiante ,aniomatr, Jornada, Ciclo, Semestre) values (?,?,?,?,?)";
                PreparedStatement ps = cn.obtener().prepareStatement(SQL);
                ps.setInt(1, IdEstudiante);
                ps.setString(2, anio);
                ps.setString(3, jornada);
                ps.setString(4, ciclo);
                ps.setString(5, semestre);

                r = ps.executeUpdate();
                response.sendRedirect("Notas.jsp");

                if (r != 0) {
                    out.println("Creado con exito");

                } else {
                    out.println("El estudiante ya esta matriculado para este Año-Semestre");
        %>      
        out.print('setTimeout("redireccionarPagina()", 10000););
        <%}

        } catch (Exception e) {
            out.println("El estudiante ya esta matriculado para este Año-Semestre");
        %> 

        setTimeout("redireccionarPagina()", 10000);
        <%         }

        %>


    </body>
</html>
