/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import controlador.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Rogelio Colunga R
 */
public class MUsuario {
    
    private String persona_nombre, persona_appat, persona_apmat, persona_sexo, persona_fecha, persona_user, persona_pass, grupo_tipo, rol_tipo, privilegio_tipo;
    private int identificador, grupo_id, rol_id, privilegio_id, persona_id;

    public String getPersona_nombre() {
        return persona_nombre;
    }

    public void setPersona_nombre(String persona_nombre) {
        this.persona_nombre = persona_nombre;
    }

    public String getPersona_appat() {
        return persona_appat;
    }

    public void setPersona_appat(String persona_appat) {
        this.persona_appat = persona_appat;
    }

    public String getPersona_apmat() {
        return persona_apmat;
    }

    public void setPersona_apmat(String persona_apmat) {
        this.persona_apmat = persona_apmat;
    }

    public String getPersona_sexo() {
        return persona_sexo;
    }

    public void setPersona_sexo(String persona_sexo) {
        this.persona_sexo = persona_sexo;
    }

    public String getPersona_fecha() {
        return persona_fecha;
    }

    public void setPersona_fecha(String persona_fecha) {
        this.persona_fecha = persona_fecha;
    }

    public String getPersona_user() {
        return persona_user;
    }

    public void setPersona_user(String persona_user) {
        this.persona_user = persona_user;
    }

    public String getPersona_pass() {
        return persona_pass;
    }

    public void setPersona_pass(String persona_pass) {
        this.persona_pass = persona_pass;
    }

    public int getIdentificador() {
        return identificador;
    }

    public void setIdentificador(int identificador) {
        this.identificador = identificador;
    }

    public int getGrupo_id() {
        return grupo_id;
    }

    public void setGrupo_id(int grupo_id) {
        this.grupo_id = grupo_id;
    }

    public int getRol_id() {
        return rol_id;
    }

    public void setRol_id(int rol_id) {
        this.rol_id = rol_id;
    }

    public int getPrivilegio_id() {
        return privilegio_id;
    }

    public void setPrivilegio_id(int privilegio_id) {
        this.privilegio_id = privilegio_id;
    }
    
    public int getPersona_id() {
        return persona_id;
    }

    public void setPersona_id(int persona_id) {
        this.persona_id = persona_id;
    }
    
    public String getGrupo_tipo() {
        return grupo_tipo;
    }

    public void setGrupo_tipo(String grupo_tipo) {
        this.grupo_tipo = grupo_tipo;
    }

    public String getRol_tipo() {
        return rol_tipo;
    }

    public void setRol_tipo(String rol_tipo) {
        this.rol_tipo = rol_tipo;
    }

    public String getPrivilegio_tipo() {
        return privilegio_tipo;
    }

    public void setPrivilegio_tipo(String privilegio_tipo) {
        this.privilegio_tipo = privilegio_tipo;
    }
    
    public MUsuario verificarUsuario(String persona_user, String persona_pass)throws ClassNotFoundException{
        //objeto de la persona
        MUsuario usuario = null;
        //objeto de conexion
        Connection con = null;
        //Preparacion de la sentencia
        PreparedStatement ps = null;
        //Consultas
        ResultSet rs = null;
        
        try{
            //establecemos la conexion
            con = Conexion.getConection();
            String q = "select * from mpersona where persona_user=? and persona_pass=?";
            ps = con.prepareStatement(q);
            //preparo la sentencia
            ps.setString(1, persona_user);
            ps.setString(2, persona_pass);
            //ejecutamos la busqueda
            rs = ps.executeQuery();
            //Se busca el usuario
            while(rs.next()){
                usuario = new MUsuario();
                usuario.setPersona_id(rs.getInt("persona_id"));
                usuario.setIdentificador(rs.getInt("identificador"));
                usuario.setPersona_nombre(rs.getString("persona_nombre"));
                usuario.setPersona_appat(rs.getString("persona_appat"));
                usuario.setPersona_apmat(rs.getString("persona_apmat"));
                usuario.setPersona_sexo(rs.getString("persona_sexo"));
                usuario.setPersona_fecha(rs.getString("persona_fechaNacimiento"));
                usuario.setPersona_user(rs.getString("persona_user"));
                usuario.setPersona_pass(rs.getString("persona_pass"));
                usuario.setGrupo_id(rs.getInt("grupo_id"));
                usuario.setRol_id(rs.getInt("rol_id"));
                usuario.setPrivilegio_id(rs.getInt("privilegio_id"));
                
                
                break;
            }
        
        }catch(SQLException e){
            System.out.println("No conecto con la tabla");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            usuario = null;
        }finally{
            try{
                //cerrar conexiones
                rs.close();
                ps.close();
                con.close();
            }catch(Exception ex){

            System.out.println(ex.getMessage());
            }
        }
        return usuario;
    }
    
    
    public static MUsuario buscarUsuarioID(int persona_id){
        //donde se crea el objeto del empleado
        MUsuario e = new MUsuario();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from personamuestra where persona_id=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, persona_id);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                
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
                
            }
            
            System.out.println("Se busco el usuario");
            con.close();
            
            
        }catch(Exception ex){
            System.out.println("No se pudo buscar al usuario");
            System.out.println(ex.getMessage());
        }
        return e;
    }
    
    

    
    
}
