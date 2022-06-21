<%-- 
    Document   : editReporte
    Created on : 18/06/2022, 01:55:12 PM
    Author     : Rogelio Colunga R
--%>

<%@page import="modelo.DReporte"%>
<%@page import="controlador.AccionesReporte"%>
<%@page import="modelo.DEquipo"%>
<%@page import="controlador.AccionesDEquipo"%>
<%@page import="modelo.CAsignatura"%>
<%@page import="controlador.AccionesCAsignatura"%>
<%@page import="modelo.CEstadoReporte"%>
<%@page import="controlador.AccionesCEstadoReporte"%>
<%@page import="modelo.CPrioridad"%>
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
    <title>Editar Reporte</title>
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

    <main>
        <h1>Editar Reporte</h1>
        <br>
        <div class="form">
            <form action="editarReporte" method="post" name="reporte">
                <table class="tform">
                    <%
                        int id_dreporte = Integer.parseInt(request.getParameter("id_reporte"));
                        
                        DReporte e = AccionesReporte.buscarReporteID(id_dreporte);
                    
                    %>
                    
                    <tr>
                        <td><label>Fecha: </label></td>
                        <td><input type="date" id="fecha" name="fecha" class="in1" value="<%=e.getDetalleReporte_fecha()%>"></td>
                    </tr>
                    <tr>
                        <td><label>Hora: </label></td>
                        <td><input type="time" id="hora" name="hora" class="in1" value="<%=e.getDetalleReporte_hora()%>"></td>
                    </tr>
                    <tr>
                        <td><label>Estado de Reporte: </label></td>
                        <td>
                            <select name="ereporte" id="ereporte">
                                <option value="<%=e.getEdoRe_id()%>"><%=e.getEdoRe_tipo()%></option>
                                 <%
                                
                                List<CEstadoReporte> listaEr = AccionesCEstadoReporte.getAllEstadosR();
                                for(CEstadoReporte ep: listaEr){
                            %>
                                <option value="<%=ep.getEdoRe_id()%>"><%=ep.getEdoRe_tipo()%></option>

                                <%
                                
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label>Prioridad del Reporte: </label></td>
                        <td>
                            <select name="prioridad" id="prioridad">
                                <option value="<%=e.getPrioridad_id()%>"><%=e.getPrioridad_tipo()%></option>
                                <%
                                
                                List<CPrioridad> listaPr = AccionesCPrioridad.getAllPrioridad();
                                for(CPrioridad p: listaPr){
                            %>
                                <option value="<%=p.getPrioridad_id()%>"><%=p.getPrioridad_tipo()%></option>

                                <%
                                
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label>Asignatura: </label></td>
                        <td>
                            <select name="asignatura" id="asignatura">
                                <option value="<%=e.getAsignatura_id()%>"><%=e.getAsignatura_nombre()%></option>
                                <%
                                
                                List<CAsignatura> listaAs = AccionesCAsignatura.getAllAsignatura();
                                for(CAsignatura as: listaAs){
                            %>
                                <option value="<%=as.getAsignatura_id()%>"><%=as.getAsignatura_nombre()%></option>

                                <%
                                
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label>ID Equipo: </label></td>
                        <td><select name="equipo" id="equipo">
                                <option value="<%=e.getEquipo_etiqueta()%>"><%=e.getEquipo_etiqueta()%></option>
                                <%
                                
                                List<DEquipo> listaEq = AccionesDEquipo.getAllEquipos();
                                for(DEquipo eq: listaEq){
                            %>
                                <option value="<%=eq.getEquipo_etiqueta()%>"><%=eq.getEquipo_etiqueta()%></option>

                                <%
                                
                                    }
                                %>
                            </select></td>
                    </tr>
                    <tr>
                        <td><label>Descripcion: </label></td>
                        <td><textarea name="descripcion" id="descripcion" cols="30" rows="10" ><%=e.getProblema()%></textarea></td>
                    </tr>
                    <td><input type="hidden" name="persona_id" value="<%=e.getPersona_id()%>"></td>
                    <td><input type="hidden" name="reporte_id" value="<%=e.getDetalleReporte_id()%>"></td>
                    <tr>
                        <td align="center"><input type="button" onclick="editarReporte()" name="btn_1" id="btn_1" value="Editar Reporte" class="btn-1"></td>
                        <td align="center"><input  type="button" onclick="location.href='javascript:javascript:history.go(-1)'" name="btn_2" id="btn_2" value="Cancelar" class="btn-1"></td>
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

