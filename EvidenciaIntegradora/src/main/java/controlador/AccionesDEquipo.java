/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.DEquipo;

/**
 *
 * @author Rogelio Colunga R
 */
public class AccionesDEquipo {
    
    public static List<DEquipo> getAllEquipos(){
        //primero declarar el arraylist
        List<DEquipo> lista = new ArrayList<DEquipo>();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from muestraequipo";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //donde se crea el objeto del empleado
                DEquipo e = new DEquipo();
                e.setEquipo_etiqueta(rs.getString(1));
                e.setLab_id(rs.getInt(2));
                e.setLab_nom(rs.getString(3));
                e.setMarca_id(rs.getInt(4));
                e.setMarca_nom(rs.getString(5));
                e.setCpu_serial(rs.getString(6));
                e.setCpu_descripcion(rs.getString(7));
                e.setAccesorio_id(rs.getInt(8));
                e.setConfig_descripcionTeclado(rs.getString(9));
                e.setConfig_descripcionMause(rs.getString(10));
                e.setMonitor_id(rs.getString(11));
                e.setMonitor_descripcion(rs.getString(12));
                e.setConfig_id(rs.getString(13));
                e.setConfig_descripcion(rs.getString(14));
                e.setEdoEquipo_id(rs.getInt(15));
                e.setEdoEquipo_tipo(rs.getString(16));
                lista.add(e);
            }
            
            System.out.println("Se consulto la unidad de medida");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo consultar la unidad de medida");
            System.out.println(ex.getMessage());
        }
        return lista;
    }
    
     public static List<DEquipo> getAllEquiposBusqueda(String busqueda){
        //primero declarar el arraylist
        List<DEquipo> lista = new ArrayList<DEquipo>();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from muestraequipo where equipo_etiqueta like ? or lab_nom like ? or marca_nom like ? or cpu_serial like ? or config_descripcionTeclado like ?"
                    + "or config_descripcionMause like ? or monitor_descripcion like ? or config_descripcion like ? or edoEquipo_tipo like ?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, "%"+busqueda+"%");
            ps.setString(2, "%"+busqueda+"%");
            ps.setString(3, "%"+busqueda+"%");
            ps.setString(4, "%"+busqueda+"%");
            ps.setString(5, "%"+busqueda+"%");
            ps.setString(6, "%"+busqueda+"%");
            ps.setString(7, "%"+busqueda+"%");
            ps.setString(8, "%"+busqueda+"%");
            ps.setString(9, "%"+busqueda+"%");
            
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //donde se crea el objeto del empleado
                DEquipo e = new DEquipo();
                e.setEquipo_etiqueta(rs.getString(1));
                e.setLab_id(rs.getInt(2));
                e.setLab_nom(rs.getString(3));
                e.setMarca_id(rs.getInt(4));
                e.setMarca_nom(rs.getString(5));
                e.setCpu_serial(rs.getString(6));
                e.setCpu_descripcion(rs.getString(7));
                e.setAccesorio_id(rs.getInt(8));
                e.setConfig_descripcionTeclado(rs.getString(9));
                e.setConfig_descripcionMause(rs.getString(10));
                e.setMonitor_id(rs.getString(11));
                e.setMonitor_descripcion(rs.getString(12));
                e.setConfig_id(rs.getString(13));
                e.setConfig_descripcion(rs.getString(14));
                e.setEdoEquipo_id(rs.getInt(15));
                e.setEdoEquipo_tipo(rs.getString(16));
                lista.add(e);
            }
            
            System.out.println("Se consulto la unidad de medida");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo consultar la unidad de medida");
            System.out.println(ex.getMessage());
        }
        return lista;
    }
     
     public static int eliminarMaquina(String etiqueta){
        
        //Estado de la query, se elimino el ingrediente o no
        int estatus = 0;
        
        try{
            //Conexión
            Connection con = Conexion.getConection();
            
            String q = "delete from dequipo where equipo_etiqueta=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, etiqueta);
            
            estatus = ps.executeUpdate();
            
            
            
            System.out.println("Se elimino el ingrediente");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo elimnar al ingrediente");
            System.out.println(ex.getMessage());
        }
        return estatus;
    }
    
}
