    <%-- 
    Document   : registrarCosas
    Created on : 20/06/2022, 02:53:50 PM
    Author     : Alumno
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
    <title>Agregar Elementos</title>
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
        <h1>Registrar Elementos</h1>
        <br>
        <div class="form">
            <form action="guardarMarca" method="post" name="marca">
                <table class="tform">
                    <tr>
                        <td><label>Marca: </label></td>
                        <td><input type="text" id="marca" name="marca" class="in1"></td>
                    </tr>
                    <tr>
                        <td align="center"><input type="submit"  name="btn_1" id="btn_1" value="Registrar Marca" class="btn-1"></td>
                    </tr>
                </table>
            </form>
        </div>
        <div class="form">
            <form action="guardarCPU" method="post" name="registrom">
                <table class="tform">
                    <tr>
                        <td><label>CPU: </label></td>
                        <td><input type="text" id="marca" name="cpu1" class="in1" ></td>
                    </tr>
                    <tr>
                        <td><label>Descripción CPU: </label></td>
                        <td><input type="text" id="marca" name="cpu2" class="in1" ></td>
                    </tr>
                    <tr>
                        <td align="center"><input type="submit"  name="btn_1" id="btn_1" value="Registrar CPU" class="btn-1"></td>
                    </tr>
                </table>
            </form>
        </div>
        <div class="form">
            <form action="guardarAccesorio" method="post" name="registrom">
                <table class="tform">
                    <tr>
                        <td><label>Teclado: </label></td>
                        <td><input type="text" id="marca" name="teclado" class="in1" ></td>
                    </tr>
                    <tr>
                        <td><label>Mouse: </label></td>
                        <td><input type="text" id="marca" name="mouse" class="in1" ></td>
                    </tr>
                    <tr>
                        <td align="center"><input type="submit"  name="btn_1" id="btn_1" value="Registrar Accesorios" class="btn-1"></td>
                    </tr>
                </table>
            </form>
        </div>
        <div class="form">
            <form action="guardarMonitor" method="post" name="registrom">
                <table class="tform">
                    <tr>
                        <td><label>ID Monitor: </label></td>
                        <td><input type="text" id="marca" name="monitorid" class="in1" ></td>
                    </tr>
                    <tr>
                        <td><label>Monitor descripción: </label></td>
                        <td><input type="text" id="marca" name="monitor" class="in1" ></td>
                    </tr>
                    <tr>
                        <td align="center"><input type="submit"  name="btn_1" id="btn_1" value="Registrar Monitor" class="btn-1"></td>
                    </tr>
                </table>
            </form>
        </div>
        <div class="form">
            <form action="guardarConfig" method="post" name="registrom">
                <table class="tform">
                    <tr>
                        <td><label>ID Configuración: </label></td>
                        <td><input type="text" id="marca" name="configid" class="in1" ></td>
                    </tr>
                    <tr>
                        <td><label>Configuración descripción: </label></td>
                        <td><input type="text" id="marca" name="config" class="in1" ></td>
                    </tr>
                    <tr>
                        <td align="center"><input type="submit"  name="btn_1" id="btn_1" value="Registrar Configuración" class="btn-1"></td>
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
