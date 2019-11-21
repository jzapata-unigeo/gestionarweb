/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Funciones;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import modelo.aEstudiante;

/**
 *
 * @author Jeison.Zapata
 */
public class FregUsuario extends Flogin {
   private final Conexion cn = new Conexion();
    private String SQL = "";
    private PreparedStatement pst;
    private String error = "";
    private String validastr;

    public boolean insertar(aEstudiante dts) { 
        SQL = "insert into estudiantes (IdDocumento ,NumDocumento, NomEstudiante, ApllEstudiante, Sexo, FecNacimiento, Email, Telefono,"
                + "Direccion, Ciudad,Celular, password, passven, tipo) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement pst = cn.obtener().prepareStatement(SQL);
            pst.setString(1, dts.getIdDocumento());
            pst.setString(2, dts.getNumDocumento());
            pst.setString(3, dts.getNomEstudiante());
            pst.setString(4, dts.getApllEstudiante());
            pst.setString(5, dts.getSexo());
            pst.setString(6, dts.getFecNacimiento());
            pst.setString(7, dts.getEmail());
            pst.setString(8, dts.getTelefono());
            pst.setString(9, dts.getDireccion());
            pst.setString(10, dts.getCiudad());
            pst.setString(11, dts.getCelular());
            pst.setString(12, dts.getPassword());
            pst.setString(13, dts.getPassven());
            pst.setInt(14, 1);
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
 
    public String getErrorU() {
        return this.error;
    }

    
    public ResultSet validae(String documento) throws SQLException {
        
        SQL = "Select IdEstudiante from Estudiantes where NumDocumento = " + "'" + documento + "'";
          try {
            st = cn.obtener().createStatement();
            rs = st.executeQuery(SQL);
        } catch (SQLException e) {
             error = e.getMessage();
            throw new RuntimeException(e);
        }
        return this.rs;
    }
   
    public String getErrorvalida() {
        return this.error;
    }
    
    public boolean validastr(String validastr) {
        this.validastr = validastr;
        Pattern pat = Pattern.compile("[A-Za-z]");
        Matcher mat = pat.matcher(validastr);
        if (mat.find()) {
            return true;
        } else {
            return false;
        }

    }
}
