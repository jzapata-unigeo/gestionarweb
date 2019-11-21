
<%@page import="sun.nio.cs.ext.MSISO2022JP"%>
<%@page import="Funciones.Flogin"%>
<%@page import="java.text.SimpleDateFormat"%>
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
        <script src="../Scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../Scripts/message.js" type="text/javascript"></script>
        <link href="../CSS/message_skyblue.css" rel="stylesheet" type="text/css"/>
        <title>Reseteo de contraseña</title>
        <link href="../CSS/Stylcambio_usu.css" rel="stylesheet" type="text/css"/>
        <meta charset="UTF-8">
    </head>
    <body>
        <%@ include file="../inicio/navegar.jsp" %> 
        <%
            HttpSession sec2 = request.getSession();
            String user1 = (String) sec2.getAttribute("nomuser");
            if (user1 == null) {
                response.sendRedirect("Salir.jsp");
            }

        %>
        <div id="logo"></div>

        <div class="contenido">

            <form method="POST" action="../ServReset"> 
                <div class="usuario"></div>
                <div><p>Reseteo de contraseña</p></div>


                <div class="datos">
                    <ul>
                        <li>
                            <label for="usuario" >Usuario:</label>
                            <input type="number" name="usuario" autocomplete="off" placeholder="usuario">
                        </li>

                        <li>
                            <button class="submit" id="aceptar" name="aceptar" type="submit">Resetear</button>
                        </li>

                        <!--</form>
                        <li>
                            <form method="POST" action="Inicio.jsp">
                                <button class="subcanc" name="cancelar" type="submit">cancelar</button>
                            </form>
                        </li>
                    </ul>-->
                </div>   
        </div>

        <%   if (sec1.getAttribute("msj") != null) {
                String msj;
                msj = (String) sec1.getAttribute("msj");
                if (msj.equals("true")) {%>
        <script>
            dhtmlx.alert({
                title: "Confirmar", text: "Contraseña reseteada correctamente",
                callback: function () {
                    window.location.href = 'Inicio.jsp';
                     <%sec1.setAttribute("msj", null);%>
                }
            });
        </script>  
        <% 
            }else {%>
        <script>
            dhtmlx.alert({
                title: "Confirmar", text: "El usuario no existe",
                callback: function () {
                    <%sec1.setAttribute("msj", null);%>
                    window.location.href = 'Cambiopas_usu.jsp';
                }
            });
        </script>  
        <%
                }
              

            }else{String res= request.getParameter("aceptar");

System.out.println(res);}

        %>

    </body>
</html>
