<%-- 
    Document   : VisualizacionProyectos
    Created on : 11/12/2013, 03:17:57 PM
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
        $("#Crono").hiden();
   
  });
    });
  
  $(document).ready(function(){
   $("#Cronogram").click(function(){
        $("#Crono").toggle();
        $("#Noti").hiden();
   
  });
  
});

 $(document).ready(function(){
   $("#recibe").click(function(){
        $("#actual").slideToggle();
        
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
    document.getElementById("actual").innerHTML=xmlhttp.responseText;
    
    }
  }
xmlhttp.open("GET","Actualizar.jsp",true);
xmlhttp.send();
}


function Validando(data){
               if(data==""){
                   
                   return false;
               } 
               else return true;
           } 
            
           
           
              function Enviar(){                
             
                Foolio = Validando(document.Folio.folio.value);
                

                
                if(Foolio){
                     
                     document.Folio.submit();
                }else{
                    alert("Debes asignar un folio");
                    
                }
                
           }
           
        </script>
        
    </head>
    <body onload="paginaInit()">
        
        
            <%@page import="java.sql.*" %>
         
          <%
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
        <div id="cajaAzul">
        <div id="Rojo1"></div>
        <div id="Visualizar">  
        <%
        String name = request.getParameter("name");
        boolean bandera = true;
            while(rst.next() && bandera==true){
                 
                String Financiamiento = rst.getString("Financiamiento");
                String NombreDelProyecto = rst.getString("NombreProyecto");
                
                
                
                if(NombreDelProyecto.equals(name)){
                    bandera=false;
                String Responsable = rst.getString("Responsable");
                String Nombre = rst.getString("Nombre");
                String EmailResponsable = rst.getString("EmailResponsable");
                String Domicilio = rst.getString("Domicilio");
                String Estado = rst.getString("Estado");
                String Municipio = rst.getString("Municipio");
                String Pais = rst.getString("Pais");
                String CodigoPostal = rst.getString("CodigoPostal");
                String Telefono = rst.getString("Telefono");
                String Fax = rst.getString("Fax");
                String Email = rst.getString("Email");
                String Descripcion = rst.getString("Descripcion");
                String Fecha = rst.getString("Fecha");
                
        %>
        <form method="post" action="Aceptando.jsp" name="Folio">
        <table style="margin-top: -2px">
            <tr><td>Nombre del Proyecto: </td><td><%=NombreDelProyecto%></td></tr>
                    <tr><td>Nombre:</td><td><%=Nombre%></td></tr>
                        <tr><td>Fecha: </td><td><%=Fecha%></td></tr>
                        <tr><td>Responsabel: </td><td><%=Responsable%></td></tr>
                        <tr><td>Email: </td><td><%=Email%></td></tr>
                        <tr><td>Domicilio: </td><td><%=Domicilio%></td></tr>
                        <tr><td>Estado: </td><td><%=Estado%></td></tr>
                        <tr><td>Municipio: </td><td><%=Municipio%></td></tr>
                        <tr><td>Pais :</td><td><%=Pais%></td></tr>
                        <tr><td>Codigo Postal: </td><td><%=CodigoPostal%></td></tr>
                        <tr><td>Telefono:</td><td><%=Telefono%></td></tr>
                        <tr><td>Fax:</td><td><%=Fax%></td></tr>
                        <tr><td>Email del Responsable :</td><td><%=EmailResponsable%></td></tr>
                        <tr><td>Descripción: </td><td><%=Descripcion%></td></tr>
                        <tr><td><input id="btnAcepta" onclick="Enviar()" value="Aceptar"></td><td></tr>
                        <tr><td><input type="text" name="NombreProyecto" style="display: none" value="<%=NombreDelProyecto%>"></td>
                        <tr><td><input type="text" name="Aceptar" style="display: none" value="true"></td>
                        <td>Asignar Folio:<input name="folio" type="text" value=""></td></tr>
                        
                                                                                                            
                                                                                                           
        </table>            
                     </form> 
                        <form method="post" action="Rechazando.jsp">
                            <button id="btnRechaza" type="submit">Cancelar</button> 
                            <input type="text" name="NombreProyecto" style="display: none" value="<%=NombreDelProyecto%>">
                            <input type="text" name="Rechazo" style="display: none" value="false">
                        </form>
                <%
          
                               }else{
                             
                               }
                  }
                  %>
                  </div>
        
        
        <div id="Rojo2"></div>
       
        
    </div>
       
        <%
                    
      
                
                
            
          conn.close();
               }catch(Exception e){
                  
               }  
          %>
       
        
        <p id="Barra"> Bienvenido </p>
        <div id="Bienvenido">
            
            
        </div>
        <div id="cajaAdmi">
            SISTEMA  DE INNOVACION EDUCATIVA E INVESTIGACION
        </div>
         
   
        <img id="logo" src="Imagenes/logo.png">
        
        
    </body>
</html>
