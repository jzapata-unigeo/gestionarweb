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
        <title>Inicio</title>
        <link href="../CSS/styleini.css" rel="stylesheet" type="text/css"/>
        <meta charset="UTF-8">
    </head>

    <body>
        <div id="logo"></div>
        <div class="container">
        </div>
        <script>
            dhtmlx.alert({
                title: "Confirmar", text: "Usuario registrado",
                callback: function () {
                    window.location.href = 'Inicio.jsp';
                }
            });
        </script>   

</html>