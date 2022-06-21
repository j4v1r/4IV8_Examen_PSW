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
import modelo.DReporte;
import modelo.MUsuario;

/**
 *
 * @author Emmanuel
 */
public class AccionesUsuario {
    
    public static int registrarUsuario(MUsuario e){
        
        int estatus=0;
        
        try{ 
            
        Connection con = Conexion.getConection();
        
        String q = "insert into mpersona (identificador, persona_nombre, persona_appat, persona_apmat, persona_sexo,"
                + "persona_fechaNacimiento, persona_user, persona_pass, grupo_id, rol_id, privilegio_id)"
                + "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        
        PreparedStatement ps = con.prepareStatement(q);
        
        
        ps.setInt(1, e.getIdentificador());
        ps.setString(2, e.getPersona_nombre());
        ps.setString(3, e.getPersona_appat());
        ps.setString(4, e.getPersona_apmat());
        ps.setString(5, e.getPersona_sexo());
        ps.setString(6, e.getPersona_fecha());
        ps.setString(7, e.getPersona_user());
        ps.setString(8, e.getPersona_pass());
        ps.setInt(9, e.getGrupo_id());
        ps.setInt(10, e.getRol_id());
        ps.setInt(11, e.getPrivilegio_id());
        
        estatus = ps.executeUpdate();
            
        System.out.println("Registro Exitoso de Usuario");
        con.close();
            
        }catch(Exception ex){
            System.out.println("Error al registrar el Usuario");
            System.out.println(ex.getMessage());
            
        
        }
        return estatus;
    }
    
