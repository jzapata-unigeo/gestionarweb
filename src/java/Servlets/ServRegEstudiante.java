/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Funciones.Conexion;
import Funciones.Encryp;
import Funciones.FregEstudiante;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.aEstudiante;
import java.text.SimpleDateFormat;

/**
 *
 * @author jzapata
 */
public class ServRegEstudiante extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //creamos una sesion para guardar los datos del usuario que se loguea    
            HttpSession sec = request.getSession();
            //Instanciamos nuestros obgetos 
            Conexion cn = new Conexion();//Instanciamos la conexion a la base
            aEstudiante dts = new aEstudiante();//Getters y settersint r;
            FregEstudiante fun = new FregEstudiante();//funciones
            ResultSet rs;//variable para realizar consulta en la base de datos 
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Encryp pass = new Encryp();//Instanciamos un obgeto para la encripcion de la clave
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Registro</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>" + "Estudiantes" + "</h1>");
            int r;
            //capturamos la informacion enviada desde los formularios
            dts.setIdDocumento(request.getParameter("tipoc"));
            sec.setAttribute("tipdoc", dts.getIdDocumento());
            dts.setNumDocumento(request.getParameter("numdoc").trim());
            sec.setAttribute("numdoc", dts.getNumDocumento());
            
            if (fun.validastr(dts.getNumDocumento())){
            response.sendRedirect("../GestionarWeb.com/admin/Estudiantes.jsp?mes=" + "No");
            }
            
            dts.setNomEstudiante(request.getParameter("nombre").trim());
            dts.setApllEstudiante(request.getParameter("apellido").trim());
            dts.setSexo(request.getParameter("tipgen").trim());
            String fecha = request.getParameter("fecha").trim();
            dts.setFecNacimiento(fecha);
            dts.setEmail(request.getParameter("email").trim());
            dts.setTelefono(request.getParameter("telefono").trim());
            dts.setDireccion(request.getParameter("direccion").trim());
            dts.setCiudad(request.getParameter("ciudad").trim());
            dts.setCelular(request.getParameter("celular").trim());
            dts.setPassword(pass.encrypt("92AE31A79FEEB2A3", "0123456789ABCDEF", dts.getNumDocumento()));
            dts.setPassven(formatter.format(fun.fecven(fun.fecha())));
            dts.setNomapellido(dts.getNomEstudiante() + " " + dts.getApllEstudiante());
            sec.setAttribute("nombres", dts.getNomapellido());
            try {

                if (fun.insertar(dts)) {//si los datos se insertan 
                    //consultamos los datos del usuario para obtener el id del usuario
                    rs = fun.validae(dts.getNumDocumento());
                   
                    if (rs.next()) {
                        dts.setIdEstudiante(rs.getInt("IdEstudiante"));
                        HttpSession Sec = request.getSession();
                        Sec.setAttribute("idusuario", dts.getIdEstudiante());//guardamos en una variable de sesion el id del usuario
                        response.sendRedirect("../GestionarWeb.com/admin/Matricula.jsp");//redirigimos a la pagina para el registro de matricula
                    }
                } else {
                    out.println("<h3>" + "error" + fun.getErrorU() + "</h3>");
                }
                out.println("</body>");
                out.println("</html>");
            } catch (Exception e) {
                out.println("<h3>" + e + "</h3>");
                response.sendRedirect("../GestionarWeb.com/admin/Estudiantes.jsp?mes=" + e);
            }
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ServRegEstudiante.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ServRegEstudiante.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
