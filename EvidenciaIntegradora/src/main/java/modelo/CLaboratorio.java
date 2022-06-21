/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author Emmanuel
 */
public class CLaboratorio {
    private int id_laboratorio;
    private String lab_nom;
    private int lab_equipos;
    
    public CLaboratorio(){
        
    }

    public int getId_laboratorio() {
        return id_laboratorio;
    }

    public void setId_laboratorio(int id_laboratorio) {
        this.id_laboratorio = id_laboratorio;
    }

    public String getLab_nom() {
        return lab_nom;
    }

    public void setLab_nom(String lab_nom) {
        this.lab_nom = lab_nom;
    }

    public int getLab_equipos() {
        return lab_equipos;
    }

    public void setLab_equipos(int lab_equipos) {
        this.lab_equipos = lab_equipos;
    }
    
    
}
