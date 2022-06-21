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
import modelo.CGrupo;
import modelo.CPrivilegio;

/**
 *
 * @author Rogelio Colunga R
 */
public class AccionesPrivilegio {
    
    public static List<CPrivilegio> getAllPrivilegio(){
        //primero declarar el arraylist
        List<CPrivilegio> lista = new ArrayList<CPrivilegio>();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from cprivilegio where privilegio_id in (8,9,10,11)";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //donde se crea el objeto del empleado
                CPrivilegio e = new CPrivilegio();
                e.setPrivilegio_id(rs.getInt(1));
                e.setPrivilegio_tipo(rs.getString(2));
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
    
    public static List<CPrivilegio> getAllPrivilegioDV(){
        //primero declarar el arraylist
        List<CPrivilegio> lista = new ArrayList<CPrivilegio>();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from cprivilegio";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //donde se crea el objeto del empleado
                CPrivilegio e = new CPrivilegio();
                e.setPrivilegio_id(rs.getInt(1));
                e.setPrivilegio_tipo(rs.getString(2));
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
    
}
