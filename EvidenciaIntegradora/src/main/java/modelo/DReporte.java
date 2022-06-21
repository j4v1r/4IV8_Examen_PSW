/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author Rogelio Colunga R
 */
public class DReporte {
    
    private int detalleReporte_id, prioridad_id, edoRe_id, asignatura_id, persona_id;
    private String equipo_etiqueta, detalleReporte_fecha, detalleReporte_hora, problema, 
            prioridad_tipo, edoRe_tipo, asignatura_nombre, persona_nombre, lab_nom, grupo_tipo;

    public int getDetalleReporte_id() {
        return detalleReporte_id;
    }

    public void setDetalleReporte_id(int detalleReporte_id) {
        this.detalleReporte_id = detalleReporte_id;
    }

    public int getPrioridad_id() {
        return prioridad_id;
    }

    public void setPrioridad_id(int prioridad_id) {
        this.prioridad_id = prioridad_id;
    }

    public int getEdoRe_id() {
        return edoRe_id;
    }

    public void setEdoRe_id(int edoRe_id) {
        this.edoRe_id = edoRe_id;
    }

    public int getAsignatura_id() {
        return asignatura_id;
    }

    public void setAsignatura_id(int asignatura_id) {
        this.asignatura_id = asignatura_id;
    }

    public int getPersona_id() {
        return persona_id;
    }

    public void setPersona_id(int persona_id) {
        this.persona_id = persona_id;
    }

    public String getEquipo_etiqueta() {
        return equipo_etiqueta;
    }

    public void setEquipo_etiqueta(String equipo_etiqueta) {
        this.equipo_etiqueta = equipo_etiqueta;
    }

    public String getDetalleReporte_fecha() {
        return detalleReporte_fecha;
    }

    public void setDetalleReporte_fecha(String detalleReporte_fecha) {
        this.detalleReporte_fecha = detalleReporte_fecha;
    }

    public String getDetalleReporte_hora() {
        return detalleReporte_hora;
    }

    public void setDetalleReporte_hora(String detalleReporte_hora) {
        this.detalleReporte_hora = detalleReporte_hora;
    }

    public String getProblema() {
        return problema;
    }

    public void setProblema(String problema) {
        this.problema = problema;
    }

    public String getPrioridad_tipo() {
        return prioridad_tipo;
    }

    public void setPrioridad_tipo(String prioridad_tipo) {
        this.prioridad_tipo = prioridad_tipo;
    }

    public String getEdoRe_tipo() {
        return edoRe_tipo;
    }

    public void setEdoRe_tipo(String edoRe_tipo) {
        this.edoRe_tipo = edoRe_tipo;
    }

    public String getAsignatura_nombre() {
        return asignatura_nombre;
    }

    public void setAsignatura_nombre(String asignatura_nombre) {
        this.asignatura_nombre = asignatura_nombre;
    }

    public String getPersona_nombre() {
        return persona_nombre;
    }

    public void setPersona_nombre(String persona_nombre) {
        this.persona_nombre = persona_nombre;
    }

    public String getLab_nom() {
        return lab_nom;
    }

    public void setLab_nom(String lab_nom) {
        this.lab_nom = lab_nom;
    }

    public String getGrupo_tipo() {
        return grupo_tipo;
    }

    public void setGrupo_tipo(String grupo_tipo) {
        this.grupo_tipo = grupo_tipo;
    }
    
    
    
    
}
