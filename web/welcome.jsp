<%-- 
    Document   : welcome
    Created on : 08 Apr 2019, 9:56:36 AM
    Author     : Katleho Motloung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>TEWS</title>
    </head>
    <body><center>
        <h1 color="gold">Tsunamis Early Warning &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System</h1>
        </center><br/>
        
        <%
            String name = (String)request.getAttribute("txt_name");
            String surname = (String)request.getAttribute("txt_surname");
            String location = (String)request.getAttribute("txt_location");
        %>
        <p>
            Hello <b><%=name%> <%=surname%></b>. Your location is <b><%=location%></b>. 
            Please click <a href="index.html">here</a> to go back to the Login page.
        </p>

    </body>
</html>

