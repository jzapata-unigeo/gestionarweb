/* To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.*/
package Funciones;
import java.sql.*;

/**
 *
 * @author
 */
public class Conexion {

    private  String URL = "jdbc:sqlserver://localhost:1433;databaseName=Gestionar";
    private  String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private  String USUARIO = "sa";
    private  String PASS = "sareval1**";
    private  String error = null;

     {
        try {
            Class.forName(DRIVER);
            error=null;
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public Connection obtener() {
        try {
            return DriverManager.getConnection(URL, USUARIO, PASS);
        } catch (SQLException e) {
            error = e.getMessage();
            throw new RuntimeException(e);
        }
    }
            
    public String getError(){
    return  this.error;
    }
    
    public void cerrar() throws SQLException {
        if (obtener() != null) {
            obtener().close();
        }

    }
}
