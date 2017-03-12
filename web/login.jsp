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
<link type="text/css" rel="stylesheet" href="css.css" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <script type="text/javascript">
            function Redirectnewjsp(){
                
                window.location="GalgelegWeb.jsp";
                
            }
            
            function Redirectlogin(){
                
                window.location="login.jsp";
                
            }
            
            </script>
    </head>
    <body>
         <%String link1 = "GalgelehWeb.jsp";
             String link2 = "";%>

         <form class="login-form" method="GET" action="loginprocess.jsp">
             <input name="username" type="text" placeholder="Brugernavn"/><br>
             <input name="password" type="password" placeholder="Adgangskode"/><br>
             <button type="submit">Login</button>
        </form>
    </body>
</html>
