<%-- 
    Document   : Maestro
    Created on : 11/12/2013, 01:31:42 PM
    Author     : Rodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
        <link rel="stylesheet" href="EstiloAlumno.css" /> 
        <title>Docentes</title>
        
        
        
          <script> 
              
              
    $(document).ready(function(){
    $("#Notific").click(function(){
         
        $("#Noti").toggle();
        $("#Crono").hide();
        $("#VerProyectos").hide();
   
    });
  
   $("#Cronogram").click(function(){
        $("#Crono").toggle();
        $("#Noti").hide();
        $("#VerProyectos").hide();
   
  });
  
     $("#VerProyec").click(function(){
        $("#VerProyectos").toggle();
        $("#Noti").hide();
        $("#Crono").hide();
   
    });
  
   });
              
                function noVacio() { 
                    var i; 
                    var n = parseInt(document.requisitos.cantidad.value); 
                    var bError = false; 
                    
                        for (i = 0; i < n; i++){ 
                         bError = bError || (eval("document.requisitos.name" + i + ".value == ''")); 
                            if (bError){
                               
                                alert("Campo inválido"); 
                                eval("document.requisitos.name" + i + ".focus()"); 
                                break; 
                            } 
                            } 
                            if (!bError) 
                            document.requisitos.submit();
                                
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
    document.getElementById("VerProyectos").innerHTML=xmlhttp.responseText;
    
    }
  }
xmlhttp.open("GET","VerProyectos.jsp",true);
xmlhttp.send();
}




function busca(){
                var xmlhttp;
                
                if (window.XMLHttpRequest){
                    // code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp=new XMLHttpRequest();
                }else{
                    // code for IE6, IE5
                    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                }
                
                xmlhttp.onreadystatechange = function(){ //json
                    if (xmlhttp.readyState==4 && xmlhttp.status==200){
                        document.getElementById("DesplegarBusqueda").innerHTML=xmlhttp.responseText;
                    }
                }
                //send a request to a server
                //var valor;
                
                var x= document.getElementById("Buscar").value;
                xmlhttp.open("GET","busca_consulta_de_proyectos.jsp?value="+x,true);
                xmlhttp.send();
            }



 
    </script> 
    </head>
    <body>
           
        
        <p id="Barra"> Bienvenido </p>
        <div id="Bienvenido">
            
            
        </div>
        <div id="cajaAdmi">
            SISTEMA  DE INNOVACION EDUCATIVA E INVESTIGACION
        </div>
         
        <div id="cajaAzul">
        <div id="Rojo1"></div>
        <div id="actividades">
             <p id="TextAdmi">MAESTRO</p>
             <div id="tabla">
             <table >
                <tr>
                
                <td><button id="Notific" value=""><img src="Imagenes/notific.png">Registrar Proyecto</button></td>
                     
                </tr>
               
                <tr>
                    <td><button name="Doc. Juan Carlos" id="Cronogram" value="" onclick="ModProjec()"><img src="Imagenes/calendar.png">Modelar Proyectos</button></td>
                </tr>
                <tr>
                    <td><button id="VerProyec" value="" onclick=""><img src="Imagenes/projects.png">Registro De Evidencias</button></td>
                </tr>
                
            </table>
             </div>
        </div>
  
        <div id="Rojo2"></div>
        </div>
        <img id="logo" src="Imagenes/logo.png">
        
        <div id="Noti" >
            
     <section id="container">
         <script > 
