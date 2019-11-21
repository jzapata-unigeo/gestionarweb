/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Funciones;

import java.io.*;
import java.sql.*;



/**
 *
 * @author
 */
public class Conect {

 

    private static Connection cnx = null;
    private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=Gestionar";
    private static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private static final String USUARIO = "sa";
    private static final String PASS = "sareval1**";

    public Connection obtener() throws SQLException, ClassNotFoundException, IOException, Exception {
        if (cnx == null) {
            try {
                Class.forName(DRIVER);
                cnx = DriverManager.getConnection(URL, USUARIO, PASS);
            } catch (SQLException ex) {
                throw new SQLException(ex);
            } catch (ClassNotFoundException ex) {
                throw new ClassCastException(ex.getMessage());
            }

        }
        return cnx;

    }

    public void cerrar() throws SQLException {
        if (cnx != null) {
            cnx.close();
        }
    }
}

  


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*package Funciones;

import java.io.*;
import java.sql.*;

/**
 *
 * @author
 */
/*
public class Conexion {
    private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=Gestionar";
    private static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private static final String USUARIO = "sa";
    private static final String PASS = "sareval1**";

    static {
        try {
            Class.forName(DRIVER);
        } catch(ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public static Connection obtener() {
        try {
            return DriverManager.getConnection(URL, USUARIO, PASS);
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }

    
 public void cerrar() throws SQLException {
        if (obtener() != null) {
            obtener().close();
        }

    }
 

 
    //Metodo para consultar 
    public boolean loginconsulta(String usuario, String password) throws SQLException, IOException, Exception {
    ResultSet rs=null ;
        try {
         String sql = "SELECT * FROM usuarios WHERE nombre='" + usuario + "' AND password='" + password + "'";
        PreparedStatement ps = obtener().prepareStatement(sql);
        rs= ps.executeQuery();

        return rs.next();
       
        } catch (SQLException e) {
     return rs.next();
        }
    }
 
 
 
    
}


*/