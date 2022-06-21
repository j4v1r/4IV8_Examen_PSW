/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import modelo.DReporte;
import modelo.RAULA;
import modelo.RLBD;
import modelo.RLDS;
import modelo.RLNT;

/**
 *
 * @author Rogelio Colunga R
 */
public class Bitacora {
    
    public static RLBD reportesLBD(){
        //donde se crea el objeto del ingrediente
        RLBD e = new RLBD();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from reporteslbd";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                
                e.setLBD(rs.getString(1));
                e.setNum(rs.getInt(2));
            }
            
            System.out.println("Se busco el ingrediente");
            con.close();
            
            
        }catch(Exception ex){
            System.out.println("No se pudo buscar al ingrediente");
            System.out.println(ex.getMessage());
        }
        return e;
    }
    
    public static RLDS reportesRLDS(){
        //donde se crea el objeto del ingrediente
        RLDS e = new RLDS();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from reporteslds";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                
                e.setLDS(rs.getString(1));
                e.setNum(rs.getInt(2));
            }
            
            System.out.println("Se busco el ingrediente");
            con.close();
            
            
        }catch(Exception ex){
            System.out.println("No se pudo buscar al ingrediente");
            System.out.println(ex.getMessage());
        }
        return e;
    }
    
    public static RLNT reportesRLNT(){
        //donde se crea el objeto del ingrediente
        RLNT e = new RLNT();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from reporteslnt";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                
                e.setLNT(rs.getString(1));
                e.setNum(rs.getInt(2));
            }
            
            System.out.println("Se busco el ingrediente");
            con.close();
            
            
        }catch(Exception ex){
            System.out.println("No se pudo buscar al ingrediente");
            System.out.println(ex.getMessage());
        }
        return e;
    }
    
    public static RAULA reportesRAULA(){
        //donde se crea el objeto del ingrediente
        RAULA e = new RAULA();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from reportesaula";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                
                e.setAula(rs.getString(1));
                e.setNum(rs.getInt(2));
            }
            
            System.out.println("Se busco el ingrediente");
            con.close();
            
            
        }catch(Exception ex){
            System.out.println("No se pudo buscar al ingrediente");
            System.out.println(ex.getMessage());
        }
        return e;
    }
    
}
