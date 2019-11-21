/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Funciones.Fcertificado;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.aEstudiante;

/**
 *
 * @author jzapata
 */
public class ServCertificado extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            ResultSet rs;
            Vector notas = new Vector();
            Vector materias = new Vector();
            aEstudiante dts = new aEstudiante();
            HttpSession sec = request.getSession();
            Fcertificado fun = new Fcertificado();
            String matr = request.getParameter("matr");
            rs = fun.Rcertifica(matr);
            int apr = 0;
            String IdEstudiante = "";
            String NomEstudiante = "";
            String ApllEstudiante = "";

            while (rs.next()) {
                sec.setAttribute("idusuario", rs.getString("IdEstudiante"));
                NomEstudiante = rs.getString("NomEstudiante");
                ApllEstudiante = rs.getString("ApllEstudiante");
                String nombres = NomEstudiante + "" + ApllEstudiante;
                sec.setAttribute("nombres", nombres);
                sec.setAttribute("anio", rs.getString("aniomatr"));
                sec.setAttribute("semestre", rs.getString("semestre"));
                sec.setAttribute("ciclo", rs.getString("Ciclo"));
                sec.setAttribute("jornada", rs.getString("Jornada"));
                sec.setAttribute("tipdoc", rs.getString("IdDocumento"));
                sec.setAttribute("numdoc", rs.getString("Numdocumento"));
                sec.setAttribute("user", rs.getString("Idmatricula"));
                materias.addElement(rs.getString("Materia"));
                notas.addElement(rs.getString("NotaFinal"));
                sec.setAttribute("materias", materias);
                sec.setAttribute("notas", notas);

            }

            for (int i = 0; i < notas.size(); i++) {
                if (notas.get(i).toString().equals("Bajo")) {
                    apr++;
                }
            }

            if (apr == 0) {
                sec.setAttribute("aprobar", "APROBADO(A)");
            } else {
                sec.setAttribute("aprobar", "DESAPROBADO(A)");
            }

            response.sendRedirect("admin/certificar.jsp");
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Servceriticado</title>");
            out.println("<p>" + IdEstudiante + "," + NomEstudiante + "," + ApllEstudiante + "</p>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Servceriticado at " + request.getContextPath() + "</h1>");
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
        } catch (SQLException ex) {
            Logger.getLogger(ServCertificado.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(ServCertificado.class.getName()).log(Level.SEVERE, null, ex);
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
