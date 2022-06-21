/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function registrarUsuario(){
    
    var identificador = document.getElementById('identr').value;
    var nom = document.getElementById('nombrer').value;
    var appat = document.getElementById('appatr').value;
    var apmat = document.getElementById('apmatr').value;
    var usuario = document.getElementById('usuarior').value;
    var pass = document.getElementById('contrar').value;
    
    var letras = /^[a-zA-Z\s]*$/;
    var numeros = /^[0-9]+$/;
    
    if((nom=="")||(appat=="")||(apmat=="")||(usuario=="")||(pass=="")||(identificador=="")){
        
         alert("Debes llenar todos los campos");
         
    }else if((!(nom.match(letras))) || (!(appat.match(letras))) || (!(apmat.match(letras)))){
        
        alert("Introduzca únicamente letras en el nombre y apellidos");
        
    }else if((nom.length>50) || (appat.length>50) || (apmat.length>50) || (usuario.length>30) || (pass.length>34)){

        alert("Introduzca datos válidos");

    }else if(!(identificador.match(numeros))){

        alert("Introduzca únicamente números en la boleta/No. de Empleado");

    }else if( (identificador>2147483647) ){

        alert("Introduzca la boleta/No. de Empleado correctamente");

    }else{
        
        document.registro.submit();
    }
}

function iniciarSesion(){
    
    var usuario = document.getElementById('usuariois').value;
    var pass = document.getElementById('contrais').value;

    
    if((usuario=="")||(pass=="")){
        
         alert("Debes llenar todos los campos");
         
    }else if((usuario.length>30) || (pass.length>34)){

        alert("Introduzca datos válidos");
    
    }else{
        
        document.inicios.submit();
    }
   
}

function actualizarUsuario(){
    
    var identificador = document.getElementById('identificador').value;
    var nom = document.getElementById('nombre').value;
    var appat = document.getElementById('appat').value;
    var apmat = document.getElementById('apmat').value;
    var usuario = document.getElementById('user').value;
    var pass = document.getElementById('pass').value;
    
    var letras = /^[a-zA-Z\s]*$/;
    var numeros = /^[0-9]+$/;
    
    if((nom=="")||(appat=="")||(apmat=="")||(usuario=="")||(pass=="")||(identificador=="")){
        
         alert("Debes llenar todos los campos");
         
    }else if((!(nom.match(letras))) || (!(appat.match(letras))) || (!(apmat.match(letras)))){
        
        alert("Introduzca únicamente letras en el nombre y apellidos");
        
    }else if((nom.length>50) || (appat.length>50) || (apmat.length>50) || (usuario.length>30) || (pass.length>34)){

        alert("Introduzca datos válidos");

    }else if(!(identificador.match(numeros))){

        alert("Introduzca únicamente números en la boleta/No. de Empleado");

    }else if( !(identificador.length==10) || (identificador>2147483647) ){

        alert("Introduzca la boleta/No. de Empleado correctamente");

    }else{
        
        document.actualizaruser.submit();
    }
}

function editarReporte(){
    
    var problema = document.getElementById('descripcion').value;
    
    if(problema==""){
        
        alert("Llena todos los campos");
        
    }else if(problema.length>120){
        
        alert("La descripción del problema está permitida hasta 120 caracteres")
        
    }else{
        
        document.reporte.submit();
        
    }
    
}


function crearReporte(){
    
    var problema = document.getElementById('descripcion').value;
    
    if(problema==""){
        
        alert("Llena todos los campos");
        
    }else if(problema.length>120){
        
        alert("La descripción del problema está permitida hasta 120 caracteres")
        
    }else{
        
        document.reporte.submit();
        
    }
    
}

function registroMaquina(){
    
    var etiqueta = document.getElementById('etiqueta').value;
    
    if(etiqueta.length>30){
        
        alert("Introduce una etiqueta válida");
        
    }else if((etiqueta=="") || (etiqueta==" ")){
        
        alert("Introduce una eitqueta");
    
    }else{
        
        document.registrom.submit();
        
    }
    
}

function registroMarca(){
    
    var marca = document.getElementById('marca').value;
    
    if(marca==""){
        alert("Llene la marca");
    }else if(marca.length>20){
        alert("Introduzca una maquina válida");
    }else{
        document.marca.submit();
    }
    
}

