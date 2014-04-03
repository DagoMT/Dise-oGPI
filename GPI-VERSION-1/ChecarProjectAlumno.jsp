<%-- 
    Document   : ChecarProjecAlumno
    Created on : 12/12/2013, 09:42:09 AM
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
        rst = stmt.executeQuery("select * from cronogramaalumno");
          
    
      String ano = request.getParameter("ano");
      String dia = request.getParameter("dia");
      String mes = request.getParameter("mes");
      String cometarios = request.getParameter("comentario");
        
        %>
         
         <div id="Notificaciones">
            <%
            
          String values="\""+ cometarios+"\"" + "," + "\""+ano+"\""+ "," + "\""+dia+"\""+ "," + "\""+mes+"\"" ;
          boolean result = stmt.execute("insert into cronogramaalumno (Comentarios, ano, dia, mes)values("+ values +")");;
               
                %>
                
                    
            
       
            
                <%
                
       
               
    
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
