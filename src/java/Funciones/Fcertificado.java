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
public class Fcertificado {

    private final Conexion cn = new Conexion();
    String SQL = "";
    Statement st;
    ResultSet rs;
    String error="";

    public Fcertificado() {

    }

    public ResultSet Rcertifica(String idmatricula) throws SQLException {
        SQL = "SELECT * FROM Estudiantes as E, Matricula as M, NotaEstudiantes as N \n" +
"where E.IdEstudiante = M.idEstudiante and M.Idmatricula = N.Idmatricula and N.IdMatricula= " + idmatricula;
        try {
            st = cn.obtener().createStatement();
            rs = st.executeQuery(SQL);
        } catch (Exception e) {
            error = e.getMessage();
            throw new RuntimeException(e);
        }

        return this.rs;

    }

    
    
    
    
    
}
