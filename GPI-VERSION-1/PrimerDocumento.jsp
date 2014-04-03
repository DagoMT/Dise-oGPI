<%-- 
    Document   : PrimerDocumento
    Created on : 12/12/2013, 06:22:28 PM
    Author     : Rodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            #cajaModeloo{
                color: black;
                width: 3300px;
                height: 933px;
                position: absolute;
                background: transparent;
                border: 1px solid #676767;
                display: hidden;
                overflow: auto;
            }
            select.selmenu {
                font-size: 17px;
                color: #676767;
                padding: 4px !important;
                border: 1px solid #aaa;
                width: 200px;
                    }
                    
                    #campo{
                        font-size: 17px;
                        color: #676767;
                        padding: 4px !important;
                        border: 1px solid #aaa;
                        width: 200px;
                    }
                    #CronogramaFull{
                        font-size: 18px;
                        color: black;
                        position: static;
                        
                    }
                    
                    #NotSeleccionado{
                            font-size: 17px;
                            color: #676767;
                            padding: 4px !important;
                            border: 1px solid #aaa;
                            width: 200px;
                    }
        </style>
        
        <script>
               function noVacio() { 
                    var i; 
                    var n = parseInt(document.ListCronograma.cantidad.value); 
                    var bError = false; 
 
                        for (i = 0; i < n; i++){ 
                         bError = bError || (eval("document.ListCronograma.name" + i + ".value == ''")); 
                            if (bError){ 
                              alert("Campo inválido"); 
                                eval("document.ListCronograma.Txt" + i + ".focus()"); 
                                break; 
                            } 
                            } 
                            if (!bError) 
                                document.ListCronograma.submit();
                                
                            } 
        </script>
    </head>
    <body>
       
        
            <%@page import="java.sql.*" %>
         
          <%
          String Name = request.getParameter("value");
                try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        //out.println("Voy hasta aquí 2");
        Connection conn=null;
        Statement stmt=null;
        ResultSet rst=null;
        String usu="root"; // usuario de la BD
        String passw=""; // password  de la BD
        //conectándose a la base de datos
        conn = DriverManager.getConnection("jdbc:mysql://localhost/gpi", usu, passw);
        stmt = conn.createStatement();
        rst = stmt.executeQuery("select * from maestro");
            
       %>
       <div id="cajaModeloo">
        <%
        
            boolean bandera = true;
        
            while(rst.next()){
                 
               
                String NombreProyecto= rst.getString("NombreProyecto");
                String Fecha = rst.getString("Fecha");
                String Folio = rst.getString("Folio");
                String SeaModelado = rst.getString("SeaModelado");
                String EstadoProyecto = rst.getString("EstadoDelProyecto");
                
                if(NombreProyecto.equals(Name)){
                   if(!EstadoProyecto.equals("null") ){ 
             
                
        %>
        <form name="ListCronograma" method="post" action="GuardarCronograma.jsp">
        <table style="margin-top: -2px; font-size: 22px;" border="2">
            <tr><td>Nombre del Proyecto:</td><td><%=NombreProyecto%></td></tr>
            <input style="display: none;" name="NombreProyecto" type="text" value="<%=NombreProyecto%>">
            <input style="display: none;" name="FechaInicio" type="text" value="<%=Fecha%>">
            <input style="display: none;" name="Folio" type="text" value="<%=Folio%>">
            <tr><td>Fecha de iniciación</td><td><%=Fecha%></td><td>Fecha de Terminación:<input id="campo" name="Txt0" type="text"></td><td>Numero de Folio:</td><td><%=Folio%></td>
            
            <tr><td>Participantes en el Proyecto</td><td>Categorias</td><td>Tiempo de Dedicación</td></tr>
            <tr><td><input id="campo" name="Txt1" type="text"></td><td><select id="recipient" name="par1" tabindex="6" class="selmenu">
  						<option value="Interno">Responsable</option>
  						<option value="Externo">Colaborador</option>
                                                <option value="Externo">Alumno</option>
  				</select> </td><td><select id="recipient" name="Hora1" tabindex="6" class="selmenu">
  						<option value="Interno">1 Hora</option>
  						<option value="Externo">2 Horas</option>
                                                <option value="Externo">3 a 5 Horas</option>
  				</select> </td></tr>
            
            
            <tr><td><input id="campo" name="Txt2" type="text"></td><td><select id="recipient" name="par2" tabindex="6" class="selmenu">
  						<option value="Interno">Responsable</option>
  						<option value="Externo">Colaborador</option>
                                                <option value="Externo">Alumno</option>
  				</select> </td><td> <select id="recipient" name="Hora2" tabindex="6" class="selmenu">
  						<option value="Interno">1 Hora</option>
                                                <option value="Externo">2 Horas</option>
                                                <option value="Externo">3 Horas</option>
  				</select> </td></tr>
            
            
            
            <tr><td><input id="campo" name="Txt3" type="text"></td><td><select id="recipient" name="par3" tabindex="6" class="selmenu">
  						<option value="Interno">Responsable</option>
  						<option value="Externo">Colaborador</option>
                                                <option value="Externo">Alumno</option>
  				</select>  </td><td><select id="recipient" name="Hora3" tabindex="6" class="selmenu">
  						<option value="Interno">1 Hora</option>
  						<option value="Externo">2 Horas</option>
                                                <option value="Externo">3 Horas</option>
  				</select> </td></tr>
            
            
            <tr><td><input id="campo" name="Txt4" type="text"></td><td><select id="recipient" name="par4" tabindex="6" class="selmenu">
  						<option value="Interno">Responsable</option>
  						<option value="Externo">Colaborador</option>
                                                <option value="Externo">Alumno</option>
  				</select>  </td><td><select id="recipient" name="hora4" tabindex="6" class="selmenu">
  						<option value="Interno">1 Hora</option>
  						<option value="Externo">2 Horas</option>
                                                <option value="Externo">3 a 5 Horas</option>
  				</select></td></tr>
            
            
            <tr><td><input id="campo" name="Txt5" type="text"></td><td><select id="recipient" name="par5" tabindex="6" class="selmenu">
  						<option value="Interno">Responsable</option>
  						<option value="Externo">Colaborador</option>
                                                <option value="Externo">Alumno</option>
  				</select>  </td><td><select id="recipient" name="hora5" tabindex="6" class="selmenu">
  						<option value="Interno">1 hora</option>
  						<option value="Externo">2 horas</option>
                                                <option value="Externo">3 a 5 horas</option>
  				</select> </td></tr>
            <tr><td>Fuentes de Financiamiento:<input name="Txt6" id="campo" type="text"></td></tr>
            <tr><td>Producción relacionada con</td></tr>
            <tr><td>Tesis nivel :</td><td><select id="recipient" name="NivelTesis" tabindex="6" class="selmenu">
  						<option value="Interno">Licenciatura</option>
  						<option value="Externo">Maestría</option>
                                                <option value="Externo">Doctorado</option>
                    </select> </td><td><select id="recipient" name="NivelTesis2" tabindex="6" class="selmenu">
  						<option value="Interno">Patentes</option>
  						<option value="Externo">Prototipo</option>
                                                <option value="Externo">Proyecto con la industria</option>
                    </select>   </td></tr>
            
           
        </table>
            <div>
                <table border="2">
                    <tr><td><p id="CronogramaFull">CRONOGRAMA POR SEMESTRES</p></td></tr>
                     <tr><td><input type="text"></td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td></tr>
                     <tr><td><p><input type="text"></p></td><td><select id="recipient" name="Nivel1" tabindex="6" ><option value="Interno">Vacio</option><option value="Externo">Marcado</option></select></td><td><select id="recipient" name="Nivel2" tabindex="6" ><option value="Interno">Vacio</option><option value="Externo">Marcado</option></select></td><td><select id="recipient" name="Nivel3" tabindex="6" ><option value="Interno">Vacio</option><option value="Externo">Marcado</option></select></td><td><select id="recipient" name="Nivel4" tabindex="6" ><option value="Interno">Vacio</option><option value="Externo">Marcado</option></select></td><td><select id="recipient" name="Nivel5" tabindex="6" ><option value="Interno">Vacio</option><option value="Externo">Marcado</option></select></td><td><select id="recipient" name="Nivel6" tabindex="6" ><option value="Interno">Vacio</option><option value="Externo">Marcado</option></select></td></tr>
                     <tr><td><p><input type="text"></p></td><td><select id="recipient" name="Nivel7" tabindex="6" ><option value="Interno">Vacio</option><option value="Externo">Marcado</option></select></td><td><select id="recipient" name="Nivel8" tabindex="6" ><option value="Interno">Vacio</option><option value="Externo">Marcado</option></select></td><td><select id="recipient" name="Nivel9" tabindex="6" ><option value="Interno">Vacio</option><option value="Externo">Marcado</option></select></td><td><select id="recipient" name="Nivel10" tabindex="6" ><option value="Interno">Vacio</option><option value="Externo">Marcado</option></select></td><td><select id="recipient" name="Nivel11" tabindex="6" ><option value="Interno">Vacio</option><option value="Externo">Marcado</option></select></td><td><select id="recipient" name="Nivel12" tabindex="6" ><option value="Interno">Vacio</option><option value="Externo">Marcado</option></select></td></tr>
                      <tr><td><p><input type="text"></p></td><td><select id="recipient" name="Nivel13" tabindex="6" ><option value="Interno">Vacio</option><option value="Externo">Marcado</option></select></td><td><select id="recipient" name="Nivel14" tabindex="6" ><option value="Interno">Vacio</option><option value="Externo">Marcado</option></select></td><td><select id="recipient" name="Nivel15" tabindex="6" ><option value="Interno">Vacio</option><option value="Externo">Marcado</option></select></td><td><select id="recipient" name="Nivel16" tabindex="6" ><option value="Interno">Vacio</option><option value="Externo">Marcado</option></select></td><td><select id="recipient" name="Nivel17" tabindex="6" ><option value="Interno">Vacio</option><option value="Externo">Marcado</option></select></td><td><select id="recipient" name="Nivel18" tabindex="6" ><option value="Interno">Vacio</option><option value="Externo">Marcado</option></select></td></tr>
                       <tr><td><p><input type="text"></p></td><td><select id="recipient" name="Nivel19" tabindex="6" ><option value="Interno">Vacio</option><option value="Externo">Marcado</option></select></td><td><select id="recipient" name="Nivel20" tabindex="6" ><option value="Interno">Vacio</option><option value="Externo">Marcado</option></select></td><td><select id="recipient" name="Nivel21" tabindex="6" ><option value="Interno">Vacio</option><option value="Externo">Marcado</option></select></td><td><select id="recipient" name="Nivel22" tabindex="6" ><option value="Interno">Vacio</option><option value="Externo">Marcado</option></select></td><td><select id="recipient" name="Nivel23" tabindex="6" ><option value="Interno">Vacio</option><option value="Externo">Marcado</option></select></td><td><select id="recipient" name="Nivel24" tabindex="6" ><option value="Interno">Vacio</option><option value="Externo">Marcado</option></select></td></tr>
                        <tr><td><p><input type="text"></p></td><td><select id="recipient" name="Nivel25" tabindex="6" ><option value="Interno">Vacio</option><option value="Externo">Marcado</option></select></td><td><select id="recipient" name="Nivel26" tabindex="6" ><option value="Interno">Vacio</option><option value="Externo">Marcado</option></select></td><td><select id="recipient" name="Nivel27" tabindex="6" ><option value="Interno">Vacio</option><option value="Externo">Marcado</option></select></td><td><select id="recipient" name="Nivel28" tabindex="6" ><option value="Interno">Vacio</option><option value="Externo">Marcado</option></select></td><td><select id="recipient" name="Nivel29" tabindex="6" ><option value="Interno">Vacio</option><option value="Externo">Marcado</option></select></td><td><select id="recipient" name="Nivel30" tabindex="6" ><option value="Interno">Vacio</option><option value="Externo">Marcado</option></select></td></tr>
                
                       
                
                </table>
                <table border="2">
                        <tr><td>TIPO DE PUBLICACIÓN PROYECTADA</td></tr>
                        <tr><td>Artículo cientifico</td><td>Divulgación<td>Memorias de Congreso</td><td>Tesis</td><td>Otra(Especificar)</td></tr>
                        <tr><td><input name="Txt7" type="text"></td><td><input name="Txt8" type="text"><td><input name="Txt9" type="text"></td><td><input name="Txt10" type="text"></td><td><input name="Txt11" type="text"></td></tr>
                        <tr><td><input style="font-size: 22px; border: 2px solid darkslategray; background: transparent" type="submit" onclick="noVacio()" value="GUARDAR"></td></tr>
                </table>
                
            </div>
            </form>
                    
                <%
                               
                         
                                              }else{
                                     
                             
                             %>
                             <h1>Espere</h1> 
 <p style="margin-left: 100px; margin-top: 50px; font-size: 18px;">
 <img src="Imagenes/Evaluar.png">que el administrador realice la evaluación de su proyecto</p>
 
                             
                    <%
                                     
                                              
                                              }
                   }
                  }
                  %>
       </div>
        
       
        <%
                    
      
                
                
            
          conn.close();
               }catch(Exception e){
                   out.println("Error en: "+ e.getMessage());
               }  
          %>
       
       
    </body>
</html>
