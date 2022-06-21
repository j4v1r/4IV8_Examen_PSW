<%-- 
    Document   : registrarse
    Created on : 4/06/2022, 11:37:37 PM
    Author     : Emmanuel
--%>

<%@page import="modelo.CRol"%>
<%@page import="controlador.AccionesCRol"%>
<%@page import="modelo.CPrivilegio"%>
<%@page import="controlador.AccionesPrivilegio"%>
<%@page import="java.util.List"%>
<%@page import="modelo.CGrupo"%>
<%@page import="modelo.CGrupo"%>
<%@page import="controlador.AccionesCGrupo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registro</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="registro.css">
    </head>
    <body class="registrarse">
        <div class="registros">
            
            <form action="guardarUsuario" method="post" class="registro" name="registro">
                <table class="formulario">
                    <h1>Registrarse</h1>
                    <tr class="espacio"></tr>
                    <tr>
                        <td class="datoa">No. Empleado/Boleta: </td>
                        <td class="inputa"><input type="text" id="identr" name="identr"></td>
                    </tr>
                    <tr class="espacio"></tr>
                    <tr>
                        <td class="datoa">Nombre: </td>
                        <td class="inputa"><input type="text" id="nombrer" name="nombrer"></td>   
                    </tr>
                    <tr class="espacio"></tr>              
                    <tr>
                        <td class="datoa">Apellido Paterno: </td>
                        <td class="inputa"><input type="text" id="appatr" name="appatr"></td>
                    </tr>
                    <tr class="espacio"></tr>
                    <tr>
                        <td class="datoa">Apellido Materno: </td>
                        <td class="inputa"><input type="text" id="apmatr" name="apmatr"></td>
                    </tr>
                    <tr class="espacio"></tr>
                    <tr>
                        <td class="datoa">Usuario: </td>
                        <td class="inputa"><input type="text" id="usuarior" name="usuarior"></td>
                    </tr>
                    <tr class="espacio"></tr>
                    <tr>
                        <td class="datoa">Contraseña: </td>
                        <td class="inputa"><input type="password" id="contrar" name="contrar"></td>
                    </tr>
                    <tr class="espacio"></tr>
                    <tr>
                        <td class="datoa">Fecha de Nacimiento: </td>
                        <td class="inputa"><input type="date" id="fechanr" name="fechanr" required="true"></td>
                    </tr>
                    <tr class="espacio"></tr>
                    <tr>
                        <td class="datoa">Sexo: </td>
                        <td class="inputa"><select id="sexo" name="sexo"> 
                            
                            <option>Masculino</option>
                            <option>Femenino</option>
                            
                        </select></td></td>
                    </tr>
                    <tr class="espacio"></tr>
                    <tr>
                        <td class="datoa">Grupo: </td>
                        <td class="inputa">
                        <select id="grupo" name="grupo"> 
                            <%
                                
                                List<CGrupo> listaGr = AccionesCGrupo.getAllGrupos();
                                for(CGrupo g: listaGr){
                            %>
                            
                            <option value="<%=g.getGrupo_id()%>"><%=g.getGrupo_tipo()%></option>
                            <%
                                }%>
                            
                        </select></td>
                    </tr>
                    <tr class="espacio"></tr>
                    <tr>
                        <td class="datoa">Rol Principal: </td>
                        <td class="inputa">
                        <select id="rol1" name="rol1"> 
                            <%
                                
                                List<CRol> listaCr = AccionesCRol.getAllRoles();
                                for(CRol cr: listaCr){
                            %>
                            <option value="<%=cr.getRol_id()%>"><%=cr.getRol_tipo()%></option>
                            <%
                                }%>
                        </select></td>
                    </tr>
                    <tr class="espacio"></tr>
                    <tr>
                        <td class="datoa">Rol Secundario: </td>
                        <td class="inputa">
                        <select id="rol2" name="rol2"> 
                            <%
                                
                                List<CPrivilegio> listaPr = AccionesPrivilegio.getAllPrivilegio();
                                for(CPrivilegio pr: listaPr){
                            %>
                            <option value="<%=pr.getPrivilegio_id()%>"><%=pr.getPrivilegio_tipo()%></option>
                            <%
                                }%>
                        </select></td>
                    </tr>
                    <tr class="espacio"></tr>
                    <tr>
                        <td class="boton1"><button type="button" onclick="registrarUsuario()" class="button">Registrarse</button></td>
                        <td class="boton2"><button type="button" onclick="location.href='index.jsp'" class="button">Iniciar Sesión</button></td>
                    </tr>
                    <tr></tr>
                </table>
            </form>

        </div>
    </body>
    
    <script src="JS/validacion.js"></script>
</html>
