<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page session='true'%>

<!doctype html>
<html lang="es">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../CSS/stylmatr.css" rel="stylesheet" type="text/css"/>
        <link href="../CSS/Stylnav.css" rel="stylesheet" type="text/css"/>
         <link href="../CSS/Stylefoot.css" rel="stylesheet" type="text/css"/>
        <title>Matricula</title>
    </head>

    <body>
        <%@ include file="../inicio/navegar.jsp" %>  
        <div id="logo"></div>
        <div class="contenido">
            <h2>Matricula</h2>
            <p class="datos">
                <% HttpSession sec = request.getSession();
                    String nombre = (String) sec.getAttribute("nombres");

                %><%=nombre%></p>

            <div class="contenido1">
                <form class="contacto" action= "../ServMatricula" method="post">
                    <ul>
                        <li>
                            <label for='anio'>Año:</label>
                            <select name='anio' id='anio' required>
                                <option value="" disable></option> 
                                <%
                                    for (int i = 1995; i < 2000; i++) {
                                        out.println("<option value='" + i + "'>" + i + "</option>");
                                    }
                                %>
                            </select>
                        </li>
                        <li>
                            <label for="semestre">Semestre:</label>
                            <select name="semestre" id="semestre" required>
                                <option value=""></option>
                                <option value="1" >1</option>
                                <option value="2" >2</option>
                            </select>
                        </li>  
                    </ul>
            </div>
            <div class="contenido2">
                <ul>
                    <li>
                        <label for="jornada">Jornada:</label>
                        <select name="jornada" id="semestre" required>
                            <option value=""></option>
                            <option value="Diurna" >Diurna</option>
                            <option value="Nocturna" >Nocturna</option>
                        </select>
                    </li>                   
                    <li>
                        <label for="apellido">Ciclo:</label>
                        <select name="ciclo" id="ciclo" required>
                            <option value=""></option>
                            <option value="Basico" >Basico</option>
                            <option value="Avanzado">Avanzado</option>
                        </select>
                    </li>        
                </ul>
            </div> 
            <button class="submit" type="submit">Enviar</button>
        </form>
 <%@ include file="../inicio/footer.jsp" %>
    </div>
    <br><br><br>
      <%  
         String mes = "";
            mes = request.getParameter("mes");
            try {
                if (!mes.equals(null)) {
                    String a = "UNIQUE";
                    int intIndex = mes.indexOf(a);
                    if (intIndex != -1) {
                     out.println("<p class='alert-danger'> El usuario ya tiene registrada una matricula para este año - semestre</p>");
                    }else{
                     out.println("<p class='alert-danger'>"+mes+"</p>");
                    }
                }
            } catch (Exception e) {
            }
                  %>
    
</body> 
</html>