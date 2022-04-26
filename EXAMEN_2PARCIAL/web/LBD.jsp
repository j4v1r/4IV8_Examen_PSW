<%-- 
    Document   : LBD
    Created on : 24/04/2022, 10:11:57 AM
    Author     : Alejandro Colunga
--%>

<%@page contentType="text/html" language="java"
        import="java.sql.*, java.util.*, java.text.*" 
        pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <table border="2">
            <thead>
                <tr>
                    <th>ID_Reporte</th>
                    <th>Fecha</th>
                    <th>Hora</th>
                    <th>Estado Reporte</th>
                    <th>Prioridad</th>
                    <th>Asignatura</th>
                    <th>Persona</th>
                    <th>Equipo</th>
                    <th>Grupo</th>
                    <th>Descripción</th>
                    <th>Editar</th>
                    <th>Borrar</th>
                </tr>        
            </thead>
            <tbody>
                
            
        <%
            //aqui ya puedo incorporar java
            Connection con = null;
            Statement set = null;
            ResultSet rs = null;
            
            String username, url, password, driver;
            
            url = "jdbc:mysql://localhost/examen6";
            username= "Alejandro";
            password = "gl0rfInd3#";
            
            driver = "com.mysql.jdbc.Driver";
            
            try{
                //conectarnos
                Class.forName(driver);
                con = DriverManager.getConnection(url, username, password);
                
                try{
                    String q = "select * from dreporte natural join mequipo natural join claboratorio where tipo_lab like 'LBD%'";
                    
                    set = con.createStatement();
                    
                    rs = set.executeQuery(q);
                    
                    while(rs.next()){
                    
                    
                    
                    %>
                    <tr>
                        <td><%=rs.getInt("id_dreporte")%></td>
                        <td><%=rs.getString("fecha")%></td>
                        <td><%=rs.getString("hora")%></td>
                        <td><%=rs.getString("CestadoReporte_id_cer")%></td>
                        <td><%=rs.getString("CPrioridad_id_prioridad")%></td>
                        <td><%=rs.getInt("Casignatura_id_asignatura")%></td>
                        <td><%=rs.getString("MPersona_numero_empleado")%></td>
                        <td><%=rs.getString("MEquipo_id_equipo")%></td>
                        <td><%=rs.getString("Cgrupo_id_grupo")%></td>
                        <td><%=rs.getString("problema")%></td>
                        <td><a href="editaralumno.jsp?id=<%=rs.getInt("id_dreporte")%>" >Editar</a></td>
                        <td><a href="borraralumno.jsp?id=<%=rs.getInt("id_dreporte")%>" >Borrar</a></td>
                    </tr>
                    <%
                        }
                }catch(SQLException es){
                    System.out.println("Error al registrar en la tabla");
                    System.out.println(es.getMessage());
                    %>
                    <h1>No se puede consultar la tabla</h1>
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
            </tbody>
        </table>
            <a href="index.html">Regresar a Principal</a>
            <br>
            <a href="registroalumno.jsp" >Registrar Alumno</a> 
    </body>
</html>
