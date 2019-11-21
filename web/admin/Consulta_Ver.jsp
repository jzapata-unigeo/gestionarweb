
<%@page import="Funciones.Fconsulta"%>
<%@page import="Funciones.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="modelo.aEstudiante"%>
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
        <%@ include file="../inicio/navegar.jsp" %> 
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
                    <%  HttpSession sec = request.getSession();

                        String user1 = (String) sec.getAttribute("IdEstudiante");
                        //String string = (String) sec.getAttribute("IdEstudiante");
                        String NumDocumento = (String) sec.getAttribute("NumDocumento");
                        String nombre = (String) sec.getAttribute("nombre");
                        String apell = (String) sec.getAttribute("apell");
                        String sexo = (String) sec.getAttribute("sexo");
                        String telefono = (String) sec.getAttribute("telefono");
                        String nombres = (String) sec.getAttribute("nombres");
                        Fconsulta fun = new Fconsulta();
                        ResultSet rs = fun.consultarEst(user1);

                    %>
                <tr>
                   
                    <td><%=user1%></td>
                    <td><%=NumDocumento%></td>
                    <td><%=nombre%></td>
                    <td><%=apell%></td>
                    <td><%=sexo%></td>
                    <td><%=telefono%></td>
                    <td class="edit-buttons"> <a href="Editar.jsp?cod=<%=user1%>"><div class="ico-editEs"></div></a>
                <tr><th colspan="7"></tr>
            </table> 
                <br>
            <%
                rs = fun.consultarMtr(NumDocumento);
            %>
            <table id="table_id" class="display dataTable1">   
                <th>AÑO</th>
                <th>JORNADA</th>
                <th>CICLO</th>
                <th>SEMESTRE</th>
                <th>&nbsp;</th>
                <tr>
                    <%
                      try {
                            String[][] mensaje = (String[][]) sec.getAttribute("matricula");
                            if (mensaje.length == 0) {
                                out.println("<tr><td colspan='4'>" + "El Usuario no tiene matriculas registradas" + "</td>");
                            } else {
                                int i = 0;
                                while (mensaje.length >= i) {
                                    out.println("<td>" + mensaje[i][0] + "</td>");
                                    out.println("<td>" + mensaje[i][1] + "</td>");
                                    out.println("<td>" + mensaje[i][2] + "</td>");
                                    out.println("<td>" + mensaje[i][3] + "</td>");
                                    out.println("<td> <a href='../Servceriticado?matr=" + mensaje[i][4] + "'><div class='ico-edit'></div></a>");
                                    out.println("<tr>");
                                    i++;
                                }
                                if (i == 0) {
                                    out.println("<tr><td colspan='5'>" + "El Usuario no tiene matriculas registradas" + "</td>");
                                }
                                out.println("<tr><th colspan='5'>" + "</tr>");
                            }
                        } catch (Exception e) {
                            System.out.println(e);
                        }
                       
                    %>
                  
                    <td colspan="5"><a href='Matricula.jsp'><div class="ico-add"></div></a></td>
                    <tr><th colspan="5"></tr>
              
            </table>
            <br><br><br><br>
        </div>

        <%@ include file="../inicio/footer.jsp" %> 
    </body> 
</html>