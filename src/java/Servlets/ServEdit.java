/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Funciones.Fconsulta;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
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
 * @author Jeison
 */
public class ServEdit extends HttpServlet {

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
            aEstudiante dts = new aEstudiante();
            Fconsulta fun = new Fconsulta();
            int cont = 0;

            HttpSession sec = request.getSession();
            dts.setNumDocumento(request.getParameter("cod"));
            String cod = request.getParameter("cod");
            String checkh = "";
            String checkm = "";
            ResultSet rs = fun.consultarEst(dts.getNumDocumento());
            int n = 0;

            if (rs.next()) {
                sec.setAttribute("IdEstudiante", rs.getString("IdEstudiante"));
                dts.setNomEstudiante(rs.getString("NomEstudiante"));
                sec.setAttribute("nombre", dts.getNomEstudiante());
                dts.setApllEstudiante(rs.getString("ApllEstudiante").trim());
                sec.setAttribute("apell", dts.getApllEstudiante());
                sec.setAttribute("nombres", dts.getNomEstudiante() + " " + dts.getApllEstudiante());
                sec.setAttribute("NumDocumento", dts.getNumDocumento());
                sec.setAttribute("sexo", rs.getString("Sexo").trim());
                sec.setAttribute("telefono", rs.getString("Telefono").trim());
            }

            rs = fun.consultarMtr(dts.getNumDocumento());

            int nd = fun.getrow(dts.getNumDocumento());

            String[][] matricula = new String[nd][5];

            while (rs.next()) {
                matricula[n][0] = rs.getString("aniomatr").trim();
                matricula[n][1] = rs.getString("Jornada").trim();
                matricula[n][2] = rs.getString("Ciclo").trim();
                matricula[n][3] = rs.getString("Semestre").trim();
                matricula[n][4] = rs.getString("idmatricula").trim();

                n++;
            }
            sec.setAttribute("matricula", matricula);
            response.sendRedirect("admin/Consulta_Ver.jsp");
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServEdit</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServEdit at " + request.getContextPath() + "</h1>");
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
            Logger.getLogger(ServEdit.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ServEdit.class.getName()).log(Level.SEVERE, null, ex);
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
