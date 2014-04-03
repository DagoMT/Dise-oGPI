<%-- 
    Document   : dinamico
    Created on : 17/12/2013, 12:39:23 PM
    Author     : Rodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

       
        
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table >
             <tr>    <td>Actividad </td>
            <td>Semestre 1 </td>
            <td> Semestre 2 </td>
            
    </tr>   
<% 


while(rst.next()){
                 
               
                String NombreProyecto= rst.getString("NombreProyecto");
                String Fecha = rst.getString("Fecha");
                String Folio = rst.getString("Folio");
                String SeaModelado = rst.getString("SeaModelado");
                String EstadoProyecto = rst.getString("EstadoDelProyecto");
            



%>


    <tr>    <td><%=NombreProyecto%> </td>
            <td> <input type="radio"> </td>
            <td> <input type="radio"> </td>
    </tr>   
<%
}
        
         }
           catch (Exception n){
              
              
              
          }  
%>
        </table>
        </body>
</html>
