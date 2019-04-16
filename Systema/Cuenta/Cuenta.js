    
function Actualizar1(){
	//alert("1");
    
    var nick = document.getElementById("nick").value;
    var pass = document.getElementById("pass").value;
    
    var name = document.getElementById("name").value;
    var ap = document.getElementById("ap").value;
    var am = document.getElementById("am").value;
    var tel = document.getElementById("tel").value;
    var correo = document.getElementById("correo").value;
    
        
    $.ajax({
            
        url:'Cuenta/Datos.php',
        type:'POST',
        data:{nick:nick,pass:pass,name:name,ap:ap,am:am,tel:tel,correo:correo},
        
        success: function(datos){
            if(datos == "exito"){
                alert("Datos modificados correctamente");
                location.href="footerSystema.html";
                
            }else{
                alert(datos);
            }
        }
          
    })
}
 

function Actualizar2(){
	//alert(2);
    
    var nick = document.getElementById("nick").value;
    var pass = document.getElementById("pass").value;
    
    var ciudad = document.getElementById("ciudad").value;
    var gen = document.getElementById("genero").value;
    var fnac = document.getElementById("fnac").value;
    var dir = document.getElementById("dir").value;
    var cp = document.getElementById("cp").value;
    var nseg = document.getElementById("nseg").value;
    

        
    $.ajax({
            
        url:'Cuenta/Datos.php',
        type:'POST',
        data:{nick:nick,pass:pass,ciudad:ciudad,gen:gen,fnac:fnac,dir:dir,cp:cp,nseg:nseg},
        
        success: function(datos){
            if(datos == "exito"){
                alert("Datos modificados correctamente");
                location.href="footerSystema.html";
                
            }else{
                alert(datos);
            }
        }
          
    })
}   
    