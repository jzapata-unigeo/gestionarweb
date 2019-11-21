/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Funciones;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Jeison.Zapata
 */
public class FesConsulta {

    private String SQL = "";
    private String SQL1 = "";
    Statement st;
    ResultSet rs;
    String user1;

    public FesConsulta() {
    }

    public FesConsulta(String user1) {
        this.user1 = user1;
    }

    public ResultSet consmtr(String user1) {
        Conexion cn = new Conexion();
        SQL = "SELECT * FROM Estudiantes,Matricula WHERE Estudiantes.IdEstudiante = Matricula.IdEstudiante"
                + " and NumDocumento= " + "'" + user1 + "'";

//        SQL = "SELECT * FROM Estudiantes WHERE NumDocumento= " + "'" + user + "'";
        System.out.println(SQL);
        try {
            st = cn.obtener().createStatement();
            rs = st.executeQuery(SQL);
        } catch (SQLException e) {
        }
        return this.rs;
    }

}
