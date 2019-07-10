<%-- 
    Document   : addEvents
    Created on : 08 Apr 2019, 3:28:34 PM
    Author     : Katleho Motloung
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");  //load driver 

        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tews", "root", ""); //create connection 

        if (request.getParameter("btn_add") != null) //check button click event not null
        {
            String type,description,distance,speed,day,location;

            type = request.getParameter("txt_type"); //txt_name 
            description = request.getParameter("txt_description"); //txt_owner
            distance = request.getParameter("txt_distance"); //txt_owner
            speed = request.getParameter("txt_speed"); //txt_owner
            day = request.getParameter("txt_day"); //txt_owner
            location = request.getParameter("txt_location"); //txt_owner
            

            PreparedStatement pstmt = null; //create statement 

            pstmt = con.prepareStatement("insert into tewsevents(type,description,distance,speed,day,location)values(?,?,?,?,?,?)"); //sql insert query 
            pstmt.setString(1, type);
            pstmt.setString(2, description);
            pstmt.setString(3, distance);
            pstmt.setString(4, speed);
            pstmt.setString(5,day );
            pstmt.setString(6, location);
            pstmt.executeUpdate(); //execute query

            con.close();  //close connection 

            out.println("Insert Successfully...! Click Back link.");// after insert record successfully message

        }

    } catch (Exception e) {
        out.println(e);
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>TEWS</title>
    </head>
    <body>
        <center><font color="red"><Strong>ADMINISTRATION</Strong></font>
        <h1>&nbsp;&nbsp;&nbsp;&nbsp;Tsunamis Early Warning &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System</h1>
        </center><br/>
        
        <div class="main">
            <center>
                <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add Event</h3>
            
        <form action="EventController" method="post" onsubmit="return validate();">
                
            <table>         
                
                <tr>
                    <td>Type</td>
                    <td><input type="text" name="txt_type" id="type" required=""></td>
                </tr>
    
                <tr>
                    <td>Description</td>
                    <td><textarea name="txt_description" id="description" required=""></textarea></td>
                </tr> 
                
                <tr>
                    <td>Distance</td>
                    <td><input type="text" name="txt_distance" id="distance" required=""></td>
                </tr>
                
                <tr>
                    <td>Speed</td>
                    <td><input type="text" name="txt_speed" id="speed"></td>
                </tr> 
                <tr>
                    <td>Day</td>
                    <td><input type="text" name="txt_day" id="day" required=""></td>
                </tr> 
                <tr>
                    <td>Location</td>
                    <td><input type="text" name="txt_location" id="location" required=""></td>
                </tr> 
    
                <tr>
                    <td><input type="submit" name="btn_add" value="Add"></td>
                    <td><a href="adminPage.jsp">>>>>>Back</a></td>
                </tr>
    
            </table>
               
                <h3 style="color:red;">
                <%
                    if(request.getAttribute("InsertErrorMsg")!=null)
                    {
                        out.println(request.getAttribute("InsertErrorMsg")); //get insert record fail error message from AddController.java
                    }
                %>
                </h3>
             
                
    
        </form>
    </center>
 </div>
        
    </body>
</html>
