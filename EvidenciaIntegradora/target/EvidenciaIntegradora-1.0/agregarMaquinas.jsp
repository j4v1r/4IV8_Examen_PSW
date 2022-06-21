<%-- 
    Document   : agregarMaquinas
    Created on : 20/06/2022, 01:08:51 AM
    Author     : Rogelio Colunga R
--%>

<%@page import="modelo.*"%>
<%@page import="controlador.AccionesParaMaquina"%>
<%@page import="controlador.AccionesDEquipo"%>
<%@page import="controlador.AccionesCAsignatura"%>
<%@page import="controlador.AccionesCEstadoReporte"%>
<%@page import="java.util.List"%>
<%@page import="controlador.AccionesCPrioridad"%>
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
    <title>Agregar Maquina</title>
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
            <a href="agregarMaquinas.jsp" class="selected">
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

    <main>
        <h1>Registrar Maquina</h1>
        <br>
        <div class="form">
            <form action="guardarMaquina" method="post" name="registrom">
                <table class="tform">
                    
                    <tr>
                        <td><label>Etiqueta: </label></td>
                        <td><input type="text" id="etiqueta" name="etiqueta" class="in1" ></td>
                    </tr>
                    <tr>
                        <td><label>Laboratorio: </label></td>
                        <td><select name="lab" id="lab">
                                 <%
                                
                                List<CLaboratorio> listaLb = AccionesParaMaquina.getAllLabs();
                                for(CLaboratorio lb: listaLb){
                            %>
                                <option value="<%=lb.getId_laboratorio()%>"><%=lb.getLab_nom()%></option>

                                <%
                                
                                    }
                                %>
                            </select></td>
                    </tr>
                    <tr>
                        <td><label>Marca: </label></td>
                        <td><select name="marca" id="marca">
                                 <%
                                
                                List<CMarca> listaMc = AccionesParaMaquina.getAllMarcas();
                                for(CMarca mc: listaMc){
                            %>
                                <option value="<%=mc.getMarca_id()%>"><%=mc.getMarca_nom()%></option>

                                <%
                                
                                    }
                                %>
                            </select></td>
                    </tr>
                    <tr>
                        <td><label>CPU: </label></td>
                        <td><select name="cpu" id="cpu">
                                 <%
                                
                                List<MCPU> listaCp = AccionesParaMaquina.getAllCPUs();
                                for(MCPU cp: listaCp){
                            %>
                                <option value="<%=cp.getCpu_serial()%>"><%=cp.getCpu_descripcion()%></option>

                                <%
                                
                                    }
                                %>
                            </select></td>
                    </tr>
                    <tr>
                        <td><label>Accesorios: </label></td>
                        <td><select name="accesorio" id="accesorio">
                                 <%
                                
                                List<MAccesorio> listaAc = AccionesParaMaquina.getAllAccesorios();
                                for(MAccesorio ac: listaAc){
                            %>
                                <option value="<%=ac.getAccesorio_id()%>"><%=ac.getConfig_descripcionTeclado()%> - <%=ac.getConfig_descripcionMause()%></option>

                                <%
                                
                                    }
                                %>
                            </select></td>
                    </tr>
                    <tr>
                        <td><label>Monitor: </label></td>
                        <td>
                            <select name="monitor" id="monitor">
                                
                                <%
                                
                                List<MMonitor> listaMr = AccionesParaMaquina.getAllMonitores();
                                for(MMonitor mn: listaMr){
                            %>
                                <option value="<%=mn.getMonitor_id()%>"><%=mn.getMonitor_descripcion()%></option>

                                <%
                                
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label>Configuración: </label></td>
                        <td>
                            <select name="config" id="config">
                                
                                <%
                                
                                List<MConfiguracion> listaCg = AccionesParaMaquina.getAllConfigs();
                                for(MConfiguracion cg: listaCg){
                            %>
                                <option value="<%=cg.getConfig_id()%>"><%=cg.getConfig_descripcion()%></option>

                                <%
                                
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label>Estado del Equipo: </label></td>
                        <td>
                            <select name="edo" id="edo">
                                
                                <%
                                
                                List<CEdoEquipo> listaEq = AccionesParaMaquina.getAllEstados();
                                for(CEdoEquipo eq: listaEq){
                            %>
                                <option value="<%=eq.getEdoEquipo_id()%>"><%=eq.getEdoEquipo_tipo()%></option>

                                <%
                                
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td align="center"><input type="button" onclick="registroMaquina()" name="btn_1" id="btn_1" value="Registrar Maquina" class="btn-1"></td>
                        <td align="center"><input type="button" onclick="location.href='registrarCosas.jsp'" name="btn_1" id="btn_1" value="Agregar Elementos " class="btn-1"></td>
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

