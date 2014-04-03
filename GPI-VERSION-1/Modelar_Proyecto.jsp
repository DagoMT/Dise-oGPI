<%-- 
    Document   : Modelar_Proyecto
    Created on : 12/12/2013, 05:23:56 PM
    Author     : Rodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
        <link rel="stylesheet" href="EstiloAlumno.css" /> 
        <title>Modelar Proyecto</title>
        
        <script>
    
    $(document).ready(function(){
    $("#Verdate").click(function(){
         
        $("#cajaDatos").toggle();
        $("#cajaModelo").hide();
        
   
    });
            });
            
    $(document).ready(function(){
    $("#Modelo").click(function(){
         
        $("#cajaModelo").toggle();
        $("#cajaDatos").hide();
        
   
    });
            });
            



function ModelarProyecto(){
                
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
    document.getElementById("cajaModelo").innerHTML=xmlhttp.responseText;
    
    }
  }
    var x = document.getElementById("Modelo").value;
           
xmlhttp.open("GET","PrimerDocumento.jsp?value="+x,true);
xmlhttp.send();
}
        </script>
    </head>
    <body>
        <%
        String NameProject = request.getParameter("NameProject");
        %>
        <div id="volver"><a href="Maestro.jsp"><img src="Imagenes/volver.png"></a> </div>
         <p id="Barra"> Bienvenido </p>
        <div id="Bienvenido">
            
            
        </div>
        <div id="cajaAdmi">
            SISTEMA  DE INNOVACION EDUCATIVA E INVESTIGACION
        </div>
         
        <div id="cajaAzul">
        <div id="Rojo1"></div>
        
        <div id="MenuFull">
            <button id="Verdate"><img src="Imagenes/textImg.png">Ver Datos</button>
            <button id="Modelo" value="<%=NameProject%>" onclick="ModelarProyecto()"><img src="Imagenes/ModImg.png">Modelar Proyecto</button>
          
        </div>
        <div id="tituloFull">
            <p><%=NameProject%></p>
        </div>
        <div id="cajaModelo">
            <table>
                <tr><td></td></tr>
            </table>
        </div>
        
  
        <div id="Rojo2"></div>
        </div>
        <img id="logo" src="Imagenes/logo.png">
        
        
         
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
      
       
        boolean bandera = true;
            while(rst.next() && bandera==true){
                 
                
                String Nombre = rst.getString("NombreProyecto");
                
                
                
                if(Nombre.equals(NameProject) && bandera == true){
                    bandera=false;
                String Responsable = rst.getString("Responsable");
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
               
        <div id="cajaDatos">
        <table style="margin-top: -2px" border="1">
        <tr><td>Nombre:</td><td><%=Nombre%></td></tr>
        <tr><td>Fecha: </td><td><%=Fecha%></td></tr>
        <tr><td>Responsable: </td><td><%=Responsable%></td></tr>
        <tr><td>Email: </td><td><%=Email%></td></tr>
        <tr><td>Domicilio: </td><td><%=Domicilio%></td></tr>
        <tr><td>Estado: </td><td><%=Estado%></td></tr>
        <tr><td>Municipio: </td><td><%=Municipio%></td></tr>
        <tr><td>Pais :</td><td><%=Pais%></td></tr>
        <tr><td>Codigo Postal: </td><td><%=CodigoPostal%></td></tr>
        <tr><td>Telefono:</td><td><%=Telefono%></td></tr>
        <tr><td>Fax:</td><td><%=Fax%></td></tr>
        <tr><td>Email del Responsable: </td><td><%=EmailResponsable%></td></tr>
        <tr><td>Descripción: </td><td><%=Descripcion%></td></tr>
        </table>
                    </div>
                <%
          
                               }else{
                             
                               }
                  }
                  %>
      
        <%
                    
      
                
                
            
          conn.close();
               }catch(Exception e){
                   out.println("Error en: "+ e.getMessage());
               }  
          %>
       
        
       
    </body>
</html>
