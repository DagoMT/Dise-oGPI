<%-- 
    Document   : index
    Created on : 7/12/2013, 03:12:13 PM
    Author     : Rodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script> 
        <link rel="stylesheet" href="estilo1.css" /> 
        <title>Administrador</title>
        
        <script>
                 
    $(document).ready(function(){
    $("#Notific").click(function(){
         
        $("#Noti").toggle();
        $("#Crono").hide();
        $("#Evidenciaa").hide();
   
  });
    });
  
  $(document).ready(function(){
  $("#Cronogram").click(function(){
      
        $("#Crono").toggle();
        $("#Noti").hide();
        $("#Evidenciaa").hide();
        
   
  });
  
});

 $(document).ready(function(){
   $("#recibe").click(function(){
        $("#actual").toggle();
       
        
  });
   });
  
   $(document).ready(function(){
   $("#Evidencia").click(function(){
        $("#Evidenciaa").toggle();
         $("#Crono").hide();
        $("#Noti").hide();
        
  });
});

           function Notificacion(){
                
               var xmlhttp;
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("actual").innerHTML=xmlhttp.responseText;
    
    }
  }
xmlhttp.open("GET","Actualizar.jsp",true);
xmlhttp.send();
}


                        
     function Ver(){
                
     var xmlhttp;
            if (window.XMLHttpRequest)
        {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
        }
        else
  {// code for IE6, IE5
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
    xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("Crono").innerHTML=xmlhttp.responseText;
    
    }
  }
xmlhttp.open("GET","Aceptados.jsp",true);
xmlhttp.send();
}

           function paginaInit(){
                
               var xmlhttp;
        if (window.XMLHttpRequest)
                {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp=new XMLHttpRequest();
    }
    else
        {// code for IE6, IE5
            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
            xmlhttp.onreadystatechange=function()
        {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("CajaEvaluacion").innerHTML=xmlhttp.responseText;
    
    }
  }
xmlhttp.open("GET","EnEvaluacion.jsp",true);
xmlhttp.send();
}

     function paginaIni(){
                
               var xmlhttp;
        if (window.XMLHttpRequest)
                {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp=new XMLHttpRequest();
    }
    else
        {// code for IE6, IE5
            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
            xmlhttp.onreadystatechange=function()
        {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("CajaAceptados").innerHTML=xmlhttp.responseText;
    
    }
  }
xmlhttp.open("GET","Aceptados.jsp",true);
xmlhttp.send();
}


 function paginaI(){
                
               var xmlhttp;
        if (window.XMLHttpRequest)
                {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp=new XMLHttpRequest();
    }
    else
        {// code for IE6, IE5
            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
            xmlhttp.onreadystatechange=function()
        {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("CajaRechazados").innerHTML=xmlhttp.responseText;
    
    }
  }
xmlhttp.open("GET","Rechazados.jsp",true);
xmlhttp.send();
}
function Validando(data){
               if(data==""){
                   
                   return false;
               } 
               else return true;
           } 
            
           
           
              function SALVAR(){                
             
                user= Validando(document.SaveEvi.Nombre.value);
                pass= Validando(document.SaveEvi.Evidenci.value);

                
                if(user && pass){
                     alert("Tus datos seran verificados..");
                     document.registro.submit();
                }else{
                    alert("Los campos deben llenarse");
                    
                }
                
           }
           
        </script>
        
    </head>
    <body onload="paginaInit(), paginaIni(),  paginaI()">
        
       
        
        <p id="Barra"> Bienvenido </p>
        <div id="Bienvenido">
            
            
        </div>
        <div id="cajaAdmi">
            SISTEMA  DE INNOVACION EDUCATIVA E INVESTIGACION
        </div>
         
    <div id="cajaAzul">
        <div id="Rojo1"></div>
        <div id="actividades">
            <p id="TextAdmi">ADMINISTRADOR</p>
            <table border="1" class="tabl">
                <tr>
                
                
                <td><button id="Notific" value=""><img src="Imagenes/notific.png">Administrar</button></td>
                     
                </tr>
               
                <tr>
                    <td><button id="Cronogram" value="" onclick="Ver()"><img src="Imagenes/calendar.png">Ver Cronograma</button></td>
                </tr>
                <tr>
                    <td><button id="Evidencia" value="" ><img src="Imagenes/evide.png">Registro de Evidencias</button></td>
                </tr>
                
            </table>
        </div>
        
        <div id="Rojo2"></div>
       
        
    </div>
        <img id="logo" src="Imagenes/logo.png">
        <div id="Noti">
            <div id="Info">
                <button id="EnEvaluacion"><img src="Imagenes/Evaluar.png">En Evaluación</button>
                <div id="CajaEvaluacion">
                   
                </div>
                
            </div>
                  <button id="Aceptados" onclick=""><img src="Imagenes/aceptados.png">Aceptados</button>
                  <div id="CajaAceptados">
                   
                </div>
                  <button id="Rechazados" onclick=""><img src="Imagenes/NoAceptados.png">Rechazados</button>
                  <div id="CajaRechazados">
                   
                </div>
   
        </div>
        <div id="Crono">
            
        </div>
        
        <div id="Evidenciaa">
            <div>
                <form action="GuardarEvidencia.jsp" method="post" name="SaveEvi">
                <table>
                    
                     <p id="Hola">Escriba Evidencia</p>
                    <tr><td>Nombre:<input  name="Nombre" type="text"></td></tr>
               <tr><td> <textarea name="Evidenci" id="EscribirEvidencia">
               
                </textarea></td></tr>
              <input id="botton" type="button" onclick="SALVAR()" value="Guardar">
             </table>
                    </form>
            </div>
        </div>
        
    </body>
</html>
