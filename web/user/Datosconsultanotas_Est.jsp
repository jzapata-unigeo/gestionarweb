<%-- 
    Document   : datosmaterias
    Created on : 16/04/2018, 04:26:29 PM
    Author     : jzapata
--%>


<%@page import="java.util.Vector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Funciones.Fnotas"%>
<%@page import="modelo.aNotas"%>
<%@page import="Funciones.Conexion"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session='true'%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <%
        HttpSession sec = request.getSession();
        Vector mater = new Vector();
        Vector notas = new Vector();
        String matr = request.getParameter("Idmtr");
        Conexion cn = new Conexion();
        String SQL = "SELECT * FROM NotaEstudiantes, Matricula"
                + "  WHERE Matricula.Idmatricula = NotaEstudiantes.IdMatricula"
                + " and NotaEstudiantes.Idmatricula = " + matr;
        String SQL1 = "SELECT * FROM Estudiantes, Matricula"
                + " WHERE Estudiantes.IdEstudiante = Matricula.IdEstudiante"
                + " and Matricula.Idmatricula = " + matr;
            
        Statement st = cn.obtener().createStatement();
        ResultSet rs = st.executeQuery(SQL);
        int r = 0;
        Statement st1 = cn.obtener().createStatement();
        ResultSet rs1 = st1.executeQuery(SQL1);

        sec.setAttribute("materia", "");
        sec.setAttribute("notas", "");
               
           
        while (rs.next()) {
            String anio = rs.getString("aniomatr");
            String semestre = rs.getString("Semestre");
            sec.setAttribute("anio", anio);
            sec.setAttribute("semestre", semestre);
            mater.addElement(new String(rs.getString("Materia")));
            notas.addElement(new String(rs.getString("NotaFinal")));
            sec.setAttribute("materia", mater);
            sec.setAttribute("notas", notas);
           
            r++;
        }

        if (r == 0) {
            if (rs1.next()) {
                int idusuario = rs1.getInt("IdEstudiante");
                sec.setAttribute("idusuario", idusuario);
                String idmatricula = rs1.getString("Idmatricula");
                sec.setAttribute("idmatricula", idmatricula);
                sec.setAttribute("jornada", rs1.getString("Jornada"));
                sec.setAttribute("ciclo", rs1.getString("Ciclo"));
                sec.setAttribute("nombres", rs1.getString("NomEstudiante"));
                String anio = rs1.getString("aniomatr");
                String semestre = rs1.getString("Semestre");
                sec.setAttribute("anio", anio);
                sec.setAttribute("semestre", semestre);
                sec.setAttribute("materia", mater);
                    
            }
            
        }

        response.sendRedirect("ConsultaNotas.jsp");
    %>

</html>
