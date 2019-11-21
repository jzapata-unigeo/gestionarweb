<%-- 
    Document   : prueba
    Created on : 15/10/2018, 03:06:49 PM
    Author     : jeiso
--%>

<%@page import="Funciones.Fnotas"%>
<%@page import="modelo.aNotas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%

            Fnotas fun = new Fnotas();
            //aNotas dts = new aNotas();
            int i = 0;
            String ciclo = "Avanzada";
            //fun.mater(ciclo).get(1);

        %>
        <h1><%=fun.mater(ciclo).get(1)%></h1>
        <h2><%=fun.mater(ciclo).get(4)%></h1>
        <h3><%=fun.mater(ciclo).get(0)%></h3>
        <h4><%=fun.mater(ciclo).get(5)%></h3>
        <h1><%=fun.mater(ciclo).get(2)%></h1>

    </body>



</html>
