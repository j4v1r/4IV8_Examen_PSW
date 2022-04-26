<%-- 
    Document   : RegistroPersona
    Created on : 24/04/2022, 10:29:11 AM
    Author     : Alejandro Colunga
--%>

<%@page contentType="text/html" language="java"
        import="java.sql.*, java.util.*, java.text.*" 
        pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro Exitoso</title>
        <link rel="stylesheet" href="CSS/registro.css">
    </head>
    <body>
        <%
            //aqui ya puedo incorporar java
            Connection con = null;
            Statement set = null;
            ResultSet rs = null;
            
            String username, url, password, driver;
            
            url = "jdbc:mysql://localhost/examen6";
            username = "Alejandro";
            password = "gl0rfInd3#";
            
            driver = "com.mysql.jdbc.Driver";
            
            try{
                //conectarnos
                Class.forName(driver);
                con = DriverManager.getConnection(url, username, password);
                
                try{
                    String nom, appat, apmat, sexo, fecha, usuario, contrasena, foto;
                    int numemp;
                    
                    nom = request.getParameter("nombrer");
                    appat = request.getParameter("appatr");
                    apmat = request.getParameter("apmatr");
                    sexo = request.getParameter("sexor");
                    fecha = request.getParameter("fechanr");
                    usuario = request.getParameter("usuarior");
                    contrasena = request.getParameter("contrar");
                    foto = request.getParameter("imagenr");
                    numemp = Integer.parseInt(request.getParameter("noempr"));
                    
                    set = con.createStatement();
                    
                    String q = "insert into mpersona (nombre, appat, apmat, sexo, fecha_nacimiento, user, pass, numero_empleado, foto, Cprivilegio_id_privilegio, Crol_id_rol)"
                            + " values ('"+nom+"', '"+appat+"', '"+apmat+"', '"+sexo+"', '"+fecha+"', '"+usuario+"', '"+contrasena+"', "+numemp+", '"+foto+"', 1, 1)";
                    
                    int registro = set.executeUpdate(q);
                    
                    %>
                    <table class="inicios">
                        <tr>
                            <td>Registro Exitoso</td>
                        </tr>
                        <tr>
                            <td>Para ir al inicio haga click <a href="Principal.jsp">aquí</a></td>
                            <td><a href="LBD.jsp">LBD</a></td>
                        </tr>
                    </table>
                    <%
                
                }catch(SQLException es){
                    System.out.println("Error al registrar en la tabla");
                    System.out.println(es.getMessage());
                    %>
                    <h1>No se pudo registrar</h1>
                    <%
                
                }
            }catch(Exception e){
                System.out.println("Error al conecta la BD");
                System.out.println(e.getMessage());
                %>
                <h1>No conecto con la BD T_T</h1>
                <%
            
            }
            
            %>
        
    </body>
</html>
