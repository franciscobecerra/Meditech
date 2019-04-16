
<?php

    $con = new mysqli("localhost","root","","MEDITECH");

    if($con -> connect_errno){
        echo "fallo al conectar";
    }


    if(isset($_POST["nick"])){
        
        $nick = $_POST["nick"];
        $name = $_POST["name"];
        $ap = $_POST["ap"];
        $am = $_POST["am"];
        $correo = $_POST["correo"];
        $tel = $_POST["tel"];
        $pass = $_POST["pass"];
        
        $sql = "INSERT INTO PACIENTES (UsuarioPaciente,Nombre,ApellidoPaterno,ApellidoMaterno,Telefono,Correo,Pass,Activo) VALUE ('$nick','$name','$ap','$am','$tel','$correo','$pass',1)";
        
        
        if (mysqli_query($con, $sql)) {
            
            echo '<script>
                alert("Cuenta creada exitosamente :)");
            </script>';
            
            header('Location:/index.html');
        } else {
            echo "Error: " . $sql . "<br>" . mysqli_error($con);
        }
        
        mysqli_close($con);
        
        
    }else{
        echo "algo salio mal";
    }
    
?>