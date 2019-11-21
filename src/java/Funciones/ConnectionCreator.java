/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Funciones;

import java.sql.DriverManager;
import java.sql.Connection;

/**
 *
 * @author Jeison.Zapata
 */
public class ConnectionCreator {

    public static java.sql.Connection getSqlServerConnection(String database,
            String servername, int port, String Username, String password)
    {
        try {
         Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
         String url= "jdbc:sqlserver://" + servername + ":" + port + ";DatabaseName=" + database + ";user=" + ";password=" + password;
            Connection conn = DriverManager.getConnection(url);
             if(conn != null)
                 System.out.println("conectado");
             else
                 System.out.println("no conectado error");
             
             return conn;
                 
            
        } catch (Exception e) {
            System.out.println("Error=" +e);
            
        }
    return null;
    
    }
    
    
    
    
}
