<%-- 
    Document   : busca_consulta_de_proyectos
    Created on : 13/12/2013, 08:42:10 AM
    Author     : Rodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            #Mostrar{
                font-size: 17px;
                font-family: Chaparral Pro Light;
                color: darkblue;
            }
            #BtnVer{
                background: transparent;
                border: 0px;
            }
        </style>
    </head>
    <body>
           <%@page import="java.sql.*" %>
<%
 String value= request.getParameter("value");
  if(!(value.equals("")) && value!=null){
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
            //out.println(value);
          rst = stmt.executeQuery("select NombreProyecto from maestro where NombreProyecto like '" + value + "%'");
           
          
          %>
            <div id="Mostrar"> 
                <p style="font-size: 20px; font-family: FrankRuehl; color: black"> Nombre del proyecto 
               <hr width=25% style="position: static; margin-top: 2px; margin-left: 3px;" align="center"><br>
        <%
            while(rst.next()){

                String proyecto = rst.getString("NombreProyecto");
                
              
                 %>
                 
                
               
                 <form name="formulario" action="Modelar_Proyecto.jsp" method="post">
                    <table>
                        <tr></tr>
                        <tr><td><%=proyecto%></td><td><button id="BtnVer"><img src="Imagenes/see.png"></button></td></tr><!-- Input con el valor del usuario. Al recibir en la siguiente pagina, el name 'eliminar' este lleva el valor del usuario-->
                        <tr><td><input style="display: none;" type="text" name="NameProject" value="<%=proyecto%>"></td></tr>
                        
                    </table>
                        <hr width=58% style="position: static; margin-top: 2px; margin-left: 3px;" align="center">
                 </form>
            
                 <%
            }
            
           %>
    </div>
                 <%
                    
                   
            conn.close();
    }catch(Exception e){
        out.println("Error en: "+ e.getMessage());
    }
}
%>
    </body>
</html>
