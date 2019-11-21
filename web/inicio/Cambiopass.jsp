
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Funciones.Conexion"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Funciones.Encryp"%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page session='true'%>

<!doctype html>
<html lang="es">
    <head>
        <title>Cambio de contraseña</title>
        <link href="../CSS/Stylcambio.css" rel="stylesheet" type="text/css"/>
        <meta charset="UTF-8">
        <script>
            var p1 = document.getElementById("clave2").value;
            var p2 = document.getElementById("clave3").value;
            if (p1 != p2) {
            alert("Las passwords deben de coincidir");
            return false;
            } else {
            alert("Todo esta correcto");
            return true;
            }
        </script>
    </head>
    <body>

        <div id="logo"></div>

        <div class="contenido">
            
            <form method="POST" action="" id="form-clave"> 

                <div><h3>Cambio de contraseña</h3></div>


                <div class="datos">
                    <ul>
                        <li>
                            <input type="password" id="Usuario" name="clave1" autocomplete="off" placeholder="Contraseña actual">
                        </li>
                        <li>
                            <input type="password" name="clave2" id="clave2" autocomplete="off" placeholder="Contraseña:">
                        </li>
                        <li>
                            <input type="password" name="clave3" id="clave3" autocomplete="off" placeholder="confirme su contraseña">
                        </li>
                        <li>
                            <button class="submit" id="aceptar" name="aceptar" type="submit" onSubmit="return validarPasswd()">Aceptar</button>
                        </li>
                        </form>
                        <li>
                            <form method="POST" action="Login.jsp">
                                <button class="submit" name="cancelar" type="submit">cancelar</button>
                            </form>
                        </li>
                    </ul>
                </div>   
        </div>
        <h4>Debe combiar su contraseña para continuar</h4>    
        <%
            if (request.getParameter("aceptar") != null) {
                HttpSession sec = request.getSession();
                Conexion cn = new Conexion();
                Encryp pass = new Encryp();
                String clave1 = request.getParameter("clave1");
                String clave2 = request.getParameter("clave2");
                String clave3 = request.getParameter("clave3");

                String usuario = (String) sec.getAttribute("user");
                  if (usuario == null) {
                         response.sendRedirect("Salir.jsp");
                           }
                try {

                    if (clave2.equals(clave3)) {

                        if (!clave1.equals(clave3)) {
                            String clave = clave2;
                            String passant = pass.encrypt("92AE31A79FEEB2A3", "0123456789ABCDEF", clave1);
                            String password = pass.encrypt("92AE31A79FEEB2A3", "0123456789ABCDEF", clave);
                            String sSQL1 = "Select  password from Estudiantes where NumDocumento = '" + usuario + "' and password  = '" + passant + "'";
                            Statement st = cn.obtener().createStatement();
                            Statement st2 = cn.obtener().createStatement();
                            ResultSet rs = st.executeQuery(sSQL1);

                            if (rs.next()) {

                                String claveant = rs.getString("password").trim();
                                String sSQL2 = "UPDATE Estudiantes set password =" + "'" + password + "'" + ", passven = GETDATE() + 30 WHERE NumDocumento =" + "'" + usuario + "'";
                                st2.executeUpdate(sSQL2);
                                response.sendRedirect("Login.jsp");

                            } else {
                                out.println("<h4>" + "Verifique la contraseña actual" + "</h4>");
                            }

                        } else {
                            out.println("<h4>" + "La contraseña no puede ser igual a la anterior" + "</h4>");
                        }

                    } else {
                        out.println("<h4>" + "Las contraseñas no coinciden" + "</h4>");
                    }

                } catch (Exception e) {
                    out.println("<h4>" + "Usuario ya existe" + "</h4>");
                }

            }
        %>


    </body>
</html>
