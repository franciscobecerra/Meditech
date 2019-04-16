<?php
    
    session_start();
    $nick = $_SESSION['nick'];

    if(isset($_SESSION['nick'])){
        
        
        $con = new mysqli("localhost","root","","MEDITECH");

        $sql = "select * from PACIENTES where UsuarioPaciente like '$nick'";

        $res = mysqli_query($con, $sql);

        
        
        $datos = mysqli_fetch_array($res);

        mysqli_close($con);
        
    }else{
        echo "primero hay que iniciar sesion!";
        die();
    }  
?>
  

<html>

	<head>

	 	<title>MediTech</title>
	 	<link rel="stylesheet" type="text/css" href="Cuenta.css">
	 	<script src="/jquery-3.3.1.js" type="text/javascript"></script>
	 	<script src="/Systema/Cuenta/Cuenta.js" type="text/javascript"></script>

	</head>
		<body>

			<div class="info-user">
				
				<img src="user.jpg" class="avatar" alt="Avatar Image">
                
				<div class="datos">
					<h1>Datos personales</h1>

						<table class="formulario-text">

			                <tr>
			                    <th><label for="Nombre">Nombre</label></th>
			                    <th><input type="text" id="name" value="<?php echo "$datos[4]";?>"/></th>
			                </tr>

			                 <tr>
			                    <th><label for="AP">A. Paterno</label></th>
			                    <th><input type="text" id="ap" value="<?php echo "$datos[5]";?>" /></th>
			                </tr>

			                 <tr>
			                    <th><label for="AM">A. Materno</label></th>
			                    <th><input type="text" id="am" value="<?php echo "$datos[6]";?>"/></th>
			                </tr>
                             
                             <tr>
			                    <th><label for="Telefono">Teléfono</label></th>
			                    <th><input type="text" id="tel" value="<?php echo "$datos[7]";?>"/></th>
			                </tr>

			                 <tr>
			                    <th><label for="Correo">Correo</label></th>
			                    <th><input type="text" id="correo" value="<?php echo "$datos[8]";?>"/></th>
			                </tr>
			                
			            </table>
				    
				    <input type="button" value="Actualizar información" onclick="Actualizar1()">

			    </div>

			</div>

			<div class="info-userExtra">

				<div class="datos">

					<h1>Información extra</h1>
					<table class="formulario-text">

			                <tr>
			                    <th><label for="Ciudad">Ciudad</label></th>
			                    <th><input type="text" id="ciudad" value="<?php echo "$datos[2]";?>"/></th>
			                </tr>

                            <tr>
			                    <th><label for="Genero">Género</label></th>
			                    <!--
			                    <th>
			                    	<select>
			                    		<option value="M"></option>
			                    		<option value="F"></option>
			                    	</select>
			                    </th>
			                    -->
			                    <th><input type="text" id="genero" value="<?php echo "$datos[3]";?>"/></th>
			                </tr>

                            <tr>
			                    <th><label for="Nacimiento">Fecha nacimiento</label></th>
			                    <th><input type="text" id="fnac" value="<?php echo "$datos[9]";?>"/></th>
			                </tr>

                            <tr>
			                    <th><label for="Direccion">Dirección</label></th>
			                    <th><input type="text" id="dir" value="<?php echo "$datos[10]";?>"/></th>
			                </tr> 

                            <tr>
			                    <th><label for="CP">Código Postal</label></th>
			                    <th><input type="text" id="cp" value="<?php echo "$datos[11]";?>"/></th>
			                </tr>

                            <tr>
			                    <th><label for="nseg">NSS</label></th>
			                    <th><input type="text" id="nseg" value="<?php echo "$datos[12]";?>"/></th>
			                </tr>

			           </table>

					<input type="button" value="Actualizar información" onclick="Actualizar2()">
					
					<input type="hidden" value="<?php echo "$datos[0]";?>" id="nick">
					<input type="hidden" value="<?php echo "$datos[1]";?>" id="pass">
					
				</div>
			</div>

	</body>

</html>


    
    
    
    
    
    
    
    
    
    