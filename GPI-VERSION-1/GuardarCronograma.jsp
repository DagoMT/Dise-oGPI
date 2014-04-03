<%-- 
    Document   : GuardarCronograma
    Created on : 13/12/2013, 12:05:04 PM
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
        rst = stmt.executeQuery("select * from documentoone");
        
        
        String NombreProyecto = request.getParameter("NombreProyecto");
        String FechaInicio = request.getParameter("FechaInicio");
        String FechaFinal = request.getParameter("Txt0"); //Obtenemos el parametro del input de la pagina anterior
        String Folio = request.getParameter("Folio");   //Obtenemos password
        //----------------------------------------------------
        String Participante1 = request.getParameter("Txt1");
        String Participante2 = request.getParameter("Txt2");
        String Participante3 = request.getParameter("Txt3");
        String Participante4 = request.getParameter("Txt4");
        String Participante5 = request.getParameter("Txt5");
        String Participacion1 = request.getParameter("par1");
        String Participacion2 = request.getParameter("par2");
        String Participacion3 = request.getParameter("par3");
        String Participacion4 = request.getParameter("par4");
        String Participacion5 = request.getParameter("par5");
        String Hora1 = request.getParameter("Hora1");
        String Hora2 = request.getParameter("Hora2");
        String Hora3 = request.getParameter("Hora3");
        String Hora4 = request.getParameter("Hora4");
        String Hora5 = request.getParameter("Hora5");
        //---------------------------------------------------------
         
        String FuenteFina = request.getParameter("Txt6");
        String NivelTesis1 = request.getParameter("NivelTesis");
        String Niveltesis2 = request.getParameter("NivelTesis2");
        
        String nivel1 = request.getParameter("Nivel1");
        String nivel2 = request.getParameter("Nivel2");
        String nivel3 = request.getParameter("Nivel3");
        String nivel4 = request.getParameter("Nivel4");
        String nivel5 = request.getParameter("Nivel5");
        String nivel6 = request.getParameter("Nivel6");
        String nivel7 = request.getParameter("Nivel7");
        String nivel8 = request.getParameter("Nivel8");
        String nivel9 = request.getParameter("Nivel9");
        String nivel10 = request.getParameter("Nivel10");
        String nivel11 = request.getParameter("Nivel11");
        String nivel12 = request.getParameter("Nivel12");
        String nivel13 = request.getParameter("Nivel13");
        String nivel14 = request.getParameter("Nivel14");
        String nivel15 = request.getParameter("Nivel15");
        String nivel16 = request.getParameter("Nivel16");
        String nivel17 = request.getParameter("Nivel17");
        String nivel18 = request.getParameter("Nivel18");
        String nivel19 = request.getParameter("Nivel19");
        String nivel20 = request.getParameter("Nivel20");
        String nivel21 = request.getParameter("Nivel21");
        String nivel22 = request.getParameter("Nivel22");
        String nivel23 = request.getParameter("Nivel23");
        String nivel24 = request.getParameter("Nivel24");
        String nivel25 = request.getParameter("Nivel25");
        String nivel26 = request.getParameter("Nivel26");
        String nivel27 = request.getParameter("Nivel27");
        String nivel28 = request.getParameter("Nivel28");
        String nivel29 = request.getParameter("Nivel29");
        String nivel30 = request.getParameter("Nivel30");
        
        String Articulo = request.getParameter("Txt7");
        String Divulgacion = request.getParameter("Txt8");
        String Memorias = request.getParameter("Txt9");
        String Tesis = request.getParameter("Txt10");
        String Otro = request.getParameter("Txt11");
        
                
                
                String values="\""+ NombreProyecto +"\"" + "," + "\""+ FechaInicio +"\"" + "," + "\""+ FechaFinal+"\""+ "," + "\""+ Folio +"\"" + "," + "\""+ Participante1+" "+Participacion1+""+Hora1+"\""+ "," + "\""+Participante2+" "+Participacion2+" "+Hora2+"\""+ "," + "\""+Participante3+" "+Participacion3+" "+Hora3+"\""+ "," + "\""+Participante4+" "+Participacion4+" "+Hora4+"\""+ "," + "\""+Participante5+" "+Participacion5+" "+Hora5+"\"" + "," + "\""+ FuenteFina +"\""+ "," + "\""+ NivelTesis1+"\""+ "," + "\""+ Niveltesis2+"\""+ "," + "\""+ nivel1+" "+nivel7+""+nivel13+" "+nivel19+" "+nivel25+"\""+ "," + "\""+ nivel2+" "+nivel8+""+nivel14+" "+nivel20+" "+nivel26+"\""+ "," + "\""+ nivel3+" "+nivel9+""+nivel15+" "+nivel21+" "+nivel27+"\""+ "," + "\""+ nivel4+" "+nivel10+""+nivel16+" "+nivel22+" "+nivel28+"\""+ "," + "\""+ nivel5+" "+nivel11+""+nivel17+" "+nivel23+" "+nivel29+"\""+ "," + "\""+ nivel6+" "+nivel12+""+nivel18+" "+nivel24+" "+nivel30+"\""+ "," + "\""+ Articulo +"\""+ "," + "\""+ Divulgacion +"\""+ "," + "\""+ Memorias +"\""+ "," + "\""+ Tesis +"\""+ "," + "\""+ Otro +"\"";

                boolean result = stmt.execute("insert into documentoone (NombreProyecto, FechaInicio, FechaTermina, Folio, Partipante1, Partipante2, Partipante3, Partipante4, Partipante5, Financiamiento, TesisNivel, Relacion, Mes1, Mes2, Mes3, Mes4, Mes5, Mes6, ArticuloCientifico, Divulgacion,Memorias, Tesis, Otro) values("+ values +")");  //si las variables contienen algo que las guarde en la BD
        
      
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
