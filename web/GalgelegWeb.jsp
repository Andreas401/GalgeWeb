<%-- 
    Document   : newjsp
    Created on : 07-03-2017, 13:00:41
    Author     : JJ
--%>
<%@page import="java.util.Scanner"%>
<%@page import="java.net.URL"%>
<%@page import="semesterprojektgalgeleg.MainInterface"%>
<%@page import="javax.xml.ws.Service"%>
<%@page import="javax.xml.namespace.QName"%>
<link type="text/css" rel="stylesheet" href="css.css" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Galgeleg</title>

        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
        <script type="text/javascript">
          $('document').ready(function(){
              
              $('#usermsg').click(function(){
                  bogstavprompt = prompt("Gæt et bogstav");
                  document.getElementById("usermsg").value = bogstavprompt;
                  
              })
              
              
          })
          </script>-->

    </head>
    <body>
        
        <%
            URL url = new URL("http://ubuntu4.javabog.dk:9978/galgeleg?wsdl");
            QName qname = new QName("http://server/", "GameLogicService");
            Service service = Service.create(url, qname);
            MainInterface i = service.getPort(MainInterface.class);
        %>
        <div id="wrapper">
            <div id="menu">
                <p> <center>Velkomme til Galgeleg Spil</center> </p>
            </div>

            <div id="chatbox">   
                <% String submit = request.getParameter("usermsg"); %>
                <br><br>
                <% out.println("Dit gæt: " + submit); %>
                <br><br><br>
                <% if (request.getParameter("usermsg") == null) {
                    } else {
                        i.gætBogstav(submit.toLowerCase());
                    } %>
                <% out.println(i.getSynligtOrd()); %>
                <% i.getBrugteBogstaver(); %>
                <% i.logStatus(); %>
                <% System.out.println("synligt ord: " + i.getSynligtOrd()); %>
                <br><br><h3>
                    <% if (i.erSpilletSlut() && i.erSpilletVundet()) {
                            out.println("Du har vundet");
                        } else if (i.erSpilletSlut() && i.erSpilletTabt()) {
                            out.println("Du har tabt");
                        }%></h3>
            </div>

            <form method="GET" action="">
                <input name="usermsg" type="string" style="width:385px; padding:10px; margin-left: 4.5%"/>
                <input type="submit" value="Submit" style="padding: 10px"/>
            </form>
            <% if (i.erSpilletSlut()) {
                    i.nulstil();
                }%>
        </div>   
    </body>
</html>
