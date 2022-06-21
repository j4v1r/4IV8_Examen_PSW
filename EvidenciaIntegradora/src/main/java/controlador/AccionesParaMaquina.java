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
import modelo.CEdoEquipo;
import modelo.CLaboratorio;
import modelo.CMarca;
import modelo.DEquipo;
import modelo.MAccesorio;
import modelo.MCPU;
import modelo.MConfiguracion;
import modelo.MMonitor;
import modelo.MUsuario;

/**
 *
 * @author Rogelio Colunga R
 */
public class AccionesParaMaquina {
    
    public static List<CLaboratorio> getAllLabs(){
        //primero declarar el arraylist
        List<CLaboratorio> lista = new ArrayList<CLaboratorio>();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from claboratorio";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //donde se crea el objeto del empleado
                CLaboratorio e = new CLaboratorio();
                e.setId_laboratorio(rs.getInt(1));
                e.setLab_nom(rs.getString(2));
                e.setLab_equipos(rs.getInt(3));
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
    
    public static List<CMarca> getAllMarcas(){
        //primero declarar el arraylist
        List<CMarca> lista = new ArrayList<CMarca>();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from cmarca";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //donde se crea el objeto del empleado
                CMarca e = new CMarca();
                e.setMarca_id(rs.getInt(1));
                e.setMarca_nom(rs.getString(2));
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
    
    public static List<MCPU> getAllCPUs(){
        //primero declarar el arraylist
        List<MCPU> lista = new ArrayList<MCPU>();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from mcpu";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //donde se crea el objeto del empleado
                MCPU e = new MCPU();
                e.setCpu_serial(rs.getString(1));
                e.setCpu_descripcion(rs.getString(2));
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
    
    public static List<MAccesorio> getAllAccesorios(){
        //primero declarar el arraylist
        List<MAccesorio> lista = new ArrayList<MAccesorio>();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from maccesorio";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //donde se crea el objeto del empleado
                MAccesorio e = new MAccesorio();
                e.setAccesorio_id(rs.getInt(1));
                e.setConfig_descripcionTeclado(rs.getString(2));
                e.setConfig_descripcionMause(rs.getString(3));
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
    
    public static List<MMonitor> getAllMonitores(){
        //primero declarar el arraylist
        List<MMonitor> lista = new ArrayList<MMonitor>();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from mmonitor";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //donde se crea el objeto del empleado
                MMonitor e = new MMonitor();
                e.setMonitor_id(rs.getString(1));
                e.setMonitor_descripcion(rs.getString(2));
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
    
    public static List<MConfiguracion> getAllConfigs(){
        //primero declarar el arraylist
        List<MConfiguracion> lista = new ArrayList<MConfiguracion>();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from mconfiguracion";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //donde se crea el objeto del empleado
                MConfiguracion e = new MConfiguracion();
                e.setConfig_id(rs.getString(1));
                e.setConfig_descripcion(rs.getString(2));
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
    
    public static List<CEdoEquipo> getAllEstados(){
        //primero declarar el arraylist
        List<CEdoEquipo> lista = new ArrayList<CEdoEquipo>();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from cedoequipo";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //donde se crea el objeto del empleado
                CEdoEquipo e = new CEdoEquipo();
                e.setEdoEquipo_id(rs.getInt(1));
                e.setEdoEquipo_tipo(rs.getString(2));
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
    
    public static int registrarMaquina(DEquipo e){
        
        int estatus=0;
                
        try{
            
            Connection con = Conexion.getConection();
        
            String q = "insert into dequipo (equipo_etiqueta, lab_id, marca_id, cpu_serial, accesorio_id, monitor_id"
                    + ",config_id, edoEquipo_id)"
                    + "values (?, ?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, e.getEquipo_etiqueta());
            ps.setInt(2, e.getLab_id());
            ps.setInt(3, e.getMarca_id());
            ps.setString(4, e.getCpu_serial());
            ps.setInt(5, e.getAccesorio_id());
            ps.setString(6, e.getMonitor_id());
            ps.setString(7, e.getConfig_id());
            ps.setInt(8, e.getEdoEquipo_id());

            estatus = ps.executeUpdate();

            System.out.println("Registro Exitoso de EReceta");
            con.close();
            
        }catch(Exception ex){
            System.out.println("Error al registrar en EReceta");
            System.out.println(ex.getMessage());
            
        
        }
        return estatus;
            
    }
    
    public static int registrarMarca(CMarca e){
        
        int estatus=0;
        
        try{ 
            
        Connection con = Conexion.getConection();
        
        String q = "insert into cmarca (marca_nom)"
                + "values (?)";
        
        
        PreparedStatement ps = con.prepareStatement(q);
        
        
        ps.setString(1, e.getMarca_nom());
        
        estatus = ps.executeUpdate();
            
        System.out.println("Registro Exitoso de Usuario");
        con.close();
            
        }catch(Exception ex){
            System.out.println("Error al registrar el Usuario");
            System.out.println(ex.getMessage());
        }
        return estatus;
    }
    
    public static int registrarCPU(MCPU e){
        
        int estatus=0;
        
        try{ 
            
        Connection con = Conexion.getConection();
        
        String q = "insert into mcpu (cpu_serial, cpu_descripcion)"
                + "values (?, ?)";
        
        
        PreparedStatement ps = con.prepareStatement(q);
        
        
        ps.setString(1, e.getCpu_serial());
        ps.setString(2, e.getCpu_descripcion());
        
        estatus = ps.executeUpdate();
            
        System.out.println("Registro Exitoso de Usuario");
        con.close();
            
        }catch(Exception ex){
            System.out.println("Error al registrar el Usuario");
            System.out.println(ex.getMessage());
            
        
        }
        return estatus;
    }
    
    public static int registrarAccesorios(MAccesorio e){
        
        int estatus=0;
        
        try{ 
            
        Connection con = Conexion.getConection();
        
        String q = "insert into maccesorio (config_descripcionTeclado, config_descripcionMause)"
                + "values (?, ?)";
        
        
        PreparedStatement ps = con.prepareStatement(q);
        
        
        ps.setString(1, e.getConfig_descripcionTeclado());
        ps.setString(2, e.getConfig_descripcionMause());
        
        estatus = ps.executeUpdate();
            
        System.out.println("Registro Exitoso de Usuario");
        con.close();
            
        }catch(Exception ex){
            System.out.println("Error al registrar el Usuario");
            System.out.println(ex.getMessage());
            
        
        }
        return estatus;
    }
    
    public static int registrarMonitor(MMonitor e){
        
        int estatus=0;
        
        try{ 
            
        Connection con = Conexion.getConection();
        
        String q = "insert into mmonitor (monitor_id, monitor_descripcion)"
                + "values (?, ?)";
        
        
        PreparedStatement ps = con.prepareStatement(q);
        
        
        ps.setString(1, e.getMonitor_id());
        ps.setString(2, e.getMonitor_descripcion());
        
        estatus = ps.executeUpdate();
            
        System.out.println("Registro Exitoso de Usuario");
        con.close();
            
        }catch(Exception ex){
            System.out.println("Error al registrar el Usuario");
            System.out.println(ex.getMessage());
            
        
        }
        return estatus;
    }
    
    public static int registrarConfig(MConfiguracion e){
        
        int estatus=0;
        
        try{ 
            
        Connection con = Conexion.getConection();
        
        String q = "insert into mconfiguracion (config_id, config_descripcion)"
                + "values (?, ?)";
        
        
        PreparedStatement ps = con.prepareStatement(q);
        
        
        ps.setString(1, e.getConfig_id());
        ps.setString(2, e.getConfig_descripcion());
        
        estatus = ps.executeUpdate();
            
        System.out.println("Registro Exitoso de Usuario");
        con.close();
            
        }catch(Exception ex){
            System.out.println("Error al registrar el Usuario");
            System.out.println(ex.getMessage());
            
        
        }
        return estatus;
    }
    
}
