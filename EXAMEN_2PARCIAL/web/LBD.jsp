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
        <link rel="stylesheet" href="CSS/LBD.css">
    </head>
    <body>
        
        <h1>Laboratorio de Base de Datos</h1>
        
        <select name="filtro" id="filtro">
            <option value="1">Prioridad: Urgente</option>
            <option value="2">Prioridad: Media</option>
            <option value="3">Prioridad: No Urgente</option>
            <option value="4">Estado: Resuelto</option>
            <option value="5">Estado: En Proceso</option>
        </select>
        
        <table border="2" class="LBD">
            <thead>
                <tr>
                    <th>ID_Reporte</th>
                    <th>Fecha</th>
                    <th>Hora</th>
                    <th>Problema</th>
                    <th>Estado</th>
                    <th>Asignatura</th>
                    <th>Grupo</th>
                    <th>Prioridad</th>
                    <th>Persona</th>
                    <th>Etiqueta Equipo</th>
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
                    
                    int filtro = Integer.parseInt(request.getParameter("filtro"));
                    
                    String q = "select id_dreporte as 'Reporte',fecha as 'Fecha', hora as 'Hora', problema as 'Problema', tipo as 'Estado', "
                            + "nombre as 'Asignatura', nombre_grupo as 'Grupo', tipo_prioridad as 'Prioridad', nombre_persona as 'Persona', "
                            + "mequipo_id_equipo as 'Etiqueta Equipo' from dreporte left join cestadoreporte on cestadoreporte_id_cer=id_cer "
                            + "left join casignatura on casignatura_id_asignatura=id_asignatura left join cgrupo on cgrupo_id_grupo=id_grupo"
                            + " left join cprioridad on cprioridad_id_prioridad=id_prioridad left join mpersona on mpersona_numero_empleado=numero_empleado";
                    
                            set = con.createStatement();
                    
                            rs = set.executeQuery(q);
                            
                            while(rs.next()){
                    
                    switch(filtro){
                            
                        case 1:{
                            String a = "select id_dreporte as 'Reporte',fecha as 'Fecha', hora as 'Hora', problema as 'Problema', tipo as 'Estado', nombre as "
                            + "'Asignatura', nombre_grupo as 'Grupo', tipo_prioridad as 'Prioridad', nombre_persona as 'Persona', mequipo_id_equipo as "
                            + "'Etiqueta Equipo', claboratorio_id_lab as 'id_laboratorio' from dreporte left join cestadoreporte on cestadoreporte_id_cer=id_cer "
                            + "left join casignatura on casignatura_id_asignatura=id_asignatura left join cgrupo on cgrupo_id_grupo=id_grupo left join }"
                            + "cprioridad on cprioridad_id_prioridad=id_prioridad left join mpersona on mpersona_numero_empleado=numero_empleado left join mequipo "
                            + "on mequipo_id_equipo=id_equipo where tipo_prioridad='Urgente'";
                            
                            set = con.createStatement();
                    
                            rs = set.executeQuery(a);
                            
                            break;
                        }
                    }
                    
                    
                    
                    
                    
                    
                    %>
                    <tr>
                        <td><%=rs.getInt("Reporte")%></td>
                        <td><%=rs.getString("Fecha")%></td>
                        <td><%=rs.getString("Hora")%></td>
                        <td><%=rs.getString("Estado")%></td>
                        <td><%=rs.getString("Problema")%></td>
                        <td><%=rs.getString("Asignatura")%></td>
                        <td><%=rs.getString("Grupo")%></td>
                        <td><%=rs.getString("Prioridad")%></td>
                        <td><%=rs.getString("Persona")%></td>
                        <td><%=rs.getString("Etiqueta Equipo")%></td>
                        <td><a href="editaralumno.jsp?id=<%=rs.getInt("Reporte")%>">Editar</a></td>
                        <td><a href="borraralumno.jsp?id=<%=rs.getInt("Reporte")%>">Borrar</a></td>
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
