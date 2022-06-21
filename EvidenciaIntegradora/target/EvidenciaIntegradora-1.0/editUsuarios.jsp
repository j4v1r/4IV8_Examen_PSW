<%-- 
    Document   : editUsuarios
    Created on : 19/06/2022, 08:32:13 AM
    Author     : Rogelio Colunga R
--%>

<%@page import="controlador.AccionesPrivilegio"%>
<%@page import="modelo.CPrivilegio"%>
<%@page import="modelo.CRol"%>
<%@page import="controlador.AccionesCRol"%>
<%@page import="controlador.AccionesCGrupo"%>
<%@page import="java.util.List"%>
<%@page import="modelo.CGrupo"%>
<%@page import="modelo.MUsuario"%>
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
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Usuario</title>
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
                <div class="option" >
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
            <%}else{%>
            <a href="principal.jsp" >
                <div class="option">
                    <i class="fa-solid fa-house-chimney" title="Inicio"></i>
                    <h4>Inicio</h4>
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
            <a href="labnt.jsp">
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
            <a href="labds.jsp">
                <div class="option">
                    <i class="fa-solid fa-code" title="LDS"></i>
                    <h4>LDS</h4>
                </div>
            </a>
            <a href="aula.jsp">
                <div class="option">
                    <i class="fa-solid fa-4" title="Aula 4.0"></i>
                    <h4>4.0</h4>
                </div>
            </a>
            <%
                }
            %>
            <a href="#" >
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

    <main>
        <h1>Editar Usuario</h1>
        <br>
        <div class="form">
            <%
            //id
            int persona_id = Integer.parseInt(request.getParameter("persona_id"));
            
            MUsuario e = MUsuario.buscarUsuarioID(persona_id);
            
            %>
            <form action="editarUsuariosAdmin" class="form" name="actualizaruser">
                <table class="tform-3">
                    <td><input type="hidden" name="persona_id" value="<%=e.getPersona_id()%>"></td>
                    <tr>
                        <td><label>Nombre</label></td>
                        <td><input type="text" name="nombre" id="nombre" class="in1" value="<%=e.getPersona_nombre()%>"></td>
                    </tr>
                    <tr class="espacio1"></tr>
                    <tr>
                        <td><label>Apelldio Paterno</label></td>
                        <td><input type="text" name="appat" id="appat" class="in1" value="<%=e.getPersona_appat()%>"></td>
                    </tr>
                    <tr class="espacio1"></tr>
                    <tr>
                        <td><label>Apelldio Materno</label></td>
                        <td><input type="text" name="apmat" id="apmat" class="in1" value="<%=e.getPersona_apmat()%>"></td>
                    </tr>
                    <tr class="espacio1"></tr>
                    <tr>
                        <td><label>No. de Empleado/Boleta</label></td>
                        <td><input type="text" name="No-emp" id="identificador" class="in1" value="<%=e.getIdentificador()%>"></td>
                    </tr>
                    <tr class="espacio1"></tr>
                    <tr>
                        <td><label>Fecha de Nacimiento</label></td>
                        <td><input type="date" name="fnac" id="fnac" class="in1" value="<%=e.getPersona_fecha()%>"></td>
                    </tr>
                    <tr class="espacio1"></tr>
                    <tr>
                        <td><label>Usuario</label></td>
                        <td><input type="text" name="user" id="user" class="in1" value="<%=e.getPersona_user()%>"></td>
                    </tr>
                    <tr class="espacio1"></tr>
                    <tr>
                        <td><label>Contraseña</label></td>
                        <td><input type="password" name="pass" id="pass" class="in1" value="<%=e.getPersona_pass()%>"></td>
                    </tr>
                    <tr class="espacio1"></tr>
                    <tr>
                        <td><label>Sexo</label></td>
                        <td>
                            <select id="sexo" name="sexo"> 
                                <option><%=e.getPersona_sexo()%></option>
                                <option>Masculino</option>
                                <option>Femenino</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="espacio1"></tr>
                    <tr>
                        <td><label>Grupo</label></td>
                        <td><select name="grupo">
                            <option value="<%=e.getGrupo_id()%>"><%=e.getGrupo_tipo()%></option>
                            <%
                                List<CGrupo> listaGr = AccionesCGrupo.getAllGrupos();
                                for(CGrupo g: listaGr){
                            %>
                            <option value="<%=g.getGrupo_id()%>"><%=g.getGrupo_tipo()%></option>
                            <%}%>
                        </select></td>
                    </tr>
                    <tr class="espacio1"></tr>
                    <tr>
                        <td><label>Rol</label></td>
                        <td><select id="rol1" name="rol1"> 
                            <option value="<%=e.getRol_id()%>"><%=e.getRol_tipo()%></option>
                            <%
                                List<CRol> listaCr = AccionesCRol.getAllRolesDV();
                                for(CRol cr: listaCr){
                            %>
                            <option value="<%=cr.getRol_id()%>"><%=cr.getRol_tipo()%></option>
                            <%}%>
                        </select></td>
                    </tr>
                    <tr class="espacio1"></tr>
                    <tr>
                        <td><label>Rol Secundario</label></td>
                        <td><select id="rol2" name="rol2"> 
                            <option value="<%=e.getPrivilegio_id()%>"><%=e.getPrivilegio_tipo()%></option>
                            <%
                                List<CPrivilegio> listaPr = AccionesPrivilegio.getAllPrivilegioDV();
                                for(CPrivilegio pr: listaPr){
                            %>
                            <option value="<%=pr.getPrivilegio_id()%>"><%=pr.getPrivilegio_tipo()%></option>
                            <%}%>
                        </select></td>
                    </tr>
                    <tr class="espacio1"></tr>
                    <tr>
                        <td align="center"><input type="button" onclick="actualizarUsuario()" name="btn_1" id="btn_1" value="Actualizar Datos" class="btn-1"></td>
                    </tr>
                </table>
            </form>
        </div>
    </main>

    <script src="JS/scriptC.js"></script>
    <script src="JS/validacion.js"></script>

</body>
</html>
<%
    }
%>
