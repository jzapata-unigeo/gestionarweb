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
        <title>Notas estudiante</title>
        <link href="..//CSS/styleini.css" rel="stylesheet" type="text/css"/>
     <script>
            function redireccionarPagina() {
                window.location = "Notas.jsp";
            }
        </script>
    </head>

 <%@ include file="../inicio/navegar.jsp" %> 
 
    <%
        HttpSession sec = request.getSession();//creamos un objeto sesion
        Vector mater = (Vector) sec.getAttribute("materias");
        Conexion cn = new Conexion();
        Integer idusuario = (Integer) sec.getAttribute("idusuario");
        String anio = (String) sec.getAttribute("anio");
        String semestre = (String) sec.getAttribute("semestre");
        String ciclo = (String) sec.getAttribute("ciclo");
        String SQL = "insert into NotaEstudiantes (IdEstudiante , IdMateria , IdMatricula, Materia, NotaFinal) values (?,?,?,?,?)";
        Vector notas = new Vector();

        int idmatricula = 0;
        int matria = 1;
        int i = 0;
        int apr = 0;
        String apro = "";

        if (ciclo.equals("Basico")) {
            matria = 1;
        } else {
            matria = 7;
        }

        String ssql = "select * from Matricula where IdEstudiante = " + idusuario + " and aniomatr = "
                + anio + " and Semestre= " + semestre;
        try {
           
        Statement st = cn.obtener().createStatement();

        ResultSet rs = st.executeQuery(ssql);
        if (rs.next()) {
            idmatricula = rs.getInt("IdMatricula");
            sec.setAttribute("user", idmatricula);
        }

        int r;
        String nota1 = request.getParameter("nota1");
        String materia1 = mater.get(i).toString();
        notas.addElement(new String(nota1));
        PreparedStatement ps = cn.obtener().prepareStatement(SQL);
        ps.setInt(1, idusuario);
        ps.setInt(2, matria);
        ps.setInt(3, idmatricula);
        ps.setString(4, materia1);
        ps.setString(5, nota1);
        r = ps.executeUpdate();
        matria++;
        i++;

        String nota2 = request.getParameter("nota2");
        String materia2 = (String) mater.get(i);
        notas.addElement(new String(nota2));
        ps.setInt(1, idusuario);
        ps.setInt(2, matria);
        ps.setInt(3, idmatricula);
        ps.setString(4, materia2);
        ps.setString(5, nota2);
        r = ps.executeUpdate();
        matria++;
        i++;

        String nota3 = request.getParameter("nota3");
        String materia3 = (String) mater.get(i);
        notas.addElement(new String(nota3));
        ps.setInt(1, idusuario);
        ps.setInt(2, matria);
        ps.setInt(3, idmatricula);
        ps.setString(4, materia3);
        ps.setString(5, nota3);
        r = ps.executeUpdate();
        matria++;
        i++;

        String nota4 = request.getParameter("nota4");
        String materia4 = (String) mater.get(i);;
        notas.addElement(new String(nota4));
        ps.setInt(1, idusuario);
        ps.setInt(2, matria);
        ps.setInt(3, idmatricula);
        ps.setString(4, materia4);
        ps.setString(5, nota4);
        r = ps.executeUpdate();
        matria++;
        i++;

        String nota5 = request.getParameter("nota5");
        String materia5 = (String) mater.get(i);
        notas.addElement(new String(nota5));
        ps.setInt(1, idusuario);
        ps.setInt(2, matria);
        ps.setInt(3, idmatricula);
        ps.setString(4, materia5);
        ps.setString(5, nota5);
        r = ps.executeUpdate();
        matria++;
        i++;

        String nota6 = request.getParameter("nota6");
        String materia6 = (String) mater.get(i);;
        notas.addElement(new String(nota6));
        ps.setInt(1, idusuario);
        ps.setInt(2, matria);
        ps.setInt(3, idmatricula);
        ps.setString(4, materia6);
        ps.setString(5, nota6);
        r = ps.executeUpdate();
        sec.setAttribute("notas", notas);
        
//        response.sendRedirect("Certificado.jsp");

        for (int idx = 0; idx < notas.size(); idx++) {
            if (notas.get(idx).equals("Bajo")) {
                apr++;

            }

            if (apr == 0) {
                sec.setAttribute("aprobar", "APROBADO");
            } else {
                sec.setAttribute("aprobar", "NO APROBADO");
            }

        }


    %>

  <script type="text/javascript">
        {
            var confRet = window.confirm ("Desea visualizar el Certificado?");
            if (confRet) {
                 location.href ="Certificado.jsp";
            }
            else {
                 location.href ="Inicio.jsp";
            }
        }
   </script>
   
 <%   } catch (Exception e) {
    
 %>   
 
 
  <script>
            alert("El estudiante tiene registradas notas para este año-semestre");
            setTimeout("redireccionarPagina()", 100);
        </script>
        
         <% } 
              %>  
</html>
