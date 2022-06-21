<%-- 
    Document   : iniciarS
    Created on : 4/06/2022, 11:25:35 PM
    Author     : Emmanuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <td><input type="password" id="contrais" name="contrais" required></td>
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