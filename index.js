
     
$(document).ready(function() {
    $("#contenido").load("Login/login.html");
});

function menu(op){
    
    switch(op){
        case 1:
        //nueva cuenta
            $("#contenido").load("New/NewCuenta.html");
        break; 

        case 2:
            //login
            $("#contenido").load("Login/login.html");
            break;

        case 3:
            //info
            $("#contenido").load("Informacion/Informacion.php");
            break;
    }
}
        