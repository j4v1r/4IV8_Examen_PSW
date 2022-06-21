<%-- 
    Document   : registroMaquina
    Created on : 5/06/2022, 02:25:27 AM
    Author     : Emmanuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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

            <a href="principal.jsp" class="selected">
                <div class="option">
                    <i class="fa-solid fa-house-chimney" title="Inicio"></i>
                    <h4>Inicio</h4>
                </div>
            </a>
            <a href="">
                <div class="option">
                    <i class="fa-solid fa-triangle-exclamation" title="Nuevo Reporte"></i>
                    <h4>Nuevo Reporte</h4>
                </div>
            </a>
            <a href="labnt.jsp">
                <div class="option">
                    <i class="fa-solid fa-desktop" title="LNT"></i>
                    <h4>Laboratorio de Nuevas Tecnologías</h4>
                </div>
            </a>
            <a href="labbd.jsp">
                <div class="option">
                    <i class="fa-solid fa-database" title="LBD"></i>
                    <h4>Laboratorio de Base de Datos</h4>
                </div>
            </a>
            <a href="labnt.jsp">
                <div class="option">
                    <i class="fa-solid fa-code" title="LDS"></i>
                    <h4>Laboratorio de Desarrollo de Software</h4>
                </div>
            </a>
            <a href="aula.jsp">
                <div class="option">
                    <i class="fa-solid fa-4" title="Aula 4.0"></i>
                    <h4>Aula 4.0</h4>
                </div>
            </a>
            <a href="#">
                <div class="option">
                    <i class="fa-solid fa-user" title="Perfil"></i>
                    <h4>Consultar Perfil</h4>
                </div>
            </a>
            <a href="#">
                <div class="option">
                    <i class="fa-solid fa-power-off" title="Salir"></i>
                    <h4>Salir</h4>
                </div>
            </a>

        </div>

    </div>

    <main>
        <h1>Registrar Máquina</h1>
        <br>
        <div class="form">
            <form action="">
                <table class="tform">
                    <tr>
                        <td><label>Laboratorio: </label></td>
                        <td>
                            <select id="sel-lab">
                                <option></option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label>Etiqueta Máquina: </label></td>
                        <td><input type="text" id="etiqueta" name="etiqueta" class="in1"></td>
                    </tr>
                    <tr>
                        <td><label>Boleta: </label></td>
                        <td><input type="text" id="bol" name="bol" class="in1"></td>
                    </tr>
                    <tr>
                        <td align="center"><input type="button" name="btn_1" id="btn_1" value="Registrar Nuevo Reporte" class="btn-1"></td>
                        <td align="center"><input type="reset" name="btn_2" id="btn_2" value="Cancelar" class="btn-2"></td>
                    </tr>
                </table>
                
            </form>
        </div>
    </main>

    <script src="JS/scriptC.js"></script>
</body>
</html>
