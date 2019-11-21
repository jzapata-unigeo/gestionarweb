/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Funciones.Feditar;
import modelo.aEditar;
import javax.servlet.http.HttpSession;
import jdk.internal.org.objectweb.asm.commons.StaticInitMerger;

/**
 *
 * @author jzapata
 */
public class Servactualiza extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession sec1 = request.getSession();
            String user = (String) sec1.getAttribute("nomuser");
            if (user == null) {
                response.sendRedirect("Salir.jsp");
            }
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Servactualiza</title>");
            out.println("</head>");
            out.println("<body>");
            String idestudiante = "";
            Feditar fun = new Feditar();
            aEditar dts = new aEditar();

            dts.setNomEstudiante(request.getParameter("nombre"));
            dts.setApllEstudiante(request.getParameter("apellido"));
            dts.setNomapellido(dts.getNomEstudiante() + " " + dts.getApllEstudiante());
            sec1.setAttribute("nombres", dts.getNomapellido());
            dts.setEmail(request.getParameter("email"));
            dts.setTelefono(request.getParameter("telefono"));
            dts.setDireccion(request.getParameter("direccion"));
            dts.setCiudad(request.getParameter("ciudad"));
            dts.setCelular(request.getParameter("celular"));
            idestudiante = (String) sec1.getAttribute("idusuario");
            dts.setIdEstudiante(Integer.parseInt(idestudiante));
            try {
                if (fun.actualizar(dts)) {

                    sec1.setAttribute("mensajeu", "1");
                    response.sendRedirect("http://localhost:8080/GestionarWeb.com/admin/Editar.jsp?cod=" + idestudiante);

                }
            } catch (Exception e) {
                out.println("<h1> error: " + e + "</h1>");

            }

            out.println("</body>");
            out.println("</html>");

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
        processRequest(request, response);
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
        processRequest(request, response);
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
