<%-- 
    Document   : labbd
    Created on : 4/06/2022, 11:20:25 PM
    Author     : Emmanuel
--%>

<%@page import="controlador.AccionesCPrioridad"%>
<%@page import="modelo.CPrioridad"%>
<%@page import="controlador.AccionesCEstadoReporte"%>
<%@page import="modelo.CEstadoReporte"%>
<%@page import="controlador.AccionesReporte"%>
<%@page import="modelo.DReporte"%>
<%@page import="java.util.List"%>
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
    <title>LBD</title>
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
            <a href="labbd.jsp" class="selected">
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
        
        <main class="main_container">
            <h1>Laboratorio de Bases de Datos</h1>
            <br>
            <table class="buscador">
                <tr>
                    <td>
                        <i class="fa-solid fa-magnifying-glass"></i>
                        <label>Buscar: </label>
                    </td>
                    <td><form method="get"><input type="text" placeholder="Ingresa etiqueta de equipo" size="30" name="q"></form></td>
                </tr>
            </table>
            <br>
            
            <table border="2" class="tabla_consulta">
            <thead>
                <tr>
                    <th>Equipo</th>
                    <th>Fecha</th>
                    <th>Hora</th>
                    <th>Estado Reporte</th>
                    <th>Prioridad</th>
                    <th>Asignatura</th>
                    <th>Responsable</th>
                    <th>Grupo</th>
                    <th>Problema</th>
                    <th>Editar</th>
                </tr>        
            </thead>
            <tbody>
                <%
                    String laboratorio = "LBD";
                    
                    String busqueda = request.getParameter("q");
                    
                    if(busqueda==null){
                        List<DReporte> listar = AccionesReporte.getAllReportePLab(laboratorio);
                        for(DReporte e : listar){%>
                        <tr>
                        <td><%=e.getEquipo_etiqueta()%></td>
                        <td><%=e.getDetalleReporte_fecha()%></td>
                        <td><%=e.getDetalleReporte_hora()%></td>
                        <td><%=e.getEdoRe_tipo()%></td>
                        <td><%=e.getPrioridad_tipo()%></td>
                        <td><%=e. getAsignatura_nombre()%></td>
                        <td><%=e.getPersona_nombre()%></td>
                        <td><%=e.getGrupo_tipo()%></td>
                        <td><%=e.getProblema()%></td>
                        <td>
                            <a href="editReporte.jsp?id_reporte=<%=e.getDetalleReporte_id()%>"><i class="fa-solid fa-pen-to-square" style="font-size: 20px;" ></i></a>
                        </td>
                    </tr>
                        
                    <%}}else{List<DReporte> listar = AccionesReporte.getAllReportePLabB(laboratorio, busqueda);
                        for(DReporte e : listar){%>
                    <tr>
                        <td><%=e.getEquipo_etiqueta()%></td>
                        <td><%=e.getDetalleReporte_fecha()%></td>
                        <td><%=e.getDetalleReporte_hora()%></td>
                        <td><%=e.getEdoRe_tipo()%></td>
                        <td><%=e.getPrioridad_tipo()%></td>
                        <td><%=e. getAsignatura_nombre()%></td>
                        <td><%=e.getPersona_nombre()%></td>
                        <td><%=e.getGrupo_tipo()%></td>
                        <td><%=e.getProblema()%></td>
                        <td>
                            <a href="editReporte.jsp?id_reporte=<%=e.getDetalleReporte_id()%>"><i class="fa-solid fa-pen-to-square" style="font-size: 20px;" ></i></a>
                        </td>
                    </tr>
                    <%
                        }}
                    %>
            </tbody>
            </table>
        </main>
        
        
        <script src="JS/scriptC.js"></script>
    </body>
</html> 
<%
    }
%>
