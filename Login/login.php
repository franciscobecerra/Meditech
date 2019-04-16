<?php

    if(isset($_POST["nick"])){

        $nick = $_POST["nick"];
        $pass = $_POST["pass"];

        $con = new mysqli("localhost","root","","MEDITECH");

        $sql = "select UsuarioPaciente,pass from PACIENTES where UsuarioPaciente like '$nick' and Pass like '$pass'";

        $res = mysqli_query($con, $sql);

        if($res -> num_rows > 0)
        {    
            session_start();
        
            $_SESSION['nick'] = $nick;
            
            echo 'exito';
        }else{
            echo "el usuario o la contrasena no coinciden";
        }

        mysqli_close($con);
    }
    
?>