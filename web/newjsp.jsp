<%-- 
    Document   : newjsp
    Created on : 07-03-2017, 13:00:41
    Author     : JJ
--%>

<%@page import="java.net.URL"%>
<%@page import="semesterprojektgalgeleg.MainInterface"%>
<%@page import="javax.xml.ws.Service"%>
<%@page import="javax.xml.namespace.QName"%>
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
            
                i.gætBogstav("b");
            %>
        
        <h1>Hello <%= i.erSpilletSlut() %>  World!</h1>
    </body>
</html>
