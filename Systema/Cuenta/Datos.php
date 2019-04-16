<?php

    if(isset($_POST["name"])){
        Modificar(1);
    }else{
        Modificar(2);
    }

    function Modificar($op){
        
        
        $nick = $_POST["nick"];
        $pass = $_POST["pass"];
        
        
        $con = new mysqli("localhost","root","","MEDITECH");
        
        if($op == 1){
            
            $name = $_POST["name"];
            $ap = $_POST["ap"];
            $am = $_POST["am"];
            $tel = $_POST["tel"];
            $correo = $_POST["correo"];
            
            
            $sql = "UPDATE PACIENTES SET Nombre = '$name', ApellidoPaterno = '$ap', ApellidoMaterno = '$am', Telefono = '$tel', Correo = '$correo' where UsuarioPaciente like '$nick' and Pass like '$pass'";
            

            
        }else{
            
            $ciudad = $_POST["ciudad"];
            $gen = $_POST["gen"];
            $fnac = $_POST["fnac"];
            $dir = $_POST["dir"];
            $cp = $_POST["cp"];
            $nseg = $_POST["nseg"];
            
            
            $sql = "UPDATE PACIENTES SET Ciudad = '$ciudad', Genero = '$gen', FechaNacimiento = '$fnac', Direccion = '$dir',CodigoPostal = '$cp', NumeroSeguridadSocial = '$nseg' where UsuarioPaciente like '$nick' and Pass like '$pass'";
            
        }

        $res = mysqli_query($con, $sql);
        
        if(!$res){
            echo "fail";
        }else{
            echo "exito";
        }
        
        
        mysqli_close($con);
    }
    
?>