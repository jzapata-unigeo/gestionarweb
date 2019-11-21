/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.Date;

/**
 *
 * @author Jeison.Zapata
 */
public class aLogin {

    int IdDocumento;
    String numDocumento;
    String nomEstudiante;
    String apllEstudiante;
    String sexo;
    Date fecNacimiento;
    String email;
    String telefono;
    String direccion;
    String ciudad;
    String celular;
    String Password;
    Date passven;
    int tipo;

    public aLogin() {
    }

    public aLogin(int IdDocumento, String numDocumento, String nomEstudiante, String apllEstudiante, String sexo, Date fecNacimiento, String email, String telefono, String direccion, String ciudad, String celular, String Password,  Date passven, int tipo) {
        this.IdDocumento = IdDocumento;
        this.numDocumento = numDocumento;
        this.nomEstudiante = nomEstudiante;
        this.apllEstudiante = apllEstudiante;
        this.sexo = sexo;
        this.fecNacimiento = fecNacimiento;
        this.email = email;
        this.telefono = telefono;
        this.direccion = direccion;
        this.ciudad = ciudad;
        this.celular = celular;
        this.Password = Password;
        this.passven = passven;
        this.tipo = tipo;
    }

    public int getIdDocumento() {
        return IdDocumento;
    }

    public void setIdDocumento(int IdDocumento) {
        this.IdDocumento = IdDocumento;
    }

    public String getNumDocumento() {
        return numDocumento;
    }

    public void setNumDocumento(String numDocumento) {
        this.numDocumento = numDocumento;
    }

    public String getNomEstudiante() {
        return nomEstudiante;
    }

    public void setNomEstudiante(String nomEstudiante) {
        this.nomEstudiante = nomEstudiante;
    }

    public String getApllEstudiante() {
        return apllEstudiante;
    }

    public void setApllEstudiante(String apllEstudiante) {
        this.apllEstudiante = apllEstudiante;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public Date getFecNacimiento() {
        return fecNacimiento;
    }

    public void setFecNacimiento(Date fecNacimiento) {
        this.fecNacimiento = fecNacimiento;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public  Date getPassven() {
        return passven;
    }

    public void setPassven( Date passven) {
        this.passven = passven;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

}
