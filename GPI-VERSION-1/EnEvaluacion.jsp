<%-- 
    Document   : Actualizar
    Created on : 9/12/2013, 01:31:39 AM
    Author     : Rodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>JSP Page</title>
       
            <style>
            #Notificacio{
                font-size: 18px;
                position: absolute;
                margin-top: 0px;
                width: 640px;
                height: 161px;
                background: steelblue;
                overflow: auto;
                border: 4px solid #676767;
                  font-family: Adobe Fan Heiti Std B;
              }
              
              
              #BtnIr{
                  background: transparent;
                  border: 0px;
                  font-size: 18px;
                  position: relative;
                  font-family: Adobe Fan Heiti Std B;
              }
              
              #NombreEmail{
                 margin-top: -50px;
                 overflow: auto;
                 background: violet;
                 
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
        rst = stmt.executeQuery("select * from maestro where EstadoDelProyecto like 'null'");
            
        %>
         <div id="Notificacio">
         
             <form name="ver" action="VisualizacionProyectos.jsp" method="post">
                 <table border="1">
                     <tr><td>Nombre</td><td>Fecha</td><td>Responsable</td><td>Proyecto</td></tr> 
            <%
            while(rst.next()){
                String Nombre = rst.getString("Nombre");
                String NombreProyecto = rst.getString("NombreProyecto");
                String Fecha = rst.getString("Fecha");
                String Responsable = rst.getString("Responsable");               
                %>

              
                <tr><td><%=Nombre%></td><td><%=Fecha%></td><td><%=Responsable%></td>
                    <td><input type="submit" name="name" value="<%=NombreProyecto%>" id="BtnIr"></td></tr>
     
      
       
                <%
                
                                 }
        %>
         </table>         
       </form> 
        </div>         
         
                <%
       
                
                
            
          conn.close();
               }catch(Exception e){
                   out.println("Error en: "+ e.getMessage());
               }  
          %>
    </body>
</html>
