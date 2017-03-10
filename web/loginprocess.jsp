<%-- 
    Document   : loginprocess
    Created on : 10-03-2017, 14:05:40
    Author     : Andreas
--%>

<%@page import="brugerautorisation.data.Bruger"%>
<%@page import="brugerautorisation.data.Diverse"%>
<%@page import="brugerautorisation.transport.soap.Brugeradmin"%>
<%@page import="javax.xml.ws.Service"%>
<%@page import="javax.xml.namespace.QName"%>
<%@page import="java.net.URL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login process</title>
    </head>
    <body>
    <center><h2>
            <%
                URL url = new URL("http://javabog.dk:9901/brugeradmin?wsdl");
                QName qname = new QName("http://soap.transport.brugerautorisation/", "BrugeradminImplService");
                Service service = Service.create(url, qname);
                Brugeradmin ba = service.getPort(Brugeradmin.class);

                try {
                    Bruger q = ba.hentBruger(request.getParameter("username"), request.getParameter("password"));
                    if (q.brugernavn.equals(request.getParameter("username")) && q.adgangskode.equals(request.getParameter("password"))) {

                        String redirectURL = "GalgelegWeb.jsp";
                        response.sendRedirect(redirectURL);
                    }
                } catch (Exception e) {
                    out.println("Wrong Username & Password");

                }


            %>
    </center></h2>
</body>
</html>
