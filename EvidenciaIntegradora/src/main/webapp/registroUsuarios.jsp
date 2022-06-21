<%-- 
    Document   : registroUsuarios
    Created on : 16/06/2022, 08:38:23 AM
    Author     : Rogelio Colunga R
--%>
<%@page import="modelo.CRol"%>
<%@page import="controlador.AccionesCRol"%>
<%@page import="modelo.CPrivilegio"%>
<%@page import="controlador.AccionesPrivilegio"%>
<%@page import="java.util.List"%>
<%@page import="modelo.CGrupo"%>
<%@page import="modelo.CGrupo"%>
<%@page import="controlador.AccionesCGrupo"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%String usuario;
int rol, id_persona;
HttpSession sesionuser=request.getSession();
HttpSession sesionrol=request.getSession();
HttpSession sesionid=request.getSession();
if(sesionuser.getAttribute("usuario")==null){
%>
<jsp:forward page="registrarse.jsp" >
    <jsp:param name="error" value="Es obligatorio autenticarse con una sesion válida" />
</jsp:forward>
<%  
    }else{
    usuario = (String)sesionuser.getAttribute("usuario");
    rol = (int)sesionrol.getAttribute("rol");
    id_persona = (int)sesionid.getAttribute("id_persona");
%>
<!DOCTYPE html>
<html lang="en">
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Usuarios</title>
        <link rel="stylesheet" href="style.css">
        <script src="https://kit.fontawesome.com/75e8eeea01.js" crossorigin="anonymous"></script>
    </head>
    <body id="body">
        <header>
        <div class="icon__menu">
            <i class="fas fa-bars" id="btn_open"></i>
        </div>
        </header>

        <div class="menu__side" id="menu_side">

            <div class="name__page">
                <i class="fa-brands fa-product-hunt" title="Inicio"></i>
                <h4>Psal</h4>
            </div>

            <div class="options__menu">

            <%if(rol==6){%>
            <a href="alumnosDoc.jsp" >
                <div class="option">
                    <i class="fa-solid fa-house-chimney" title="Inicio"></i>
                    <h4>Inicio</h4>
                </div>
            </a>
            <%}else if(rol==5){%>
            <a href="misReportes.jsp" >
                <div class="option">
                    <i class="fa-solid fa-house-chimney" title="Inicio"></i>
                    <h4>Inicio</h4>
                </div>
            </a> 
            <%}else if(rol==8){%>
            <a href="principal.jsp" >
                <div class="option">
                    <i class="fa-solid fa-house-chimney" title="Inicio"></i>
                    <h4>Inicio</h4>
                </div>
            </a>
            <a href="usuariosAdmin.jsp" >
                <div class="option">
                    <i class="fa-solid fa-people-group" title="Usuarios"></i>
                    <h4>Usuarios</h4>
                </div>
            </a> 
            <a href="maquinasAdmin.jsp" >
                <div class="option">
                    <i class="fa-solid fa-computer" title="Maquinas"></i>
                    <h4>Maquinas</h4>
                </div>
            </a>
            <a href="bitacora.jsp">
               <div class="option"> 
                    <i class="fa-solid fa-book-bookmark" title="Bitácora"></i>
                    <h4>Bitácora</h4>
               </div>
            </a>
            <%}else{%>
            <a href="principal.jsp" >
                <div class="option">
                    <i class="fa-solid fa-house-chimney" title="Inicio"></i>
                    <h4>Inicio</h4>
                </div>
            </a>
            <a href="maquinasAdmin.jsp" >
                <div class="option">
                    <i class="fa-solid fa-computer" title="Maquinas"></i>
                    <h4>Maquinas</h4>
                </div>
            </a>
            <a href="agregarMaquinas.jsp" >
                <div class="option">
                    <i class="fa-solid fa-laptop-medical" title="Agregar Maquinas"></i>
                    <h4>Agregar Maquinas</h4>
                </div>
            </a>
            <a href="bitacora.jsp">
               <div class="option"> 
                    <i class="fa-solid fa-book-bookmark" title="Bitácora"></i>
                    <h4>Bitácora</h4>
               </div>
            </a>
            <%}%>
            <a href="registroR.jsp">
                <div class="option">
                    <i class="fa-solid fa-triangle-exclamation" title="Nuevo Reporte"></i>
                    <h4>Nuevo Reporte</h4>
                </div>
            </a>
            <%
            if(rol!=5){
            
            %>
            <a href="labnt.jsp" >
                <div class="option">
                    <i class="fa-solid fa-desktop" title="LNT"></i>
                    <h4>LNT</h4>
                </div>
            </a>
            <a href="labbd.jsp" >
                <div class="option">
                    <i class="fa-solid fa-database" title="LBD"></i>
                    <h4>LBD</h4>
                </div>
            </a>
            <a href="labds.jsp" >
                <div class="option">
                    <i class="fa-solid fa-code" title="LDS"></i>
                    <h4>LDS</h4>
                </div>
            </a>
            <a href="aula.jsp" >
                <div class="option">
                    <i class="fa-solid fa-4" title="Aula 4.0"></i>
                    <h4>4.0</h4>
                </div>
            </a>
            <%
                }
            %>
            <a href="editarP.jsp" >
                <div class="option">
                    <i class="fa-solid fa-user" title="Perfil"></i>
                    <h4>Consultar Perfil</h4>
                </div>
            </a>
            <a href="cerrarSesion">
                <div class="option">
                    <i class="fa-solid fa-power-off" title="Salir"></i>
                    <h4>Salir</h4>
                </div>
            </a>

        </div>

        </div>
            
            
        <div class="registrousuarios" >
            
            <form action="guardarUsuarios" method="post" class="registro" name="registro">
                <table class="formulario">
                    <h1><center>Registrar Usuarios</center></h1>
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
                        <td class="inputa"><input type="password" id="contrar" name="contrar" ></td>
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
                                
                                List<CRol> listaCr = AccionesCRol.getAllRolesDV();
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
                                
                                List<CPrivilegio> listaPr = AccionesPrivilegio.getAllPrivilegioDV();
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
                    </tr>
                    <tr></tr>
                </table>
            </form>

        </div>
        
        
        <script src="JS/scriptC.js"></script>
        <script src="JS/validacion.js"></script>
        
        
    </body>
</html>
<%
    }
%>

