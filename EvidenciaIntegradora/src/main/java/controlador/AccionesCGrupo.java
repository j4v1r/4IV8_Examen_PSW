/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;


import modelo.CGrupo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
public class AccionesCGrupo {
    
    //consultar todos los empleados
    public static List<CGrupo> getAllGrupos(){
        //primero declarar el arraylist
        List<CGrupo> lista = new ArrayList<CGrupo>();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from cgrupo";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //donde se crea el objeto del empleado
                CGrupo e = new CGrupo();
                e.setGrupo_id(rs.getInt(1));
                e.setGrupo_tipo(rs.getString(2));
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
