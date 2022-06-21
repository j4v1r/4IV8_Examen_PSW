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
import java.util.HashSet;
import java.util.List;
import modelo.DEquipo;
import modelo.DReporte;

/**
 *
 * @author Emmanuel
 */
public class AccionesReporte {
    
    public static List<DReporte> getAllReporte(){
        //primero declarar el arraylist
        List<DReporte> lista = new ArrayList<DReporte>();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from muestrareporte order by detalleReporte_fecha desc limit 10";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //donde se crea el objeto del empleado
                DReporte e = new DReporte();
                e.setDetalleReporte_id(rs.getInt(1));
                e.setPrioridad_id(rs.getInt(2));
                e.setEdoRe_id(rs.getInt(3));
                e.setAsignatura_id(rs.getInt(4));
                e.setPersona_id(rs.getInt(5));
                e.setEquipo_etiqueta(rs.getString(6));
                e.setDetalleReporte_fecha(rs.getString(7));
                e.setDetalleReporte_hora(rs.getString(8));
                e.setProblema(rs.getString(9));
                e.setPrioridad_tipo(rs.getString(10));
                e.setEdoRe_tipo(rs.getString(11));
                e.setAsignatura_nombre(rs.getString(12));
                e.setPersona_nombre(rs.getString(13));
                e.setLab_nom(rs.getString(14));
                e.setGrupo_tipo(rs.getString(15));
                lista.add(e);
            }
            
