/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author Jeison.Zapata
 */
public class aEditar {

    private String nomEstudiante;
    private String apllEstudiante;
    private String email;
    private String telefono;
    private String direccion;
    private String ciudad;
    private String celular;
    private int idEstudiante;
    private String Nomapellido;

    public aEditar() {
    }

    public aEditar(String nomEstudiante, String apllEstudiante, String email, String telefono, String direccion, String ciudad, String celular, int idEstudiante, String Nomapellido) {
        this.nomEstudiante = nomEstudiante;
        this.apllEstudiante = apllEstudiante;
        this.email = email;
        this.telefono = telefono;
        this.direccion = direccion;
        this.ciudad = ciudad;
        this.celular = celular;
        this.idEstudiante = idEstudiante;
        this.Nomapellido = Nomapellido;
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

    public int getIdEstudiante() {
        return idEstudiante;
    }

    public void setIdEstudiante(int idEstudiante) {
        this.idEstudiante = idEstudiante;
    }

    public String getNomapellido() {
        return Nomapellido;
    }

    public void setNomapellido(String Nomapellido) {
        this.Nomapellido = Nomapellido;
    }


}
