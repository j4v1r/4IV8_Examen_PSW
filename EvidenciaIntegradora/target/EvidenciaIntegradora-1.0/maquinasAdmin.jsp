<%-- 
    Document   : maquinasAdmin
    Created on : 19/06/2022, 12:08:54 PM
    Author     : Rogelio Colunga R
--%>

<%@page import="modelo.DEquipo"%>
<%@page import="controlador.AccionesDEquipo"%>
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
<html>
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Maquinas</title>
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
            <a href="maquinasAdmin.jsp" class="selected">
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
            <a href="maquinasAdmin.jsp" class="selected">
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
        
        <%
            
            if(rol!=5){
        %>
        <main class="main_container">
            <h1>Maquinas</h1>
            <br>
            <table class="buscador">
                <tr>
                    <td>
                        <i class="fa-solid fa-magnifying-glass"></i>
                        <label>Buscar: </label>
                    </td>
                    <td><form method="get"><input type="text" placeholder="etiqueta, alumno, etc." size="30" name="q"></form></td>
                </tr>
            </table>
            <br>
            <table border="2" class="tabla_consulta">
            <thead>
                <tr>
                    <th style="padding: 0.2rem;">Etiqueta</th>
                    <th style="padding: 0.2rem;">Laboratorio</th>
                    <th style="padding: 0.2rem;">Marca</th>
                    <th style="padding: 0.2rem;">CPU</th>
                    <th style="padding: 0.2rem;">Descripción</th>
                    <th style="padding: 0.2rem;">Teclado</th>
                    <th style="padding: 0.2rem;">Mouse</th>
                    <th style="padding: 0.2rem;">Monitor</th>
                    <th style="padding: 0.2rem;">Configuración</th>
                    <th style="padding: 0.2rem;">Estado</th>
                    <th style="padding: 0.2rem;">Reportes</th>
                    <th style="padding: 0.2rem;">Eliminar</th>
                </tr>        
            </thead>
            <tbody>
                <%
                    
                    
                    String busqueda = request.getParameter("q");
                    
                    if(busqueda==null){
                        List<DEquipo> listaEq = AccionesDEquipo.getAllEquipos();
                        for(DEquipo e : listaEq){%>
                     <tr>
                        <td style="padding: 0.2rem;"><%=e.getEquipo_etiqueta()%></td>
                        <td style="padding: 0.2rem;"><%=e.getLab_nom()%></td>
                        <td style="padding: 0.2rem;"><%=e.getMarca_nom()%></td>
                        <td style="padding: 0.2rem;"><%=e.getCpu_serial()%></td>
                        <td style="padding: 0.2rem;"><%=e.getCpu_descripcion()%></td>
                        <td style="padding: 0.2rem;"><%=e.getConfig_descripcionTeclado()%></td>
                        <td style="padding: 0.2rem;"><%=e.getConfig_descripcionMause()%></td>
                        <td style="padding: 0.2rem;"><%=e.getMonitor_descripcion()%></td>
                        <td style="padding: 0.2rem;"><%=e.getConfig_descripcion()%></td>
                        <td style="padding: 0.2rem;"><%=e.getEdoEquipo_tipo()%></td>
                        <td style="padding: 0.2rem;"><a href="reportesMaquinas.jsp?equipo_etiqueta=<%=e.getEquipo_etiqueta()%>"><i class="fa-solid fa-address-book" style="font-size: 22px;"></i></a></td>
                        <td style="padding: 0.2rem;"><a href="eliminarMaquina?equipo_etiqueta=<%=e.getEquipo_etiqueta()%>"><i class="fa-solid fa-trash-can" style="font-size: 22px;"></i></a></td>
                    </tr>
                        
                    <%}}else{List<DEquipo> listaEq = AccionesDEquipo.getAllEquiposBusqueda(busqueda);
                        for(DEquipo e : listaEq ){%>
                    <tr>
                        <td style="padding: 0.2rem;"><%=e.getEquipo_etiqueta()%></td>
                        <td style="padding: 0.2rem;"><%=e.getLab_nom()%></td>
                        <td style="padding: 0.2rem;"><%=e.getMarca_nom()%></td>
                        <td style="padding: 0.2rem;"><%=e.getCpu_serial()%></td>
                        <td style="padding: 0.2rem;"><%=e.getCpu_descripcion()%></td>
                        <td style="padding: 0.2rem;"><%=e.getConfig_descripcionTeclado()%></td>
                        <td style="padding: 0.2rem;"><%=e.getConfig_descripcionMause()%></td>
                        <td style="padding: 0.2rem;"><%=e.getMonitor_descripcion()%></td>
                        <td style="padding: 0.2rem;"><%=e.getConfig_descripcion()%></td>
                        <td style="padding: 0.2rem;"><%=e.getEdoEquipo_tipo()%></td>
                        <td style="padding: 0.2rem;"><a href="reportesMaquinas.jsp?equipo_etiqueta=<%=e.getEquipo_etiqueta()%>"><i class="fa-solid fa-address-book" style="font-size: 22px;"></i></a></td>
                        <td style="padding: 0.2rem;"><a href="eliminarMaquina?equipo_etiqueta=<%=e.getEquipo_etiqueta()%>"><i class="fa-solid fa-trash-can" style="font-size: 22px;"></i></a></td>
                    </tr>
                    <%
                        }}
                    %>
            </tbody>
            </table>
            
        </main>
        <%
                    }
        %>
        
        
        <script src="JS/scriptC.js"></script>
    </body>
</html> 
<%
    }
%>