            System.out.println("Se consulto el reporte");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo consultar el reporte");
            System.out.println(ex.getMessage());
        }
        return lista;
    }
    
    
    public static List<DReporte> getAllReporteB(String busqueda){
        //primero declarar el arraylist
        List<DReporte> lista = new ArrayList<DReporte>();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from muestrareporte where equipo_etiqueta like ? or prioridad_tipo like ? or edoRe_tipo like ? or asignatura_nombre like ? or persona_nombre like ? or grupo_tipo like ? or problema like ? ";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, "%"+busqueda+"%");
            ps.setString(2, "%"+busqueda+"%");
            ps.setString(3, "%"+busqueda+"%");
            ps.setString(4, "%"+busqueda+"%");
            ps.setString(5, "%"+busqueda+"%");
            ps.setString(6, "%"+busqueda+"%");
            ps.setString(7, "%"+busqueda+"%");
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //donde se crea el objeto del empleado
                DReporte e = new DReporte();
                e.setDetalleReporte_id(rs.getInt(1));
                e.setPrioridad_id(rs.getInt(2));
                e.setEdoRe_id(rs.getInt(3));
                e.setAsignatura_id(rs.getInt(4));
                e.setPersona_id(rs.getInt(5));
                e.setEquipo_etiqueta(rs.getString(6));
                e.setDetalleReporte_fecha(rs.getString(7));
                e.setDetalleReporte_hora(rs.getString(8));
                e.setProblema(rs.getString(9));
                e.setPrioridad_tipo(rs.getString(10));
                e.setEdoRe_tipo(rs.getString(11));
                e.setAsignatura_nombre(rs.getString(12));
                e.setPersona_nombre(rs.getString(13));
                e.setLab_nom(rs.getString(14));
                e.setGrupo_tipo(rs.getString(15));
                lista.add(e);
            }
            
            System.out.println("Se busco el reporte");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se busco consultar el reporte");
            System.out.println(ex.getMessage());
        }
        return lista;
    }
    
    public static List<DReporte> getAllReportePLab(String laboratorio){
        //primero declarar el arraylist
        List<DReporte> lista = new ArrayList<DReporte>();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from muestrareporte where lab_nom=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, laboratorio);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //donde se crea el objeto del empleado
                DReporte e = new DReporte();
                e.setDetalleReporte_id(rs.getInt(1));
                e.setPrioridad_id(rs.getInt(2));
                e.setEdoRe_id(rs.getInt(3));
                e.setAsignatura_id(rs.getInt(4));
                e.setPersona_id(rs.getInt(5));
                e.setEquipo_etiqueta(rs.getString(6));
                e.setDetalleReporte_fecha(rs.getString(7));
                e.setDetalleReporte_hora(rs.getString(8));
                e.setProblema(rs.getString(9));
                e.setPrioridad_tipo(rs.getString(10));
                e.setEdoRe_tipo(rs.getString(11));
                e.setAsignatura_nombre(rs.getString(12));
                e.setPersona_nombre(rs.getString(13));
                e.setLab_nom(rs.getString(14));
                e.setGrupo_tipo(rs.getString(15));
                lista.add(e);
            }
            
            System.out.println("Se consulto el reporte");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo consultar el reporte");
            System.out.println(ex.getMessage());
        }
        return lista;
    }
    
    public static List<DReporte> getAllReportePLabB(String laboratorio, String busqueda){
        //primero declarar el arraylist
        List<DReporte> lista = new ArrayList<DReporte>();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from muestrareporte where lab_nom = ? and equipo_etiqueta like ? or  lab_nom = ? and prioridad_tipo like ? or lab_nom = ? and edoRe_tipo like ? "
                    + "or lab_nom = ? and asignatura_nombre like ? or  lab_nom = ? and persona_nombre like ? or  lab_nom = ? and grupo_tipo like ? or lab_nom = ? and problema like ? ";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, laboratorio);
            ps.setString(2, "%"+busqueda+"%");
            ps.setString(3, laboratorio);
            ps.setString(4, "%"+busqueda+"%");
            ps.setString(5, laboratorio);
            ps.setString(6, "%"+busqueda+"%");
            ps.setString(7, laboratorio);
            ps.setString(8, "%"+busqueda+"%");
            ps.setString(9, laboratorio);
            ps.setString(10, "%"+busqueda+"%");
            ps.setString(11, laboratorio);
            ps.setString(12, "%"+busqueda+"%");
            ps.setString(13, laboratorio);
            ps.setString(14, "%"+busqueda+"%");
            
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //donde se crea el objeto del empleado
                DReporte e = new DReporte();
                e.setDetalleReporte_id(rs.getInt(1));
                e.setPrioridad_id(rs.getInt(2));
                e.setEdoRe_id(rs.getInt(3));
                e.setAsignatura_id(rs.getInt(4));
                e.setPersona_id(rs.getInt(5));
                e.setEquipo_etiqueta(rs.getString(6));
                e.setDetalleReporte_fecha(rs.getString(7));
                e.setDetalleReporte_hora(rs.getString(8));
                e.setProblema(rs.getString(9));
                e.setPrioridad_tipo(rs.getString(10));
                e.setEdoRe_tipo(rs.getString(11));
                e.setAsignatura_nombre(rs.getString(12));
                e.setPersona_nombre(rs.getString(13));
                e.setLab_nom(rs.getString(14));
                e.setGrupo_tipo(rs.getString(15));
                lista.add(e);
            }
            
            System.out.println("Se busco el reporte");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se busco consultar el reporte");
            System.out.println(ex.getMessage());
        }
        return lista;
    }
    
    
    public static int registrarReporte(DReporte e){
        
        int estatus=0;
        
        try{ 
            
        Connection con = Conexion.getConection();
        
        String q = "insert into dreporte (prioridad_id, edoRe_id, asignatura_id, detalleReporte_fecha, detalleReporte_hora,"
                + "problema, persona_id, equipo_etiqueta)"
                + "values (?, ?, ?, ?, ?, ?, ?, ?)";
        
        
        PreparedStatement ps = con.prepareStatement(q);
        
        
        ps.setInt(1, e.getPrioridad_id());
        ps.setInt(2, e.getEdoRe_id());
        ps.setInt(3, e.getAsignatura_id());
        ps.setString(4, e.getDetalleReporte_fecha());
        ps.setString(5, e.getDetalleReporte_hora());
        ps.setString(6, e.getProblema());
        ps.setInt(7, e.getPersona_id());
        ps.setString(8, e.getEquipo_etiqueta());
        
        estatus = ps.executeUpdate();
            
        System.out.println("Registro Exitoso de reporte");
        con.close();
            
        }catch(Exception ex){
            System.out.println("Error al registrar el reporte");
            System.out.println(ex.getMessage());
            
        
        }
        return estatus;
    }
    
    
    public static DReporte buscarReporteID(int id_dreporte){
        //donde se crea el objeto del ingrediente
        DReporte e = new DReporte();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from muestrareporte where detalleReporte_id=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id_dreporte);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                
                e.setDetalleReporte_id(rs.getInt(1));
                e.setPrioridad_id(rs.getInt(2));
                e.setEdoRe_id(rs.getInt(3));
                e.setAsignatura_id(rs.getInt(4));
                e.setPersona_id(rs.getInt(5));
                e.setEquipo_etiqueta(rs.getString(6));
                e.setDetalleReporte_fecha(rs.getString(7));
                e.setDetalleReporte_hora(rs.getString(8));
                e.setProblema(rs.getString(9));
                e.setPrioridad_tipo(rs.getString(10));
                e.setEdoRe_tipo(rs.getString(11));
                e.setAsignatura_nombre(rs.getString(12));
                e.setPersona_nombre(rs.getString(13));
                e.setLab_nom(rs.getString(14));
                
            }
            
            System.out.println("Se busco el ingrediente");
            con.close();
            
            
        }catch(Exception ex){
            System.out.println("No se pudo buscar al ingrediente");
            System.out.println(ex.getMessage());
        }
        return e;
    }
    
    
    public static int actualizarDReporte(DReporte e){
        
        //Estado de la query, se actualizo el ingrediente o no
        int estatus = 0;
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "update dreporte set prioridad_id=?, edoRe_id=?, asignatura_id=?, detalleReporte_fecha=?, detalleReporte_hora=?, problema=?, persona_id=?, equipo_etiqueta=? where detalleReporte_id=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, e.getPrioridad_id());
            ps.setInt(2, e.getEdoRe_id());
            ps.setInt(3, e.getAsignatura_id());
            ps.setString(4, e.getDetalleReporte_fecha());
            ps.setString(5, e.getDetalleReporte_hora());
            ps.setString(6, e.getProblema());
            ps.setInt(7, e.getPersona_id());
            ps.setString(8, e.getEquipo_etiqueta());
            ps.setInt(9, e.getDetalleReporte_id());
            
            estatus = ps.executeUpdate();
            
            System.out.println("Se actualizo el ingrediente");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo actualizar el ingrediente");
            System.out.println(ex.getMessage());
        }
        return estatus;
    }
    
    public static List<DReporte> getAllReporteAlumno(int persona_id){
        //primero declarar el arraylist
        List<DReporte> lista = new ArrayList<DReporte>();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from muestrareporte where persona_id=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, persona_id);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //donde se crea el objeto del empleado
                DReporte e = new DReporte();
                e.setDetalleReporte_id(rs.getInt(1));
                e.setPrioridad_id(rs.getInt(2));
                e.setEdoRe_id(rs.getInt(3));
                e.setAsignatura_id(rs.getInt(4));
                e.setPersona_id(rs.getInt(5));
                e.setEquipo_etiqueta(rs.getString(6));
                e.setDetalleReporte_fecha(rs.getString(7));
                e.setDetalleReporte_hora(rs.getString(8));
                e.setProblema(rs.getString(9));
                e.setPrioridad_tipo(rs.getString(10));
                e.setEdoRe_tipo(rs.getString(11));
                e.setAsignatura_nombre(rs.getString(12));
                e.setPersona_nombre(rs.getString(13));
                e.setLab_nom(rs.getString(14));
                e.setGrupo_tipo(rs.getString(15));
                lista.add(e);
            }
            
            System.out.println("Se consulto el reporte");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo consultar el reporte");
            System.out.println(ex.getMessage());
        }
        return lista;
    }
    
    
    public static List<DReporte> getAllReporteMaquina(String equipo_etiqueta){
        //primero declarar el arraylist
        List<DReporte> lista = new ArrayList<DReporte>();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from muestrareporte where equipo_etiqueta=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, equipo_etiqueta);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //donde se crea el objeto del empleado
                DReporte e = new DReporte();
                e.setDetalleReporte_id(rs.getInt(1));
                e.setPrioridad_id(rs.getInt(2));
                e.setEdoRe_id(rs.getInt(3));
                e.setAsignatura_id(rs.getInt(4));
                e.setPersona_id(rs.getInt(5));
                e.setEquipo_etiqueta(rs.getString(6));
                e.setDetalleReporte_fecha(rs.getString(7));
                e.setDetalleReporte_hora(rs.getString(8));
                e.setProblema(rs.getString(9));
                e.setPrioridad_tipo(rs.getString(10));
                e.setEdoRe_tipo(rs.getString(11));
                e.setAsignatura_nombre(rs.getString(12));
                e.setPersona_nombre(rs.getString(13));
                e.setLab_nom(rs.getString(14));
                e.setGrupo_tipo(rs.getString(15));
                lista.add(e);
            }
            
            System.out.println("Se consulto el reporte");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo consultar el reporte");
            System.out.println(ex.getMessage());
        }
        return lista;
    }
}
