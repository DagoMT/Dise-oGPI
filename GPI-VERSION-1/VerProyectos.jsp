<%-- 
    Document   : VerProyectos
    Created on : 11/12/2013, 03:06:10 PM
    Author     : Rodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function visualiza(){
                alert("Hola");
                document.ver.submit();
                
            }
        </script>
            <style>
            #Notificaciones{
                position: absolute;
                margin-top: 20px;
                width: 310px;
                height: 360px;
                background: steelblue;
                overflow: auto;
                border: 4px solid #676767;
                 
              }
              
              
              #btn{
                  background: transparent;
                  border: 2px;
                  font-size: 18px;
                  position: relative;
                  font-family: Adobe Fan Heiti Std B;
              }
              
              #NombreEmail{
                  position: relative;
                  margin-top: 10px;
                  border: 2px solid darkcyan;
              }
              
              #titulo{
                  margin-left: 30px;
                  margin-top: 10px;
                  font-size: 18px;
                  font-family:  Adobe Fan Heiti Std B;
              }
              #bt{
                  display : none;
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
            
        %>
        
         <div id="Notificaciones" >
             <p id="titulo">PROYECTOS</p>
            <%
            while(rst.next()){
                 
                String Financiamiento = rst.getString("Financiamiento");
                String Nombre = rst.getString("Nombre");
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
                <div id="NombreEmail">
       <form name="ver" action="VisualizacionProyectos.jsp" method="post">
       <input  id="btn" type="submit" value="<%="Alumno : "+Nombre +"\n      Correo: "+ Fecha%>">
       <input name="name" id="bt" value="<%=Nombre%>">
                </form>
                </div>
                   
                    
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
