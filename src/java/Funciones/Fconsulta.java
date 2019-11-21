/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Funciones;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author Jeison.Zapata
 */
public class Fconsulta {

    private final Conexion cn = new Conexion();
    private String SQL = "";
    private PreparedStatement pst;
    private String error = "";
    private Statement st;
    private ResultSet rs;
    private ResultSet rs1;

    public ResultSet consultar() throws SQLException {

        SQL = "SELECT * FROM Estudiantes WHERE tipo = 3";
        try {
            st = cn.obtener().createStatement();
            rs = st.executeQuery(SQL);
        } catch (SQLException e) {
            error = e.getMessage();
            throw new RuntimeException(e);
        }
        return this.rs;
    }

    public ResultSet consultarEst(String user) throws SQLException {
        SQL = "SELECT * FROM Estudiantes WHERE NumDocumento= " + "'" + user + "'";

        try {
            st = cn.obtener().createStatement();
            rs = st.executeQuery(SQL);
        } catch (SQLException e) {
            error = e.getMessage();
            throw new RuntimeException(e);
        }
        return this.rs;
    }

    public ResultSet consultarMtr(String user) throws SQLException {
        SQL = "SELECT E.IdEstudiante, M.Idmatricula, M.aniomatr, M.Jornada, M.Ciclo, M.Semestre  FROM Estudiantes as E,Matricula as M WHERE E.IdEstudiante = M.IdEstudiante and NumDocumento= " + "'" + user + "'";
        try {
            st = cn.obtener().createStatement();
            rs = st.executeQuery(SQL);
        } catch (SQLException e) {
            error = e.getMessage();
            throw new RuntimeException(e);
        }
        return this.rs;

    }

    public int getrow(String user) throws SQLException {
         SQL = "SELECT E.IdEstudiante, M.Idmatricula, M.aniomatr, M.Jornada, M.Ciclo, M.Semestre  FROM Estudiantes as E,Matricula as M WHERE E.IdEstudiante = M.IdEstudiante and NumDocumento= " + "'" + user + "'";
        try {
            st = cn.obtener().createStatement();
            rs = st.executeQuery(SQL);
        } catch (SQLException e) {
            error = e.getMessage();
            throw new RuntimeException(e);
        }
         int i = 0;
        while (rs.next()) {
            i++;
        }
        return i;
    }

}
