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
public class aMatricula {
    private int idusuario;
    private String idmatricula;
    private int idestudiante;
    private String aniomatricula;
    private String jornada;
    private String ciclo;
    private String semestre;

    public aMatricula(int idusuario, String idmatricula, int idestudiante, String aniomatricula, String jornada, String ciclo, String semestre) {
        this.idusuario = idusuario;
        this.idmatricula = idmatricula;
        this.idestudiante = idestudiante;
        this.aniomatricula = aniomatricula;
        this.jornada = jornada;
        this.ciclo = ciclo;
        this.semestre = semestre;
    }

    public int getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }

    

    public aMatricula() {
    }

    public String getIdmatricula() {
        return idmatricula;
    }

    public void setIdmatricula(String idmatricula) {
        this.idmatricula = idmatricula;
    }

    public int getIdestudiante() {
        return idestudiante;
    }

    public void setIdestudiante(int idestudiante) {
        this.idestudiante = idestudiante;
    }

    public String getAniomatricula() {
        return aniomatricula;
    }

    public void setAniomatricula(String aniomatricula) {
        this.aniomatricula = aniomatricula;
    }

    public String getJornada() {
        return jornada;
    }

    public void setJornada(String jornada) {
        this.jornada = jornada;
    }

    public String getCiclo() {
        return ciclo;
    }

    public void setCiclo(String ciclo) {
        this.ciclo = ciclo;
    }

    public String getSemestre() {
        return semestre;
    }

    public void setSemestre(String semestre) {
        this.semestre = semestre;
    }

}
