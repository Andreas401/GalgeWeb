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
<link type="text/css" rel="stylesheet" href="newcss.css" />
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

           

            //i.gætBogstav("b");
            
            /*while (i.erSpilletSlut() == false) {
                System.out.println("" + i.getSynligtOrd());
                i.logStatus();
                System.out.println("Indtast bogstav her: ");
                Scanner scan = new Scanner(System.in);
                String letter = scan.nextLine();

                //i.gætBogstav(letter);
                if (i.erSpilletTabt() == true) {
                    System.out.println("Spillet er tabt!");
                } else if (i.erSpilletVundet() == true) {
                    System.out.println("Spillet er vundet!");
                } else {
                    System.out.println("SENT");
                }

            }*/

        %>
        <div id="wrapper">
            <div id="menu">
                <p class="welcome">Galgeleg Spil, <b></b></p>
            </div>

            <div id="chatbox">   
                 <% String submit = request.getParameter("usermsg"); %>
                 <% out.println(submit); %>
                 
                 <% if(request.getParameter("usermsg")==null){} else{i.gætBogstav(submit);} %>
                 <%out.println(i.getSynligtOrd()); %>
                 <% i.getBrugteBogstaver(); %>
                 <% i.logStatus(); %>
                 <% System.out.println("synligt ord: " + i.getSynligtOrd()); %>
            </div>

            <form method="GET" action="newjsp.jsp">
                <input name="usermsg" type="string"/>
                <input type="submit" value="Submit"/>
            </form>
           <% if(i.erSpilletSlut()){i.nulstil();} %>
        </div>   
    </body>
</html>
