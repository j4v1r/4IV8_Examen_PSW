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
import modelo.CAsignatura;
import modelo.CEstadoReporte;

/**
 *
 * @author Rogelio Colunga R
 */
public class AccionesCAsignatura {
    
     public static List<CAsignatura> getAllAsignatura(){
        //primero declarar el arraylist
        List<CAsignatura> lista = new ArrayList<CAsignatura>();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from casignatura";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //donde se crea el objeto del empleado
                CAsignatura e = new CAsignatura();
                e.setAsignatura_id(rs.getInt(1));
                e.setAsignatura_nombre(rs.getString(2));
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
