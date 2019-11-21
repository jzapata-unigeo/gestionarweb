
<%@page import="Funciones.FesConsulta"%>
<%@page import="Funciones.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page session="true"%>
<%@page import="java.util.*"%>
<%@page session='true'%>


<!doctype html>
<html lang="es">
    <head>

        <title>Consulta</title>
        <link href="../CSS/Stylcons.css" rel="stylesheet" type="text/css"/>
        <link href="../CSS/Styconsuest.min.css" rel="stylesheet" type="text/css"/>
        <script src="../Scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../Scripts/jquery.dataTables.min.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $('#table_id').DataTable();
            });</script>        

    </head>
    <body>
        <%@ include file="../inicio/navegar_Est.jsp" %> 
        <div id="logo"></div>

        <div class="contenido">
            <h2>Consulta</h2>
            <table id="table_id" class="display  dataTable">
                <th>CODIGO</th>
                <th>DOCUMENTO</th>
                <th>NOMBRE</th> 
                <th>APELLIDO</th>
                <th>GENERO</th>
                <th>TELEFONO</th>
                <th>&nbsp;</th>
                    <%  HttpSession sec1 = request.getSession();
                        String user1 = (String) sec1.getAttribute("user");
                        FesConsulta fun = new FesConsulta(user1);
                        ResultSet rs1 = fun.consmtr(user1);
                        ResultSet rs = fun.consmtr(user1);
                if (rs.next()) {
                    %>
                <tr>
                    <%
                        String id = rs.getString("IdEstudiante");
                        out.println("<td>" + id + "</td>");
                        sec.setAttribute("idestudiante", id);%>
                    <td><%=rs.getString("NumDocumento").trim()%></td>
                    <td><%=rs.getString("NomEstudiante").trim()%></td>
                    <td><%=rs.getString("ApllEstudiante").trim()%></td>
                    <td><%= rs.getString("Sexo").trim()%></td>
                    <td><%= rs.getString("Telefono").trim()%></td>
                    <td class="edit-buttons"> <a href="Editar_Est.jsp">Actualizar datos</a>
                <tr><th colspan="7"></tr>

                </tr>
            </table> 

            <%}%>
            
            <table id="table_id" class="display dataTable1">   
                <th>AÑO</th>
                <th>JORNADA</th>
                <th>CICLO</th>
                <th>SEMESTRE</th>
                <th>&nbsp;</th>
                    <%                        int cont = 0;
                        while (rs1.next()) {
                            cont++;%>
                <tr>
                    <td><%= rs1.getString("aniomatr").trim()%></td>
                    <td><%= rs1.getString("Jornada").trim()%></td>
                    <td><%= rs1.getString("Ciclo").trim()%></td>
                    <td><%= rs1.getString("Semestre").trim()%></td>
                    <%int matr = rs1.getInt("Idmatricula");
                    %>
                    <td> <a href="Datosconsultanotas_Est.jsp?Idmtr=<%=matr%>">Ver</a>
                        <%
                            }

                            out.println("</tr>");
                            if (cont == 0) {
                                out.println("<tr><td colspan='5'>" + "El Usuario no tiene matriculas registradas" + "</td>");
                            }
                            out.println("<tr><th colspan='5'>" + "</tr>");
                        %>

                </tr>

            </table>
            <br><br><br><br>
        </div>
        <%@ include file="../inicio/footer.jsp" %> 
    </body> 
</html>