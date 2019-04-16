


function menu(op){
    
    switch(op){
        case 1:
            //Cerrar sesion
            location.href='salir.php';
        break; 

        case 2:
            //Mi cuenta
            $("#contenido").load("Cuenta/Cuenta.php");
            break;

        case 3:
            //citas
            $("#contenido").load("Citas/Citas.php");
            break;
            
        case 4:
            //Recetas
            $("#contenido").load("Recetas/Recetas.php");
            break;
        
        case 5:
            //DOCTORES
            $("#contenido").load("Doctores/Doctores.php");
            break;   
            
    }
}