    public static int actualizarUsuario(MUsuario e){
        
        //Estado de la query, se actualizo el ingrediente o no
        int estatus = 0;
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "update mpersona set persona_nombre=?, persona_appat=?, persona_apmat=?, persona_sexo=?, persona_fechaNacimiento=?,"
                    + " persona_user=?, persona_pass=?, identificador=? where persona_id=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, e.getPersona_nombre());
            ps.setString(2, e.getPersona_appat());
            ps.setString(3, e.getPersona_apmat());
            ps.setString(4, e.getPersona_sexo());
            ps.setString(5, e.getPersona_fecha());
            ps.setString(6, e.getPersona_user());
            ps.setString(7, e.getPersona_pass());
            ps.setInt(8, e.getIdentificador());
            ps.setInt(9, e.getPersona_id());
            
            estatus = ps.executeUpdate();
            
            System.out.println("Se actualizo el usuarii");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo actualizar el usuario");
            System.out.println(ex.getMessage());
        }
        return estatus;
    }
    
    public static List<MUsuario> getAllAlumnosDocente(int grupo_id){
        //primero declarar el arraylist
        List<MUsuario> lista = new ArrayList<MUsuario>();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from personamuestra where grupo_id=? and rol_id=5";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, grupo_id);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //donde se crea el objeto del empleado
                MUsuario e = new MUsuario();
                e.setPersona_id(rs.getInt(1));
                e.setIdentificador(rs.getInt(2));
                e.setPersona_nombre(rs.getString(3));
                e.setPersona_appat(rs.getString(4));
                e.setPersona_apmat(rs.getString(5));
                e.setPersona_sexo(rs.getString(6));
                e.setPersona_fecha(rs.getString(7));
                e.setPersona_user(rs.getString(8));
                e.setPersona_pass(rs.getString(9));
                e.setGrupo_id(rs.getInt(10));
                e.setRol_id(rs.getInt(11));
                e.setPrivilegio_id(rs.getInt(12));
                e.setGrupo_tipo(rs.getString(13));
                e.setRol_tipo(rs.getString(14));
                e.setPrivilegio_tipo(rs.getString(15));
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
    
    public static List<MUsuario> getAllAlumnos(){
        //primero declarar el arraylist
        List<MUsuario> lista = new ArrayList<MUsuario>();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from personamuestra where rol_id=5";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //donde se crea el objeto del empleado
                MUsuario e = new MUsuario();
                e.setPersona_id(rs.getInt(1));
                e.setIdentificador(rs.getInt(2));
                e.setPersona_nombre(rs.getString(3));
                e.setPersona_appat(rs.getString(4));
                e.setPersona_apmat(rs.getString(5));
                e.setPersona_sexo(rs.getString(6));
                e.setPersona_fecha(rs.getString(7));
                e.setPersona_user(rs.getString(8));
                e.setPersona_pass(rs.getString(9));
                e.setGrupo_id(rs.getInt(10));
                e.setRol_id(rs.getInt(11));
                e.setPrivilegio_id(rs.getInt(12));
                e.setGrupo_tipo(rs.getString(13));
                e.setRol_tipo(rs.getString(14));
                e.setPrivilegio_tipo(rs.getString(15));
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
    
    public static int actualizarUsuarios(MUsuario e){
        
        //Estado de la query, se actualizo el ingrediente o no
        int estatus = 0;
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "update mpersona set persona_nombre=?, persona_appat=?, persona_apmat=?, persona_sexo=?, persona_fechaNacimiento=?,"
                    + " persona_user=?, persona_pass=?, identificador=?, grupo_id=?, rol_id=?, privilegio_id=? where persona_id=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, e.getPersona_nombre());
            ps.setString(2, e.getPersona_appat());
            ps.setString(3, e.getPersona_apmat());
            ps.setString(4, e.getPersona_sexo());
            ps.setString(5, e.getPersona_fecha());
            ps.setString(6, e.getPersona_user());
            ps.setString(7, e.getPersona_pass());
            ps.setInt(8, e.getIdentificador());
            ps.setInt(9, e.getGrupo_id());
            ps.setInt(10, e.getRol_id());
            ps.setInt(11, e.getPrivilegio_id());
            ps.setInt(12, e.getPersona_id());
            
            estatus = ps.executeUpdate();
            
            System.out.println("Se actualizo el usuarios");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo actualizar el usuarios");
            System.out.println(ex.getMessage());
        }
        return estatus;
    }
    
    public static int eliminarUsuario(int persona_id){
        
        //Estado de la query, se elimino el ingrediente o no
        int estatus = 0;
        
        try{
            //Conexión
            Connection con = Conexion.getConection();
            
            String q = "delete from mpersona where persona_id=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, persona_id);
            
            estatus = ps.executeUpdate();
            
            
            
            System.out.println("Se elimino el ingrediente");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo elimnar al ingrediente");
            System.out.println(ex.getMessage());
        }
        return estatus;
    }
    
    public static List<MUsuario> getAllDocentes(){
        //primero declarar el arraylist
        List<MUsuario> lista = new ArrayList<MUsuario>();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from personamuestra where rol_id=6";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //donde se crea el objeto del empleado
                MUsuario e = new MUsuario();
                e.setPersona_id(rs.getInt(1));
                e.setIdentificador(rs.getInt(2));
                e.setPersona_nombre(rs.getString(3));
                e.setPersona_appat(rs.getString(4));
                e.setPersona_apmat(rs.getString(5));
                e.setPersona_sexo(rs.getString(6));
                e.setPersona_fecha(rs.getString(7));
                e.setPersona_user(rs.getString(8));
                e.setPersona_pass(rs.getString(9));
                e.setGrupo_id(rs.getInt(10));
                e.setRol_id(rs.getInt(11));
                e.setPrivilegio_id(rs.getInt(12));
                e.setGrupo_tipo(rs.getString(13));
                e.setRol_tipo(rs.getString(14));
                e.setPrivilegio_tipo(rs.getString(15));
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
    
    public static List<MUsuario> getAllTecnicos(){
        //primero declarar el arraylist
        List<MUsuario> lista = new ArrayList<MUsuario>();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from personamuestra where rol_id=7";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //donde se crea el objeto del empleado
                MUsuario e = new MUsuario();
                e.setPersona_id(rs.getInt(1));
                e.setIdentificador(rs.getInt(2));
                e.setPersona_nombre(rs.getString(3));
                e.setPersona_appat(rs.getString(4));
                e.setPersona_apmat(rs.getString(5));
                e.setPersona_sexo(rs.getString(6));
                e.setPersona_fecha(rs.getString(7));
                e.setPersona_user(rs.getString(8));
                e.setPersona_pass(rs.getString(9));
                e.setGrupo_id(rs.getInt(10));
                e.setRol_id(rs.getInt(11));
                e.setPrivilegio_id(rs.getInt(12));
                e.setGrupo_tipo(rs.getString(13));
                e.setRol_tipo(rs.getString(14));
                e.setPrivilegio_tipo(rs.getString(15));
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
    
    public static List<MUsuario> getAllAdmin(){
        //primero declarar el arraylist
        List<MUsuario> lista = new ArrayList<MUsuario>();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from personamuestra where rol_id=8";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //donde se crea el objeto del empleado
                MUsuario e = new MUsuario();
                e.setPersona_id(rs.getInt(1));
                e.setIdentificador(rs.getInt(2));
                e.setPersona_nombre(rs.getString(3));
                e.setPersona_appat(rs.getString(4));
                e.setPersona_apmat(rs.getString(5));
                e.setPersona_sexo(rs.getString(6));
                e.setPersona_fecha(rs.getString(7));
                e.setPersona_user(rs.getString(8));
                e.setPersona_pass(rs.getString(9));
                e.setGrupo_id(rs.getInt(10));
                e.setRol_id(rs.getInt(11));
                e.setPrivilegio_id(rs.getInt(12));
                e.setGrupo_tipo(rs.getString(13));
                e.setRol_tipo(rs.getString(14));
                e.setPrivilegio_tipo(rs.getString(15));
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
