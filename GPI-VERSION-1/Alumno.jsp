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
        <link rel="stylesheet" href="EstiloAlumno.css" /> 
        <title>Alumno</title>
        
        <script>
                 
    $(document).ready(function(){
    $("#Notific").click(function(){
         
        $("#Noti").toggle();
        $("#Crono").hiden();
   
  });
  
   $("#Cronogram").click(function(){
        $("#Crono").toggle();
        $("#Noti").hiden();
   
  });
  
  
});
        </script>
    <script> 
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
             <p id="TextAdmi">ALUMNO</p>
            <table>
                <tr>
                
                
                <td><button id="Notific" value=""><img src="Imagenes/notific.png">Registrar Proyecto</button></td>
                     
                </tr>
               
                <tr>
                    <td><button id="Cronogram" value=""><img src="Imagenes/calendar.png">Modelar Proyecto</button></td>
                </tr>
               
                
            </table>
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
                
		<form name="requisitos" id="hongkiat-form" method="post" action="GuardarRequisitos.jsp">
                    
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
			<input type="text" name="name0" id="name" placeholder="Nombre del solicitante" autocomplete="off" tabindex="1" class="txtinput">
			<input type="text" name="name1" id="name" placeholder="Nombre del Responsable Técnico" autocomplete="off" tabindex="1" class="txtinput">
                        <input type="text" name="name2" id="name" placeholder="Dirección" autocomplete="off" tabindex="1" class="txtinput">
                        <input type="text" name="name3" id="name" placeholder="Estado" autocomplete="off" tabindex="1" class="txtinput">
			<input type="text" name="name4" id="name" placeholder="Municipio" autocomplete="off" tabindex="1" class="txtinput">
			<input type="text" name="name5" id="name" placeholder="Pais" autocomplete="off" tabindex="1" class="txtinput">
			<input type="text" name="name6" id="name" placeholder="Código Postal" autocomplete="off" tabindex="1" class="txtinput">
			<input type="tel" name="name7" id="telephone" placeholder="Número de Telefono" tabindex="4" class="txtinput">
			<input type="text" name="n" id="name" placeholder="Fax" autocomplete="off" tabindex="1" class="txtinput">
			<input type="email" name="name9" id="email" placeholder="Correo Electronico" autocomplete="off" tabindex="2" class="txtinput">
                        <input type="email" name="name10" id="email" placeholder="Correo Electronico del responsable" autocomplete="off" tabindex="2" class="txtinput">
			<input type="hidden" name="cantidad" value="12"> 
                        <textarea name="name11" id="message" placeholder="Descripción del proyecto" tabindex="5" class="txtblock"></textarea>
			</section>
			<section id="aside" class="clearfix">
				
				
			</section>
            		</div>
	<section id="buttons">
			<input type="reset" name="reset" id="resetbtn" class="resetbtn" value="Limpiar Campos">
                        <input type="submit" name="submit" id="submitbtn" class="submitbtn" tabindex="7" value="Enviar Datos" onclick="noVacio()">
			<br style="clear:both;">
		</section>
		</form>
	</section>
          
        </div>        
       
        <div id="Crono">
             <p id="TexRegistra">REGISTRA FECHA Y COMENTARIOS SOBRE TU PROYECTO</p>
            
            <form action="ChecarProjecAlumno.jsp" method="post" name="resistra">
                <table style="position: absolute; margin-top: 40px" id="ta">   
                    <tr><td>Año<input name="ano" type="text" list="anio"></td>
                    <td> Dia<input name="dia" type="text" list="day"></td>
                    <td> Mes<input name ="mes" type="text" list="mes"></td><tr>
                    <td><textarea id="areaTex" name="comentario">
                
                            </textarea></td></tr>
                    <tr><td><input id="btnTex" type="submit" value="Enviar"></td></tr>
                    <tr><td><input id="btnAbjuntar" type="button" value="Abjuntar Archivo"></td></tr>
           </table>
                </form>
            
            
            
            
            
             <datalist id=anio>
                                <option> 2013
                                <option> 2014
                                <option> 2015
                                <option> 2016
                                </datalist>
                            
                               <datalist id=day >
                                <option> 1
                                <option> 2
                                <option> 3
                                <option> 4
                                <option> 5
                                <option> 6
                                <option> 7
                                <option> 8
                                <option> 9
                                <option> 10
                                <option> 11
                                <option> 12
                                <option> 13
                                <option> 14
                                <option> 15
                                <option> 16
                                <option> 17
                                <option> 18
                                <option> 19
                                <option> 20
                                <option> 21
                                <option> 22
                                <option> 23
                                <option> 24
                                <option> 25
                                <option> 26
                                <option> 27
                                <option> 28
                                <option> 29
                                <option> 30
                                <option> 31
                                </datalist>
                            
                            
                               <datalist id=mes >
                                <option> Enero
                                <option> Febrero
                                <option> Marzo
                                <option> Abril
                                <option> Mayo
                                <option> Junio
                                <option> Julio
                                <option> Agosto
                                <option> Septiembre
                                <option> Octubre
                                <option> Noviembre
                                <option> Diciembre
                                </datalist>
        </div>

    </body>
</html>
