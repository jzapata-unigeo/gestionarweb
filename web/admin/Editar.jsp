<%-- 
    Document   : editar.jsp
    Created on : 26/04/2018, 03:48:48 PM
    Author     : jzapata
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Funciones.Conexion"%>
<%@ page import = "java.io.*,java.util.*" %>

<!DOCTYPE html>
<html>
    <head>

        <link href="../CSS/stylest.css" rel="stylesheet" type="text/css"/>
        <link href="../CSS/sweetalert2.min.css" rel="stylesheet" type="text/css"/>
        <script src="../Scripts/sweetalert2.min.js" type="text/javascript"></script>
        <title>Edicion</title>
    </head>
    <body>
        <%@ include file="../inicio/navegar.jsp" %>  
        <%Conexion cn = new Conexion();
            String cod = request.getParameter("cod");
            String checkh = "";
            String checkm = "";
            String SQL = "SELECT * FROM Estudiantes where IdEstudiante ='" + cod + "'";
            HttpSession Sec = request.getSession();
            Sec.setAttribute("idusuario", cod);
            Statement st = cn.obtener().createStatement();
            ResultSet rs = st.executeQuery(SQL);
            if (rs.next()) {

                String tipdoc = (String) rs.getString("IdDocumento");
                if (tipdoc.equals("1")) {
                    tipdoc = "C.C";
                } else {
                    tipdoc = "T.I";
                }

                String numdoc1 = rs.getString("NumDocumento").trim();

                Long numdoc = new Long(numdoc1);
                String nombre = rs.getString("NomEstudiante").trim();
                String apellido = rs.getString("ApllEstudiante").trim();
                String gen = rs.getString("sexo").trim();
                if (gen.trim().equals("hombre")) {
                    checkh = ("checked");
                } else {
                    checkm = ("checked");
                }
                String fecha = rs.getString("FecNacimiento").trim();
                String email = rs.getString("Email").trim();
                String dir = rs.getString("Direccion").trim();
                String ciudad = rs.getString("Ciudad").trim();
                int telefono = Integer.parseInt(rs.getString("Telefono").trim());
                String celular = (rs.getString("Celular").trim());

                int r;
        %>

        <div id="logo"></div>
        <div class="contenido">

            <h2>Editar Datos Basicos</h2>
            <div class="contenido1">
                <form class="contacto" action="http://localhost:8080/GestionarWeb.com/Servactualiza" method="post">
                    <ul>
                        <li>
                            <label for="tipoc">Documento:</label>
                            <select name="tipoc"  required>
                                <option id="tipoc" name="tipoc" value="<%=tipdoc%>" readonly ><%=tipdoc%></option>
                            </select> 
                            <input type="tel" id="tipoc" name="numdoc" value="<%=numdoc%>" placeholder="Numero" readonly />
                        </li>
                        <li>
                            <label for="nombre">Nombres:</label>
                            <input type="text" name="nombre" value="<%=nombre%>" placeholder="Nombres" required />
                        </li>

                        <li>
                            <label for="apellido">Apellidos:</label>
                            <input type="text" name="apellido" value="<%=apellido%>" placeholder="Apellidos" required />
                        </li>

                        <li>
                            <label for="Fecha">Fecha:</label>
                            <input type="text" id="datepicker" name="fecha" placeholder="Fecha de nacimiento" value="<%=fecha%>"  required />
                        </li>

                        <li class="gen" >
                            <label for="sexo" id="tipgen">Sexo:</label>  
                            <input type="radio" class="gen" name="tipgen" class="sexo" value="hombre" required <%=" " + checkh%>/>Hombre
                            <input type="radio" class="gen" name="tipgen" class="sexo" value="mujer" required  <%=" " + checkm%>/>Mujer
                        </li>

                    </ul>
            </div>
            <div class="contenido2">
                <ul>

                    <li>
                        <label for="mail">Email:</label>
                        <input type="email" name="email" placeholder="Email" value="<%=email%>" />
                    </li>
                    <li>
                        <label for="direccion">Direccion:</label>
                        <input type="text" name="direccion" placeholder="Direccion" value="<%=dir%>"  required />
                    </li>
                    <li>
                        <label for="ciudad">Ciudad:</label>
                        <input type="text" name="ciudad" placeholder="Ciudad" value="<%=ciudad%>" required />
                    </li>
                    <li>
                        <label for="ciudad">Telefono:</label>
                        <input type="number" name="telefono" placeholder="telefono" value="<%=telefono%>" required />
                    </li>

                    <li>
                        <label for="celular">Celular:</label>
                        <input type="number" name="celular" placeholder="celular" value="<%=celular%>"/>
                    </li>
                </ul>
            </div>
            <input class="submit" nombre="edit" type="submit" value="Editar">
            </form>
            <% }%>
        </div>

        <%
            try {

                if (sec1.getAttribute("mensajeu").equals("1")) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("Swal({title: 'Usuario actualizado',confirmButtonText: 'Aceptar'}).then(okay => {");
                    out.println("if (okay) {");
                    out.println("window.location.href = 'http://localhost:8080/GestionarWeb.com/admin/Consulta.jsp';");
                    out.println("}})");
                    out.println("</script>");
                    sec1.setAttribute("mensajeu", "0");

                }

            } catch (Exception e) {
            }
        %>
        <%@ include file="../inicio/footer.jsp" %> 
    </body>
</html>
