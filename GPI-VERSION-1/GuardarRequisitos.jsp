<%-- 
    Document   : GuardarRequisitos
    Created on : 9/12/2013, 11:51:48 PM
    Author     : Rodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        rst = stmt.executeQuery("select * from alumno");
          
        String Fina = request.getParameter("Financiamiento");
        String Nombre = request.getParameter("name0"); //Obtenemos el parametro del input de la pagina anterior
        String Responsable = request.getParameter("name1");   //Obtenemos password
        String Direccion = request.getParameter("name2");
        String Estado = request.getParameter("name3");
        String Municipio = request.getParameter("name4");
        String Pais = request.getParameter("name5");
        String CodigoPostal = request.getParameter("name6");
        String Telefono = request.getParameter("name7");
        String Fax = request.getParameter("n");
        String Correo = request.getParameter("name9");
        String CorreoResponsable = request.getParameter("name10");
        String message = request.getParameter("name11");
        
                java.util.Date dt = new java.util.Date();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String currentTime = sdf.format(dt);
         
        %>
         
         <div id="Notificaciones">
            <%
            
                String values="\""+ Fina +"\"" + "," + "\""+ Nombre +"\"" + "," + "\""+ Responsable +"\"" + "," + "\""+ CorreoResponsable+"\""+ "," + "\""+Direccion+"\""+ "," + "\""+Estado+"\""+ "," + "\""+Municipio+"\""+ "," + "\""+Pais+"\""+ "," + "\""+CodigoPostal+"\"" + "," + "\""+Telefono+"\""+ "," + "\""+Fax+"\""+ "," + "\""+Correo+"\""+ "," + "\""+message+"\""+ "," + "\""+currentTime+"\"";

                boolean result = stmt.execute("insert into alumno (Financiamiento, Nombre, Responsable, EmailResponsable, Domicilio, Estado, Municipio, Pais, CodigoPostal, Telefono, Fax, Email, Descripcion, Fecha) values("+ values +")");  //si las variables contienen algo que las guarde en la BD
               
    
    %>
         </div>    
         <p>AGREGADO</p>
                <%
       
                
                
            
                
          conn.close();
               }catch(Exception e){
                   out.println("Error en: "+ e.getMessage());
               }  
          %>
    </body>
</html>
