/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.sql.*;

/**
 *
 * @author Equipo 1
 */
public class Conexion {
    public static Connection getConection(){
        String url, username, password;
        
        url = "jdbc:mysql://localhost/maquinasbatiz";
        username = //"Alejandro";
                "root";
        password =  "n0m3l0"; 
                //"gl0rfInd3#";
                //"Cami3105+";
        
        Connection con = null;
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, username, password);
            System.out.println("Se conecto con la BD");
        }catch(Exception e){
            System.out.println("No se conecto con la bd");
            System.out.println(e.getMessage());
        
        }
        return con;
    }
}
