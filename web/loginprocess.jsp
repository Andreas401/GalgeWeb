<%-- 
    Document   : loginprocess
    Created on : 10-03-2017, 14:05:40
    Author     : Andreas
--%>

<%@page import="brugerautorisation.data.Bruger"%>
<%@page import="brugerautorisation.transport.soap.Brugeradmin"%>
<%@page import="javax.xml.ws.Service"%>
<%@page import="javax.xml.namespace.QName"%>
<%@page import="java.net.URL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                URL url = new URL("http://javabog.dk:9901/brugeradmin?wsdl");
		QName qname = new QName("http://soap.transport.brugerautorisation/", "BrugeradminImplService");
		Service service = Service.create(url, qname);
		Brugeradmin ba = service.getPort(Brugeradmin.class);
                Bruger q = ba.hentBruger(request.getParameter("username"), request.getParameter("password"));
                
                if(q!=null){%>
                    
                <jsp:include page ="newjsp.jsp"></jsp:include>
                
                <%
                }else{
                out.println("To bad");
}
         %>

    </body>
</html>