var mydate=new Date() 
var year=mydate.getYear() 
if (year < 1000) 
year+=1900 
var day=mydate.getDay() 
var month=mydate.getMonth() 
var daym=mydate.getDate() 
if (daym<10) 
daym="0"+daym 
var dayarray=new Array("Domingo,","Lunes,","Martes,","Miércoles,","Jueves,","Viernes,","Sábado,")
var montharray=new Array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre")
//document.write("<font color='black' face='Georgia' style='font-size:8pt'>"+dayarray[day]+" "+daym+" de "+montharray[month]+" de "+year+"</font>") 
var fecha = dayarray[day]+" "+daym+" de "+montharray[month]+" de "+year;
document.write("<font color='black' face='Georgia' style='font-size:8pt'>"+fecha+"</font>")
</script>
		<h2>Formato de Registro del Proyecto</h2>
                
		
                <br><br>
                
		<form name="requisitos" id="hongkiat-form"  method="post" action="GuardarRequisitosMaestro.jsp">
                    <h4>Datos Generales</h4>
                    <section id="recipientcase">
                                
				<h3>Proyecto con Financiamiento:</h3>
				<select id="recipient" name="Financiamiento" tabindex="6" class="selmenu">
  						<option value="Interno">Interno</option>
  						<option value="Externo">Externo</option>
  				</select>
                                </section>
                    <br>
                    <br>
		<div id="wrapping" class="clearfix">
			<section id="aligned">
                        <input type="text" name="NombreProyecto" id="name" placeholder="Nombre del Proyecto" class="txtinput">
			<input type="text" name="name0" id="name" placeholder="Nombre del solicitante"  tabindex="1" class="txtinput">
			<p>Nombre o Razón social</p>
                        <input type="text" name="name1" id="name" placeholder="Nombre del Responsable Técnico"  tabindex="1" class="txtinput">
                         <input type="email" name="name2" id="email" placeholder="Correo Electronico del responsable" tabindex="2" class="txtinput">
                         <p>Domicilo, calle, numero y colonia</p>
                        <input type="text" name="name3" id="name" placeholder="Dirección" tabindex="1" class="txtinput">
                        <input type="text" name="name4" id="name" placeholder="Estado"  tabindex="1" class="txtinput">
			<input type="text" name="name5" id="name" placeholder="Municipio"  tabindex="1" class="txtinput">
			<input type="text" name="name6" id="name" placeholder="Pais"  tabindex="1" class="txtinput">
			<input type="text" name="name7" id="name" placeholder="Código Postal"  tabindex="1" class="txtinput">
			<input type="tel" name="name8" id="telephone" placeholder="Número de Telefono" tabindex="4" class="txtinput">
			<input type="email" name="name9" id="email" placeholder="Correo Electronico"  tabindex="2" class="txtinput">
                        <input type="hidden" name="cantidad" value="11"> 
                        <input type="text" name="n" id="name" placeholder="Fax"  tabindex="1" class="txtinput">
			
                       
			
                        <p> Breve descripción del proyecto: (Describa el objetivo, plazo, num. de participantes docentes y alumnos así como importe total del proyecto)				
				
</p>
                        <textarea name="name10" id="message" placeholder="Descripción del proyecto" tabindex="5" class="txtblock"></textarea>
			</section>
                        
			<section id="aside" class="clearfix">
				
				
			</section>
            		</div>
	<section id="buttons">
			<input type="reset" name="reset" id="resetbtn" class="resetbtn" value="Limpiar Campos">
                        <input type="submit" id="submitbtn" class="submit" onclick="noVacio()" value="Enviar">
			<br style="clear:both;">
		</section>
		</form>
	</section>
            <div id="hecho"></div>
        </div>        
       
        <div id="Crono">
            <script>
                document.write("<font color='black' face='Georgia' style='font-size:8pt'>"+fecha+"</font>")
            </script>
            <p></p><br>
            <p>Recuerda que podras modelar una sola vez por proyecto</p>
            <h2>Modelo de Proyectos en Linea</h2>
            <h3>Buscar Proyecto : <input id="Buscar" type="text" onkeyup="busca()"></h3>
            
            <div id="DesplegarBusqueda"> </div>
            
        </div>
        <div id="VerProyectos">
            <h2>Registro de Evidencias</h2>
            <h3>Buscar Proyecto: <input type="text" id="BuscaProyecto"></h3>
            <div>
                <p>Busqueda de actividades</p>
                <select>
                    
                </select>
                <p>Describe evidencia</p>
                <textarea>
                    
                </textarea>
                <input type="button" value="Adjuntar">
                <input type="button" value="Enviar">
            </div>
        </div>
    </body>
</html>
