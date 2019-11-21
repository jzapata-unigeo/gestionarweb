/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Funciones;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import modelo.aEditar;

/**
 *
 * @author Jeison.Zapata
 */
public class Feditar {

    private final Conexion cn = new Conexion();
    private String SQL = "";
    private PreparedStatement ps;
    private String error = "";
    private String validastr;

    public boolean actualizar(aEditar dts) {
        SQL = "UPDATE Estudiantes set NomEstudiante = ?, ApllEstudiante = ?, Email = ?,"
                + "Telefono = ?, Direccion = ?, Ciudad = ?, Celular = ? WHERE IdEstudiante =  ?";
        try {

            ps = cn.obtener().prepareStatement(SQL);
            ps.setString(1, dts.getNomEstudiante());
            ps.setString(2, dts.getApllEstudiante());
            ps.setString(3, dts.getEmail());
            ps.setString(4, dts.getTelefono());
            ps.setString(5, dts.getDireccion());
            ps.setString(6, dts.getCiudad());
            ps.setString(7, dts.getCelular());
            ps.setInt(8, dts.getIdEstudiante());
            int n = ps.executeUpdate();
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
    

}
