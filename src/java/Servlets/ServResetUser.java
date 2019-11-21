/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Funciones.Conexion;
import Funciones.Encryp;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jeison
 */
public class ServResetUser extends HttpServlet {

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
            Conexion cn = new Conexion();
            Encryp pass = new Encryp();
            String msj;
            String clave1 = request.getParameter("clave1");
            String clave2 = request.getParameter("clave2");
            String clave3 = request.getParameter("clave3");
            String usuario = (String) sec1.getAttribute("user");
            try {

                if (clave2.equals(clave3)) {

                    if (!clave1.equals(clave3)) {
                        String clave = clave2;
                        String passant = pass.encrypt("92AE31A79FEEB2A3", "0123456789ABCDEF", clave1);
                        String password = pass.encrypt("92AE31A79FEEB2A3", "0123456789ABCDEF", clave);
                        String sSQL1 = "Select  password from Estudiantes where NumDocumento = '" + usuario + "' and password  = '" + passant + "'";
                        Statement st = cn.obtener().createStatement();
                        Statement st2 = cn.obtener().createStatement();
                        ResultSet rs = st.executeQuery(sSQL1);

                        if (rs.next()) {

                            String claveant = rs.getString("password").trim();
                            String sSQL2 = "UPDATE Estudiantes set password =" + "'" + password + "'" + ", passven = GETDATE() + 30 WHERE NumDocumento =" + "'" + usuario + "'";
                            st2.executeUpdate(sSQL2);
                            msj = "Se ha cambiado su contraseña";
                            sec1.setAttribute("msj", msj);
                                                       
                        } else {
                            msj = "Verifique la contraseña actual";
                            sec1.setAttribute("msj", msj);

                        }

                    } else {
                        msj = "La contraseña no puede ser igual a la anterior";
                        sec1.setAttribute("msj", msj);

                    }

                } else {
                    msj = "Las contraseñas no coinciden";
                    sec1.setAttribute("msj", msj);
                }

            } catch (Exception e) {
                out.println("<h4>" + "Usuario ya existe" + "</h4>");
            }

            response.sendRedirect("user/Cambiopas.jsp");

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServResetUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServResetUser at " + request.getContextPath() + "</h1>");
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
