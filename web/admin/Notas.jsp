
<%@page import="java.util.Vector"%>
<%@page import="javax.swing.plaf.basic.BasicOptionPaneUI"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Funciones.*"%>
<%@page import="modelo.*"%>
<%@page session='true'%>
<!doctype html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <link href="../CSS/stylmater.css" rel="stylesheet" type="text/css"/>
        <link href="../CSS/Stylnav.css" rel="stylesheet" type="text/css"/>
        <link href="../CSS/Stylefoot.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Notas</title>
    </head>

    <body>
        <%@ include file="../inicio/navegar.jsp" %>  
        <%  HttpSession sec = request.getSession();//Declaramos el objeto sesion
            Integer idusuario = (Integer) sec.getAttribute("idusuario");//traemos el idusuario de la sesion
            String nombres = (String) sec.getAttribute("nombres");//traemos el nombre de la sesion
            String anio = (String) sec.getAttribute("anio");//traemos el año de la sesion
            String semestre = (String) sec.getAttribute("semestre");//traemos el semestre de la sesion
            String jornada = (String) sec.getAttribute("jornada");//traemos la jornada de la sesion
            String ciclo = (String) sec.getAttribute("ciclo");//traemos el ciclo de la sesion
            Vector mater = new Vector();
            Fnotas fun = new Fnotas();
            aNotas dts = new aNotas();
              %>
        <div id="logo"></div>
        <div class="contenido">
            <h2>Materias</h2>

            <div class="datos">
                <div class="datos1">
                    <ul>
                        <li><strong>&nbsp;&nbsp;&nbsp;Codigo:</strong>
                            <%=idusuario%></li>
                        <li><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Año:</strong>
                            <%=anio%></li>
                        <li><strong>Semestre:</strong>&nbsp;<%=semestre%></li>
                    </ul>
                </div>
                <div class="datos2">
                    <ul>
                        <li><strong>Nombre:</strong>
                            <%=nombres%></x></li>
                        <li><strong>Jornada:</strong> <%=jornada%></li>
                        <li><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ciclo: </strong><%=ciclo%></li>
                    </ul>
                </div> 
            </div>
            <div class="contenido1">
                <form class="contacto" action="../ServNotas" method="post">
                    <ul>
                        <li>
                            <label for="<%=fun.mater(ciclo).get(0)%>"><%=fun.mater(ciclo).get(0)%>:</label>
                            <select name="nota1" id="<%=fun.mater(ciclo).get(0)%>"required>
                                <option value=""></option>
                                <option value="Bajo">Bajo</option>
                                <option value="Basico">Basico</option>
                                <option value="Alto">Alto</option>
                                <option value="Superior">Superior</option>

                            </select>
                        </li>
                        <li>
                            <label for="<%=fun.mater(ciclo).get(1)%>"><%=fun.mater(ciclo).get(1)%>:</label>
                            <select name="nota2" id="<%=fun.mater(ciclo).get(1)%>"required>
                                <option value=""></option>
                                <option value="Bajo">Bajo</option>
                                <option value="Basico">Basico</option>
                                <option value="Alto">Alto</option>
                                <option value="Superior">Superior</option>
                            </select>
                        </li>  
                        <li>
                            <label for="<%=fun.mater(ciclo).get(2)%>"><%=fun.mater(ciclo).get(2)%>:</label>
                            <select name="nota3" id="<%=fun.mater(ciclo).get(2)%>" required>
                                <option value=""></option>
                                <option value="Bajo">Bajo</option>
                                <option value="Basico">Basico</option>
                                <option value="Alto">Alto</option>
                                <option value="Superior">Superior</option>
                            </select>
                        </li>  
                    </ul>
            </div>
            <div class="contenido2">
                <ul>
                    <li>
                        <label for="<%=fun.mater(ciclo).get(3)%>"><%=fun.mater(ciclo).get(3)%>:</label>
                        <select name="nota4" id="<%=fun.mater(ciclo).get(3)%>" required>
                            <option value=""></option>
                            <option value="Bajo">Bajo</option>
                            <option value="Basico">Basico</option>
                            <option value="Alto">Alto</option>
                            <option value="Superior">Superior</option>
                        </select>
                    </li>
                    <li>
                        <label for="<%=fun.mater(ciclo).get(4)%>"><%=fun.mater(ciclo).get(4)%>:</label>
                        <select name="nota5" id="<%=fun.mater(ciclo).get(4)%>" required>
                            <option value=""></option>
                            <option value="Bajo">Bajo</option>
                            <option value="Basico">Basico</option>
                            <option value="Alto">Alto</option>
                            <option value="Superior">Superior</option>
                        </select>
                    </li>  
                    <li>
                        <label for="<%=fun.mater(ciclo).get(5)%>"><%=fun.mater(ciclo).get(5)%>:</label>
                        <select name="nota6" id="<%=fun.mater(ciclo).get(5)%>" required>
                            <option value=""></option>
                            <option value="Bajo">Bajo</option>
                            <option value="Basico">Basico</option>
                            <option value="Alto">Alto</option>
                            <option value="Superior">Superior</option>
                        </select>
                    </li>  
                </ul>
            </div>
            <button class="submit" type="submit">Enviar</button>
            <br><br><br><br><br><br>
            </form>

            </body> 
            <%@ include file="../inicio/footer.jsp" %>  
            </html>