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

    <link href="../CSS/stylest.css" rel="stylesheet" type="text/css"/>
    <title>Edicion</title>
</head>
<body>
    <%@ include file="../inicio/navegar_Est.jsp" %> 
    <%Conexion cn = new Conexion();
        HttpSession sec1 = request.getSession();

        String idusuario = (String) sec1.getAttribute("idestudiante");
        String checkh = "";
        String checkm = "";
        String SQL = "SELECT * FROM Estudiantes where IdEstudiante ='" + idusuario + "'";
        String tipdoc = "";
        String select1 = "selected";
        String select2 = "selected";

        Statement st = cn.obtener().createStatement();
        ResultSet rs = st.executeQuery(SQL);
        if (rs.next()) {
            String id = rs.getString("IdEstudiante").trim();
            sec1.setAttribute("idestudiante", id);
            String tipdoc1 = (String) rs.getString("IdDocumento").trim();
            if (tipdoc1.equals("1")) {
                tipdoc = "C.C";
            } else {
                tipdoc = "T.I";
            }
            String numdoc = rs.getString("NumDocumento").trim();

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
            if (user == null) {
                response.sendRedirect("Salir.jsp");
            }
            int r;
    %>
    <div id="logo"></div>
    <div class="contenido">
        <h2>Editar Datos Basicos</h2>
        <div class="contenido1">
            <form class="contacto" action="Datedit_Est.jsp" method="post">
                <ul>
                    <li>
                        <label for="tipoc">Documento:</label>
                        <select name="tipoc"  required>
                            <option name="tipoc" value="<%=tipdoc%>" readonly><%=tipdoc%></option>
                        </select>
                        <!--                        <select name="tipoc" required>
                                                    <option name="tipoc" value="1" <%=select1%>>C.C</option>
                                                    <option name="tipoc" value="2" <%=select2%>>T.I</option>
                                                    <input type="number" id="tipoc1" name="numdoc" value="<%=numdoc%>" autocomplete="off" placeholder="Numero" required />
                                                </select> -->
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
                    <input type="text" autocomplete="off" name="ciudad" placeholder="Ciudad" value="<%=ciudad%>" required />
                </li>
                <li>
                    <label for="telefono">Telefono:</label>
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
        <% }
        %>
    </div>
    <%@ include file="../inicio/footer.jsp" %>  
</body>
</html>
