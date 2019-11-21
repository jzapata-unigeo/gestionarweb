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
public class aNotas {

    private int IdEstudiante;
    private int IdMateria;
    private int IdMatricula;
    private String Semestre;
    private String Jornada;
    private String Materias;
    private String NotaFinal;
    private String nota1;
    private String nota2;
    private String nota3;
    private String nota4;
    private String nota5;
    private String nota6;

    public aNotas(int IdEstudiante, int IdMateria, int IdMatricula, String Semestre, String Jornada, String Materias, String NotaFinal, String nota1, String nota2, String nota3, String nota4, String nota5, String nota6) {
        this.IdEstudiante = IdEstudiante;
        this.IdMateria = IdMateria;
        this.IdMatricula = IdMatricula;
        this.Semestre = Semestre;
        this.Jornada = Jornada;
        this.Materias = Materias;
        this.NotaFinal = NotaFinal;
        this.nota1 = nota1;
        this.nota2 = nota2;
        this.nota3 = nota3;
        this.nota4 = nota4;
        this.nota5 = nota5;
        this.nota6 = nota6;
    }

    public aNotas() {
    }

    public String getNota1() {
        return nota1;
    }

    public void setNota1(String nota1) {
        this.nota1 = nota1;
    }

    public String getNota2() {
        return nota2;
    }

    public void setNota2(String nota2) {
        this.nota2 = nota2;
    }

    public String getNota3() {
        return nota3;
    }

    public void setNota3(String nota3) {
        this.nota3= nota3;
    }

    public String getNota4() {
        return nota4;
    }

    public void setNota4(String nota4) {
        this.nota4 = nota4;
    }

    public String getNota5() {
        return nota5;
    }

    public void setNota5(String  nota5) {
        this.nota5 = nota5;
    }

    public String getNota6() {
        return nota6;
    }

    public void setNota6(String nota6) {
        this.nota6 = nota6;
    }

    public String getMaterias() {
        return Materias;
    }

    public void setMaterias(String Materias) {
        this.Materias = Materias;
    }

    public int getIdEstudiante() {
        return IdEstudiante;
    }

    public void setIdEstudiante(int IdEstudiante) {
        this.IdEstudiante = IdEstudiante;
    }

    public int getIdMateria() {
        return IdMateria;
    }

    public void setIdMateria(int IdMateria) {
        this.IdMateria = IdMateria;
    }

    public String getSemestre() {
        return Semestre;
    }

    public void setSemestre(String Semestre) {
        this.Semestre = Semestre;
    }

    public String getJornada() {
        return Jornada;
    }

    public void setJornada(String Jornada) {
        this.Jornada = Jornada;
    }

    public String getNotaFinal() {
        return NotaFinal;
    }

    public void setNotaFinal(String NotaFinal) {
        this.NotaFinal = NotaFinal;
    }

    public int getIdMatricula() {
        return IdMatricula;
    }

    public void setIdMatricula(int IdMatricula) {
        this.IdMatricula = IdMatricula;
    }

}
