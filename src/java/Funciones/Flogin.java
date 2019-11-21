/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Funciones;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author jeiso
 */
public class Flogin {

    int hora = 0, minutos = 0, segundos = 0;
    String usuario;
    String pass;
    String SQL;
    Statement st;
    ResultSet rs;

    public Flogin() {
    }

    public Flogin(String usuario, String pass) {
        this.usuario = usuario;
        this.pass = pass;
    }

    public ResultSet validar(String usuario, String pass) throws SQLException {
        Conexion con = new Conexion();
        SQL = "Select * from Estudiantes where NumDocumento = '" + usuario + "' and password  = '" + pass + "'";
        try {
            st = con.obtener().createStatement();
            rs = st.executeQuery(SQL);

        } catch (SQLException e) {
        }
        return this.rs;
        
    }

    public String hora() {
        Calendar calendario = Calendar.getInstance();
        hora = calendario.get(Calendar.HOUR_OF_DAY);
        minutos = calendario.get(Calendar.MINUTE);
        segundos = calendario.get(Calendar.SECOND);
        return hora + ":" + minutos + ":" + segundos;

    }

    public String dia() {
        Calendar calendario = Calendar.getInstance();
        int day = calendario.get(Calendar.DAY_OF_MONTH);
        int mes = calendario.get(Calendar.MONTH) + 1;
        int año = calendario.get(Calendar.YEAR);
        return año + "-" + mes + "-" + day;
    }

    public Date fecha() throws ParseException {
        Calendar calendario = Calendar.getInstance();
        int day = calendario.get(Calendar.DAY_OF_MONTH);
        int mes = calendario.get(Calendar.MONTH) + 1;
        int año = calendario.get(Calendar.YEAR);
        String fec = año + "-" + mes + "-" + day;
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha = (Date) formatter.parse(fec);
        return fecha;
    }

    public Date fecven(Date fecha) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(fecha);
        calendar.add(Calendar.DAY_OF_YEAR, -1);
        return (Date) calendar.getTime();
    }

}
