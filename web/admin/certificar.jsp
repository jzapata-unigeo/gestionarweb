<%@page import="java.util.Vector"%>
<%@page import="Funciones.Conexion"%>
<%@page session="true"%>

<!doctype html>
<head>

    <link href="../CSS/stylcert.css" rel="stylesheet" type="text/css"/>
    <link href="../CSS/Stylnav.css" rel="stylesheet" type="text/css"/>
    <link href="../CSS/Stylefoot.css" rel="stylesheet" type="text/css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="../Scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/jspdf.debug.js" type="text/javascript"></script>

    <title>Certificado</title>
</head>

<body>
    <%@ include file="../inicio/navegar.jsp" %>  
    <div id="print">
        <div class="contenido">
            <h2>Certificado</h2>
            <div id="logo"> </div>
            <% try {

                } catch (Exception e) {
                }
                HttpSession sec = request.getSession();
                sec.getAttribute("notas");
                Vector notas = (Vector) sec.getAttribute("notas");
                Vector mater = (Vector) sec.getAttribute("materias");
                String idusuario = (String) sec.getAttribute("idusuario");
                String nombre = (String) sec.getAttribute("nombres");
                String anio = (String) sec.getAttribute("anio");
                String semestre = (String) sec.getAttribute("semestre");
                String ciclo = (String) sec.getAttribute("ciclo");
                String jornada = (String) sec.getAttribute("jornada");
                String tipdoc = (String) sec.getAttribute("tipdoc");
                String numdoc = (String) sec.getAttribute("numdoc");
                String aprobo = (String) sec.getAttribute("aprobar");
                String idmatricula = (String) sec.getAttribute("user");

                if (tipdoc.equals("1")) {
                    tipdoc = "C.C";
                } else {
                    tipdoc = "T.I";
                }
                int i = 0;
                int j = 0;
            %>

            <h3>REPUBLICA DE COLOMBIA   <br>
                MINISTERIO DE EDUCACION NACIONAL<br>
                INSTITUCION EDUCATIVA TRIANGULO DEL SABER
                <hr> </h3>
            <p class="dir">SEDE CENTRAL : Carrera 122 # 22 - 55  BOGOTA - COLOMBIA   TELEFONOS: 42454541 -  4344512  NIT: 845125694-4</p>

            <p class="resol"> EL RECTOR DE LA INSTITUCION EDUCATIVA TRIANGULO DEL SABER de la ciudad BOGOTA,con 
                resolución integración N. 1211 de octubre de 2002  y resolución de aprobación N.03955 
                del 17 de septiembre de 2012 y decreto 3011 del 19 de Diciembre de 1997
                emanada de la secretaria de educacion y  cultura de Bogota.</p>

            <h1>CERTIFICA</h1>

            <p class="resol1">Que, <strong><%=nombre%></strong>, identificado(a) con <%=tipdoc%>. <%=numdoc%> curso en esta institución durante el año lectivo <%=anio%>
                del semestre <%=semestre%> el ciclo <%=ciclo%> en la jornada <%=jornada%> de conformidad con el plan de estudios del SISTEMA EDUCATIVO INSTITUCIONAL vigente
                a la fecha como alumno de la institución educativa triangulo del saber ubicado en la ciudad de Bogotá, fue <strong><%=aprobo%></strong> con las siguientes notas:</p>
            <div class="notas">
                <table>
                    <tr>
                        <th>Asignatura</th>
                        <th>Calificacion</th>
                    </tr>
                    <% for (int idx = 0; idx < mater.size(); idx++) {
                            mater.get(idx);%>
                    <tr>
                        <td><%= mater.get(idx)%></td>
                        <td><%=notas.get(idx)%></td>
                    </tr>
                    <%}%>
                </table>
            </div>
            Expedido en Bogotá el 
            <script>
                var meses = new Array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");
                var f = new Date();
                document.write(f.getDate() + " de " + meses[f.getMonth()] + " de " + f.getFullYear());
            </script> 

        </div>
        <br>
    </div>
<!--    <button id="btnprint" onclick="printer()" type="button">Limpiar</button>-->
    <script>
        
        
        
        

//        function printer() {
//
//            var doc = new jsPDF();
//            var specialElementHandlers = {
//                '#editor': function (element, renderer) {
//                    return true;
//                }
//            };
//
//            doc.fromHTML($('#print').html(), 15, 15, {
//                'width': 170,
//                'elementHandlers': specialElementHandlers
//            });
//            doc.save('sample-file.pdf');
//        }

    </script>

    <div id="editor"></div>

    <%@include file="../inicio/footer.jsp"%>
    
</body> 

</html>