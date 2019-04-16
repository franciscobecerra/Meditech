function redireccionar(){
        
    var nick = document.getElementById("name").value;
    var pass = document.getElementById("pass").value;
        
    $.ajax({
            
        url:'Login/login.php',
        type:'POST',
        data:{nick:nick,pass:pass},
        
        success: function(datos){
            if(datos == "exito"){
                
                location.href="/Systema/footerSystema.html";
                
            }else{
                alert(datos);
                //$("#r").html(datos);
            }
        }
          
    })
} 