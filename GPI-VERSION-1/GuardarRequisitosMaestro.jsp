<%-- 
    Document   : GuardarRequisitosMaestro
    Created on : 12/12/2013, 08:25:25 AM
    Author     : Rodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <META HTTP-EQUIV="REFRESH" CONTENT="2; http://localhost:8080/Admi_GPI/Maestro.jsp"> 
        <title>JSP Page</title>
        
        <style>
            #Notificaciones{
                
                width: 560px;
                height: 60px;
                font-size: 22px;
                color: black;
            }
        </style>
    </head>
    <body>
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
        
        String NombreProyecto = request.getParameter("NombreProyecto");
        String Fina = request.getParameter("Financiamiento");
        String Nombre = request.getParameter("name0"); //Obtenemos el parametro del input de la pagina anterior
        String Responsable = request.getParameter("name1");   //Obtenemos password
        String CorreoResponsable = request.getParameter("name2");
        String Direccion = request.getParameter("name3");
        String Estado = request.getParameter("name4");
        String Municipio = request.getParameter("name5");
        String Pais = request.getParameter("name6");
        String CodigoPostal = request.getParameter("name7");
        String Telefono = request.getParameter("name8");
        String Fax = request.getParameter("n");
        String Correo = request.getParameter("name9");
        String message = request.getParameter("name10");
        String Folio = request.getParameter("Folio");
        String EstadoProyecto = request.getParameter("EstadoDelProyecto");
        String SeaModelado = request.getParameter("SeaModelado");
          
                java.util.Date dt = new java.util.Date();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String currentTime = sdf.format(dt);
                
                String values="\""+ Fina +"\"" + "," + "\""+ Nombre +"\"" + "," + "\""+ NombreProyecto +"\""+ "," + "\""+ Responsable +"\"" + "," + "\""+ CorreoResponsable+"\""+ "," + "\""+Direccion+"\""+ "," + "\""+Estado+"\""+ "," + "\""+Municipio+"\""+ "," + "\""+Pais+"\""+ "," + "\""+CodigoPostal+"\"" + "," + "\""+Telefono+"\""+ "," + "\""+Fax+"\""+ "," + "\""+Correo+"\""+ "," + "\""+message+"\""+ "," + "\""+currentTime+"\""+ "," + "\""+Folio+"\""+ "," + "\""+EstadoProyecto+"\""+ "," + "\""+SeaModelado+"\"";

                boolean result = stmt.execute("insert into maestro (Financiamiento, Nombre, NombreProyecto, Responsable, EmailResponsable, Domicilio, Estado, Municipio, Pais, CodigoPostal, Telefono, Fax, Email, Descripcion, Fecha, Folio, EstadoDelProyecto, SeaModelado) values("+ values +")");  //si las variables contienen algo que las guarde en la BD
        %>
         
         <div id="Notificaciones">
                  Guardado con éxito
                  <p style="font-size: 14px;">Redireccionando...</p>
         </div>    
         
        
       
                <%
       
                
                
            
                
          conn.close();
               }catch(Exception e){
                   out.println("Error en: "+ e.getMessage());
               }  
          %>
    </body>
</html>
