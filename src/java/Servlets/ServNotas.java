/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Funciones.Fnotas;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
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
import modelo.aNotas;

/**
 *
 * @author jeiso
 */
public class ServNotas extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            try {

                HttpSession sec = request.getSession();//creamos un objeto sesion
                int matria = 1;
                int apr = 0;
                Fnotas fun = new Fnotas();
                aNotas dts = new aNotas();
                String apro = "";

                
                Vector notas = new Vector();
                Vector materias = new Vector();
                Vector<Integer> idmater = new Vector();
                dts.setIdEstudiante((Integer) sec.getAttribute("idusuario")); //capturamos de la sesion el idusuario
                String anio = (String) sec.getAttribute("anio");//capturamos de la sesion el año de la matricula
                String semestre = (String) sec.getAttribute("semestre");//capturamos de la sesion el semestre de la matricula
                String ciclo = (String) sec.getAttribute("ciclo");//capturamos de la sesion el ciclo de la matricula
                if (ciclo.equals("Avanzado")) {
                    matria = 7;
                }
                dts.setIdMateria(matria);//capturamos el id de la materia
                ResultSet rs = fun.validaN(dts.getIdEstudiante(), anio, semestre);

                if (rs.next()) {
                    dts.setIdMatricula(rs.getInt("IdMatricula"));//capturamos de la BD el ide de la matricula
                    sec.setAttribute("user", dts.getIdMatricula());
                }
                //capturamos las notas del formulario
                notas.addElement(request.getParameter("nota1"));
                notas.addElement(request.getParameter("nota2"));
                notas.addElement(request.getParameter("nota3"));
                notas.addElement(request.getParameter("nota4"));
                notas.addElement(request.getParameter("nota5"));
                notas.addElement(request.getParameter("nota6"));
                sec.setAttribute("notas", notas);

                for (int j = 0; j < 6; j++) {
                    idmater.addElement(matria);
                    matria++;
                }
                 for (int j = 0; j < 6; j++){
                 materias.addElement(fun.mater(ciclo).get(j).toString());//capturamos el nombre de la materia segun el ciclo
                 }
                  sec.setAttribute("materias", materias);//guardamos el nombre de la materia en una sesion
                
                //Insertamos las notas y las materias en la base de datos
                for (int j = 0; j < idmater.size(); j++) {
                    fun.insertar(dts.getIdEstudiante(), idmater.get(j), dts.getIdMatricula(), materias.get(j).toString(), notas.get(j).toString());
                    if (notas.get(j).toString().equals("Bajo")) {//si alguna materia tiene la nota Bajo registra desaprobado el ciclo
                        apr++;
                        
                    }
                    
                    if (apr == 0) {
                        sec.setAttribute("aprobar", "APROBO");
                    } else {
                        sec.setAttribute("aprobar", "DESAPROBO");
                    }

                }
                
             response.sendRedirect("admin/Conf.jsp");
             
            } catch (SQLException e) {
                System.out.println(e);
            }
            out.println("<title>Servlet ServNotas</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServNotas at " + request.getContextPath() + "</h1>");

           
            out.println("</body>");
            out.println("</html>");
        } catch (Exception e) {
            System.out.println(e);

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
            Logger.getLogger(ServNotas.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ServNotas.class.getName()).log(Level.SEVERE, null, ex);
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
