/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Funciones;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import modelo.aMatricula;

/**
 *
 * @author Jeison.Zapata
 */
public class fMatricula {

    Conexion cn = new Conexion();
    String SQL = "";
    PreparedStatement pst;
    String error = "";

    public boolean insertar(aMatricula dts) {
        String SQL = "insert into Matricula (IdEstudiante ,aniomatr, Jornada, Ciclo, Semestre) values (?,?,?,?,?)";
        try {
            pst = cn.obtener().prepareStatement(SQL);
            pst.setInt(1, dts.getIdestudiante());
            pst.setString(2, dts.getAniomatricula());
            pst.setString(3, dts.getJornada());
            pst.setString(4, dts.getCiclo());
            pst.setString(5, dts.getSemestre());
            int n = pst.executeUpdate();

            if (n != 0) {
                return true;
            } else {
                return false;
            }

        } catch (SQLException e) {
            error = e.getMessage();
            throw new RuntimeException(e);
        }
    }

    public String getErrorM() {
        return this.error;
    }
}
