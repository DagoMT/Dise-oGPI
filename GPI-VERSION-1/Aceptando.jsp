<%-- 
    Document   : EnvioRespuesta
    Created on : 13/12/2013, 11:31:33 AM
    Author     : Rodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <META HTTP-EQUIV="REFRESH" CONTENT="2; http://localhost:8080/Admi_GPI/index.jsp">
        <title>JSP Page</title>
    </head>
    <body>
         <%@ page import="java.sql.*" %>
       
      <% 
    
            try{
             Class.forName("com.mysql.jdbc.Driver").newInstance();
                
                Connection conn=null;
                Statement stmt=null;
                ResultSet rst=null;
                
                String usrBD = "root";
                String passBD = "";
                
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gpi", usrBD, passBD);
                stmt = conn.createStatement();
                rst = stmt.executeQuery("select * from maestro");
                
               
                 String respuesta = request.getParameter("Aceptar");
                 String NombreProyecto = request.getParameter("NombreProyecto");
                 String Folio = request.getParameter("folio");
                
               boolean bandera=false;
               
               while(rst.next()){
                    
                    String NombrePro = rst.getString("NombreProyecto");
                    int id = rst.getInt("id");
                   
                  if(NombrePro.equals(NombreProyecto)){
                       bandera=true;
                       String sql = "UPDATE maestro SET EstadoDelProyecto='"+respuesta+"' , Folio='"+Folio+"' WHERE id="+id;      
                      
                        int res = stmt.executeUpdate(sql);
                        
                        
                       out.println("<div class=\"UserCorrecto\">");
                       out.println("Evaluando.");
                       out.println("Redireccionando...");
                       out.println("</div>");
                        
                    }
                }
               
               if(bandera==false){
               
               out.println("<div class=\"UserCorrecto\">");
                       out.println("Fallo la Modoficacion del texto, el texto no se encuentra en la base de datos");
                       out.println("</div>");
               
                 
             }
                conn.close();
                
                }catch(Exception e){
                 
                }
       
                   
        %>
    </body>
</html>
