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
public class MAccesorio {
    
    private int accesorio_id;
    private String config_descripcionTeclado;
    private String config_descripcionMause;

    public int getAccesorio_id() {
        return accesorio_id;
    }

    public void setAccesorio_id(int accesorio_id) {
        this.accesorio_id = accesorio_id;
    }

    public String getConfig_descripcionTeclado() {
        return config_descripcionTeclado;
    }

    public void setConfig_descripcionTeclado(String config_descripcionTeclado) {
        this.config_descripcionTeclado = config_descripcionTeclado;
    }

    public String getConfig_descripcionMause() {
        return config_descripcionMause;
    }

    public void setConfig_descripcionMause(String config_descriocionMause) {
        this.config_descripcionMause = config_descriocionMause;
    }
    
}
