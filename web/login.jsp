<%-- 
    Document   : login
    Created on : 10-03-2017, 13:08:04
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
        <script type="text/javascript">
            function Redirectnewjsp(){
                
                window.location="newjsp.jsp";
                
            }
            
            function Redirectlogin(){
                
                window.location="login.jsp";
                
            }
            
            </script>
    </head>
    <body>
         <%String link1 = "newjsp.jsp";
             String link2 = "";%>
        
      <!--    
            
            if(request.getParameter("username")!= null){
               
                URL url = new URL("http://javabog.dk:9901/brugeradmin?wsdl");
		QName qname = new QName("http://soap.transport.brugerautorisation/", "BrugeradminImplService");
		Service service = Service.create(url, qname);
		Brugeradmin ba = service.getPort(Brugeradmin.class);
                Bruger q = ba.hentBruger(request.getParameter("username"), request.getParameter("password"));

                out.print(q);
                if(q!=null){
                    link2 = link1;
                }
                else{link2="";}
            }

            
        -->

         <form method="GET" action="loginprocess.jsp">
                <input name="username" type="text" value="null"/>
                <input name="password" type="text"/>
                <input type="submit" value="Submit"/>
        </form>
    </body>
</html>
