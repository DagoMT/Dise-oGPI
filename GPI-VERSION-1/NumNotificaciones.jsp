<%-- 
    Document   : NumNotificaciones
    Created on : 9/12/2013, 09:00:44 PM
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
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gpi", usu, passw);  
        stmt = conn.createStatement();
        rst = stmt.executeQuery("select * from administrador");
            
        %>
        
         <div id="Notificaciones">
            <%
            while(rst.next()){
                String Nombre = rst.getString("Nombre");
                String Proyecto = rst.getString("Projects");
                               
                %>
                
                <p id="not">Hola</p>
                <%
                
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
