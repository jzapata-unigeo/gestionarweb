<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page session='true'%>
     <!doctype html>
<html lang="es">
 <head>
<script>
    function formatDate(date) {
        var d = new Date(date),
                month = '' + (d.getMonth() + 1),
                day = '' + d.getDate(),
                year = d.getFullYear();
        if (month.length < 2)
            month = '0' + month;
        if (day.length < 2)
            day = '0' + day;
        return [year, month, day].join('-');
    }

</script>
   
        <title>Inicio</title>
        <link href="../CSS/styleini.css" rel="stylesheet" type="text/css"/>
        <meta charset="UTF-8">
    </head>

    <body>

        <div id="logo"></div>
        <%@ include file="../inicio/navegar.jsp" %> 
        <%@ include file="../inicio/footer.jsp" %>  
    </body> 
</html>