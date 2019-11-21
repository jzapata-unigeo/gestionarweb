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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.aLogin;

/**
 *
 * @author Gestionar T&D
 */
public class ServLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ParseException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Conexion cn = new Conexion();
            try {
                //creamos una sesion para guardar los datos del usuario que se loguea    
                HttpSession sec = request.getSession();
                
                Flogin func = new Flogin();
                aLogin dts = new aLogin();
                String cod;
                ResultSet rs;

                //creamos un objeto para la encripcion del password
                Encryp pass = new Encryp();

                //se formate la fecha
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                Date fecha = formatter.parse(func.dia());
                //capturamos la clave digitada y se encripta
                String clave = request.getParameter("password");
                
                dts.setPassword(pass.encrypt("92AE31A79FEEB2A3", "0123456789ABCDEF", clave));
                dts.setNumDocumento(request.getParameter("usuario"));
               
                rs = func.validar(dts.getNumDocumento(), dts.getPassword());
                
                if (rs.next()) {
                    dts.setTipo(rs.getInt("Tipo"));
                    dts.setPassven(formatter.parse(rs.getString("passven")));
                    dts.setNomEstudiante(rs.getString("NomEstudiante"));
                    dts.setApllEstudiante(rs.getString("ApllEstudiante"));
                    
                    sec.setAttribute("user", dts.getNumDocumento()); //capturamos el NIP del usuario en la sesion user
                    sec.setAttribute("nomuser", dts.getNomEstudiante() + " " + dts.getApllEstudiante());//capturamos el nombre y apellido del  usuario en la sesion nomuser
                    //si la contraseña lleva mas de un mes en uso o el usuario se acaba de crear se envia al formulario para cambio de contraseña
                    if (fecha.after(dts.getPassven())) {
                        response.sendRedirect("inicio/Cambiopass.jsp");
                    } else {
                        //dependiendo el tipo de usuario se reenvia a su respectivo formulario
                        if (dts.getTipo() == 1) {
                            response.sendRedirect("admin/Inicio.jsp");
                            
                        }
                        if (dts.getTipo() == 2) {
                            sec.setAttribute("cod", dts.getNumDocumento());
                            response.sendRedirect("user/Inicio.jsp");
                        }
                        if (dts.getTipo() == 3) {
                            sec.setAttribute("cod", dts.getNumDocumento());
                            response.sendRedirect("user/Inicio.jsp");
                        }
                    }
                    
                } else {
                    rs.close();
                    sec.setAttribute("mensaje", "Usuario o contraseña invalida");
                    response.sendRedirect("inicio/Login.jsp");
                }
                RequestDispatcher rd = request.getRequestDispatcher("/inicio/Login.jsp");
                rd.forward(request, response);
            } catch (SQLException e) {
                out.println("<h1>" + e + "</h1>");
                
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
        } catch (SQLException ex) {
            Logger.getLogger(ServLogin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ServLogin.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ServLogin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ServLogin.class.getName()).log(Level.SEVERE, null, ex);
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
