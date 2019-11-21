<%--suppress ALL --%>


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
        <script src="../Scripts/message.js" type="text/javascript"></script>
        <link href="../CSS/message_skyblue.css" rel="stylesheet" type="text/css"/>
        <meta charset="UTF-8">
        <script>
            var p1 = document.getElementById("clave2").value;
            var p2 = document.getElementById("clave3").value;
            if (p1 != p2) {
                alert("Las passwords deben de coincidir");
                false;
            } else {
                alert("Todo esta correcto");
                return true;
            }
        </script>
    </head>
    <body>
        <%@ include file="../inicio/navegar_Est.jsp" %> 
        <%            HttpSession sec2 = request.getSession();
            String user1 = (String) sec2.getAttribute("nomuser");
            if (user1 == null) {
                response.sendRedirect("Salir.jsp");
            }

        %>
        <div id="logo"></div>

        <div class="contenido">

            <form method="POST" action="../ServResetUser" id="form-clave"> 

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
                            <form method="POST" action="Inicio.jsp">
                                <button class="subcanc" name="cancelar" type="submit">cancelar</button>
                            </form>
                        </li>
                    </ul>
                </div>   
                
                           
                
                
        </div>
        <%   if (sec.getAttribute("msj") != null) {
                String msj;
                msj = (String) sec.getAttribute("msj");
                String a = "cambiado";
                int intIndex = msj.indexOf(a);
                if (intIndex != -1) {
        %>
        <script>
            dhtmlx.alert({
                title: "Confirmar", text: "<%=msj%>",
                callback: function () {
                    window.location.href = 'Inicio.jsp';
            <%sec.setAttribute("msj", null);%>
                }
            });
        </script>  

        <%
        } else {
        %>
        <script>
            dhtmlx.message({
                title: "Error!", text: "<%=msj%>",
                top: '300',
                left: '750',
                expire: 10000,
                type: "alert",
               <%sec.setAttribute("msj", null);%>
               
            });
        </script>  

        <%}
            }%>
    </body>
</html>
