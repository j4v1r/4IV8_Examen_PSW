<%-- 
    Document   : sesioncerrada
    Created on : 19/06/2022, 02:45:01 PM
    Author     : Rogelio Colunga R
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true" %>
<%
    HttpSession sesion = request.getSession();
    sesion.invalidate();
    
    HttpSession sesionuser = request.getSession();
    sesionuser.invalidate();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Iniciar Sesion</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css">
    </head>
    <body class="inicioSe">
        <div class="inicios">
            <form action="iniciarSesion" method="post" class="iniciosesion" name="inicios">
                <table class="formulario">
                    <h1>Iniciar Sesión</h1>
                    <tr class="espacio"></tr>
                    <tr>
                        <td class="datoa">Usuario: </td>
                        <td><input type="text" id="usuariois" name="usuariois"></td>
                    </tr>
                    <tr class="espacio"></tr>
                    <tr>
                        <td class="datoa">Contraseña: </td>
                        <td><input type="password" id="contrais" name="contrais"></td>
                    </tr>
                    <tr class="espacio"></tr>
                    <tr>
                        <td class="boton1"><button type="button" onclick="location.href='registrarse.jsp'" class="button">Registrarse</button></td>
                        <td class="boton2"><button type="button" onclick="iniciarSesion()" class="button">Iniciar Sesión</button></td>
                    </tr>
                    <tr></tr>
                </table>
            </form>
        </div>
    </body>
    <script src="JS/validacion.js"></script>
</html>
