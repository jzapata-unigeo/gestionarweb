/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Funciones;

import modelo.aNotas;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Vector;

/**
 *
 * @author Jeison.Zapata
 */
public class Fnotas {

    private final Conexion cn = new Conexion();
    private String SQL = "";
    private String error = "";
    Statement st;
    ResultSet rs;
    Vector mater = new Vector();
    aNotas dts = new aNotas();
    
    public Vector mater(String ciclo) {
        if (ciclo.equals("Basico")) {
            mater.addElement("Matematicas");
            mater.addElement("Ciencias Sociales");
            mater.addElement("Ciencias Naturales");
            mater.addElement("Español");
            mater.addElement("Ingles");
            mater.addElement("Artes");
        } else {
            mater.addElement("Matematicas II");
            mater.addElement("Ciencias Sociales II");
            mater.addElement("Ciencias Sociales II");
            mater.addElement("Español II");
            mater.addElement("Ingles II");
            mater.addElement("Desarrollo Personal");
        }
        
        return mater;
    }

    public boolean insertar(int idestudiante, int idmateria,int idmatricula, String materias, String nota) {

        try {
            SQL = "insert into NotaEstudiantes (IdEstudiante , IdMateria , IdMatricula, Materia, NotaFinal) values (?,?,?,?,?)";

            PreparedStatement pst = cn.obtener().prepareStatement(SQL);
            pst.setInt(1, idestudiante);
            pst.setInt(2, idmateria);
            pst.setInt(3, idmatricula);
            pst.setString(4, materias);
            pst.setString(5, nota);
            int n = pst.executeUpdate();
            if (n != 0) {
                
                return true;
                
            } else {
               
                return false;
            }
        } catch (SQLException e) {
            error = e.getMessage();
            System.out.println(SQL);
            throw new RuntimeException(e);
        }
    }

    public String getErrorN() {
        return this.error;
    }

    public ResultSet validaN(int idusuario, String anio, String semestre) throws SQLException {

        String SQL = "select * from Matricula where IdEstudiante = " + idusuario + " and aniomatr = "
                + anio + " and Semestre= " + semestre;
        try {
            st = cn.obtener().createStatement();
            rs = st.executeQuery(SQL);
        } catch (SQLException e) {
            error = e.getMessage();
            throw new RuntimeException(e);
        }
        return this.rs;
    }

    public String getErrorvalidN() {
        return this.error;
    }
    
    

}
