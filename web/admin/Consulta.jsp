<%@page import="Funciones.Fconsulta"%>
<%@page import="Funciones.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page session='true'%>


<!doctype html>
<html lang="es">
    <head>
        <title>Consulta</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../CSS/styleicons.css" rel="stylesheet" type="text/css"/>
        <script src="../Scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../Scripts/jquery.dataTables.min.js" type="text/javascript"></script>
        <link href="../CSS/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <script>
            $(document).ready(function () {
                $('#table_id').DataTable();
            });</script>        
        <meta charset="UTF-8">
    </head>
    <body>

        <%@ include file="../inicio/navegar.jsp" %>  
        <div id="logo"></div>

        <div class="contenido">
            <h2>Consulta</h2>

            <table id="table_id" class="display">
                <thead>
                <th>CODIGO</th>
                <th>DOCUMENTO</th>
                <th>NOMBRE</th>
                <th>APELLIDO</th>
                <th>GENERO</th>
                <th>TELEFONO</th>
                <th>CELULAR</th>
                <th>&nbsp;</th>
                </thead>
                <%
                    Fconsulta fun = new Fconsulta();
                    ResultSet rs =fun.consultar();                   
                    while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getInt("IdEstudiante")%></td>
                    <td><%=rs.getString("NumDocumento")%></td>
                    <td><%= rs.getString("NomEstudiante")%></td>
                    <td><%= rs.getString("ApllEstudiante")%></td>
                    <td><%= rs.getString("Sexo")%></td>
                    <td><%= rs.getString("Telefono")%></td>
                    <td><%= rs.getString("Celular")%></td>
                    <td class="edit-buttons"> <a href="../ServEdit?cod=<%=rs.getString("NumDocumento")%>"><div class="ico-edit"></div></a>
                </tr>
                <%}%>

            </table>
        </div>
        <%@ include file="../inicio/footer.jsp" %> 
    </body> 
</html>