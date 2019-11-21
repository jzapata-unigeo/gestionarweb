<%@page import="Funciones.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page session="true"%>
<%@page import="java.util.*"%>
<%@page session='true'%>

<!doctype html>
<html lang="es">
    <head>
        <title>Consulta Notas</title>
        <!--<link href="CSS/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>-->
        <link href="../CSS/styleconsnotas.css" rel="stylesheet" type="text/css"/>
        <script src="../Scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../Scripts/jquery.dataTables.min.js" type="text/javascript"></script>
    </head>
    <body>
        <%@ include file="../inicio/navegar.jsp" %>  
        <div id="logo"></div>
        <div class="contenido">
            <h2>Consulta</h2>

            <%  HttpSession sec = request.getSession();
                String anio = (String) sec.getAttribute("anio");
                String semestre = (String) sec.getAttribute("semestre");
                int idmatricula = (Integer) sec.getAttribute("Idmatricula");
                try {
            %>

            <h3><%="Periodo: " + anio + "-" + semestre%></h3>
            <table id="table_id" class="display">

                <%
                    Vector mater = (Vector) sec.getAttribute("materia");
                    Vector notas = (Vector) sec.getAttribute("notas");
                    out.println("<tr>");
                    out.println("<th>Asignatura</th>");
                    out.println("<th>Calificacion</th>");
                    out.println("</tr>");
                    for (int idx = 0; idx < mater.size(); idx++) {

                        out.println("<tr>");
                        out.println("<td>");
                        out.println(mater.elementAt(idx));
                        out.println("</td>");
                        out.println("<td>");
                        out.println(notas.elementAt(idx));
                        out.println("</td>");
                        out.println("</tr>");
                    }
                %>
            </table>  
            <a href="http://localhost:8080/GestionarWeb.com/Servceriticado?matr=idmatricula%>">
                <div class="ico-cert">
                </div></a>
            <div class="cert">certificado
            </div>
            <%
            } catch (Exception e) {
            %>
            <table id="table_id" class="display">
                <%      out.println("<tr>");
                        out.println("<th>Asignatura</th>");
                        out.println("<th></th>");
                        out.println("</tr>");
                        out.println("<tr>");
                        out.println("<td>");
                        out.println("El usuario no tiene notas registradas ");
                        out.println("</td>");
                        out.println("<td>");
                        out.println("<a href='Notas.jsp'>Agregar");
                        out.println("</td>");
                    }
                %>  
            </table>
        </div>

        <%@ include file="../inicio/footer.jsp"%>             
    </body> 
</html>