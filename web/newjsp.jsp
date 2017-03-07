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
    </head>
    <body>

        <%
            URL url = new URL("http://ubuntu4.javabog.dk:9978/galgeleg?wsdl");
            QName qname = new QName("http://server/", "GameLogicService");
            Service service = Service.create(url, qname);
            MainInterface i = service.getPort(MainInterface.class);
            i.nulstil();

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

            <div id="chatbox"> <% out.println("" + i.getSynligtOrd()); String submit = request.getParameter("submitmsg"); i.gætBogstav(submit); %></div>

            <form name="message" action="">
                <input name="usermsg" type="text" id="usermsg" size="63" />
                <input name="submitmsg" type="submit"  id="submitmsg" value="Send" />
            </form>

        </div>   
    </body>
</html>
