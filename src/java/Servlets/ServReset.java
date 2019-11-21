/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Funciones.Conexion;
import Funciones.Encryp;
import Funciones.Flogin;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author GestionarWeb
 */
public class ServReset extends HttpServlet {

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

            HttpSession sec1 = request.getSession();
            Conexion cn = new Conexion();
            Encryp pass = new Encryp();
            Flogin func = new Flogin();
            String msj;
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String vencimiento = formatter.format(func.fecven(func.fecha()));
            String usuario = request.getParameter("usuario");
            String password = pass.encrypt("92AE31A79FEEB2A3", "0123456789ABCDEF", usuario);
            int r;
            String SQL = "UPDATE Estudiantes set password = ?, passven = ? WHERE Numdocumento = ?";
            PreparedStatement ps = cn.obtener().prepareStatement(SQL);
            ps.setString(1, password);
            ps.setString(2, vencimiento);
            ps.setString(3, usuario);
            r = ps.executeUpdate();
            if (r != 0) {
                msj = "true";
                sec1.setAttribute("msj", msj);
               
            } else {
                msj = "";
                sec1.setAttribute("msj", msj);
                
            }
           
            response.sendRedirect("admin/Cambiopas_usu.jsp");
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServReset</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServReset at " + request.getContextPath() + "</h1>");
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ServReset.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ServReset.class.getName()).log(Level.SEVERE, null, ex);
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
