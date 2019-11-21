<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLClientInfoException"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Funciones.Conexion"%>
<%@page session='true'%>
<%@page session='true'%>
<!doctype html>
<html lang="es">
    <head>
        <title>Estudiantes</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../CSS/stylest.css" rel="stylesheet" type="text/css"/>
        <link href="../CSS/Stylnav.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" />
        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        <script src="Scripts/scripts.js" type="text/javascript"></script>
        <script>
            $(function () {
                $("#datepicker").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    yearRange: '1950:2018'
                });
            });
        </script>
    </head>
    <body>
        <%@ include file="../inicio/navegar.jsp" %> 
        <div id="logo"></div>

        <div class="contenido">
            <h2>Registro Usuario</h2>
            <div class="contenido1">
                <form class="contacto" action="../ServRegUsuario" method="post">
                    <ul>
                        <li>
                            <label for="tipoc">Documento:</label>
                            <select name="tipoc" required>
                                <option  name="tipoc" value="" selected disabled></option>
                                <option name="tipoc" value="1" >C.C</option>
                                <option name="tipoc" value="2" >T.I</option>
                            </select> 
                            <input type="number" id="tipoc1" name="numdoc" min="999" max="99000000000" autocomplete="off" placeholder="Numero" required/>
                        </li>
                        <li>
                            <label for="nombre">Nombres:</label>
                            <input type="text" name="nombre" placeholder="Nombres" required />
                        </li>

                        <li>
                            <label for="apellido">Apellidos:</label>
                            <input type="text" name="apellido"  placeholder="Apellidos" required />
                        </li>

                        <li>
                            <label for="Fecha">FNacimiento:</label>
                            <input type="date" name="fecha" max="1995-12-31" placeholder="mm/dd/aaaa" required />
                        </li>

                        <li class="gen" >
                            <label for="sexo" id="tipgen">Sexo:</label>  
                            <input type="radio" class="gen" name="tipgen" class="sexo" value="hombre" required/>Hombre
                            <input type="radio" class="gen" name="tipgen" class="sexo" value="mujer" required/>Mujer
                        </li>

                    </ul>
            </div>
            <div class="contenido2">
                <ul>

                    <li>
                        <label for="mail">Email:</label>
                        <input type="email" name="email" placeholder="Email" />
                    </li>
                    <li>
                        <label for="direccion">Direccion:</label>
                        <input type="text" name="direccion" placeholder="Direccion" required />
                    </li>
                    <li>
                        <label for="ciudad">Ciudad:</label>
                        <input type="text" name="ciudad" placeholder="Ciudad" required />
                    </li>
                    <li>
                        <label for="telefono">Telefono:</label>
                        <input type="number" name="telefono" min="1000000" max="99999999" placeholder="telefono" required />
                    </li>

                    <li>
                        <label for="celular">Celular:</label>
                        <input type="number" name="celular" min="1000000000" max="99999999990" placeholder="celular" />
                    </li>

                </ul>

            </div>
            <button class="submit" type="submit">Enviar</button>
        </form>
       
    </div>
    <BR>
     <%  
         String mes = "";
            mes = request.getParameter("mes");
            try {
                if (!mes.equals(null)) {
                    String a = "UNIQUE";
                    int intIndex = mes.indexOf(a);
                    if (intIndex != -1) {
                     out.println("<p class='alert-danger'> Hay un usuario registrado con el mismo número de cedula</p>");
                    }else{
                     out.println("<p class='alert-danger'>"+mes+"</p>");
                    }
                }
            } catch (Exception e) {
            }
                  %>
    
    <%@ include file="../inicio/footer.jsp" %>  
</body> 
</html>
