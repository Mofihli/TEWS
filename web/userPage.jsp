<%-- 
    Document   : userPage
    Created on : 08 Apr 2019, 9:52:55 AM
    Author     : Katleho Motloung
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style1.css">
        <title>TEWS</title>
    </head>
    <body><center>
        <h1>Tsunamis Early Warning &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System</h1>
        </center><br/>
        
         <%

            String str = (String) session.getAttribute("email");
            out.print("Welcome, " + str);

        %>
        <br/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br/>
        <center>
        <table>
                    <tr>
                    <%
                    try{
                    String url = "jdbc:mysql://localhost:3306/tews"; 
                    Class.forName("com.mysql.jdbc.Driver"); 
                    Connection con = DriverManager.getConnection(url, "root", "");
                    Statement stmt = con.createStatement(); 
                    ResultSet rs = stmt.executeQuery("select * from tewsevents where id=1");
                        while(rs.next()){
                    %>
                    <tr>
                    <td>Type:</td>
                    <td><%=rs.getString("type") %></td>
                    </tr><tr>
                    <td>Description:</td>
                    <td><%=rs.getString("description") %></td>
                    </tr><tr>
                    <td>Distance:</td>
                    <td><%=rs.getString("distance") %></td>
                    </tr><tr>
                    <td>Speed:</td>
                    <td><%=rs.getString("speed") %></td>
                    </tr><tr>
                    <td>Time:</td>
                    <td><%=rs.getString("day") %></td>
                    </tr><tr>
                    <td>Location:</td>
                    <td><%=rs.getString("location")%></td>
                    </tr>
                    <%
                    }con.close();}
                    catch (Exception e){
                    e.printStackTrace();
                    }
                    %>
        </table>
        </center>
        <p align="right"><a href="index.html"> Logout,</a>        
        <%
            String st = (String) session.getAttribute("email");
            out.print(st);

        %></p>
    </body>
</html>

