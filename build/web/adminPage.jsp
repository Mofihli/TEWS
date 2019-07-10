<%-- 
    Document   : adminPage
    Created on : 08 Apr 2019, 9:51:44 AM
    Author     : Katleho Motloung
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style1.css">
    </head>
    <body><center><font color="red"><Strong>ADMINISTRATION</Strong></font>
        <h1>&nbsp;&nbsp;&nbsp;&nbsp;Tsunamis Early Warning &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System</h1>
        </center><br/>
        <%
            String str = (String) session.getAttribute("email");
            out.print("Welcome, " + str);

        %>
        <br/>
        <center><h1><a href="addEvents.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add Record</a></h1></center>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br/>
        
    <center>
    <div class="main"> 
            <table>    
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Surname</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Local</th>
                    <th>Role</th>
                    <th></th>
                </tr>
                <%
                    String url="jdbc:mysql://localhost:3306/tews"; //database connection url string
                    String username="root"; //database connection username
                    String password=""; //database password
                  
                try
                {
                    Class.forName("com.mysql.jdbc.Driver"); //load driver
                    Connection con=DriverManager.getConnection(url,username,password); //create connection
                  
                    PreparedStatement pstmt=null; //create statement
                  
                    pstmt=con.prepareStatement("select * from tewslogin"); //sql select query
                    ResultSet rs=pstmt.executeQuery(); //execute query and set in ResultSet object rs.
                    
                    while(rs.next())
                    {
                %>
                <tr>
                    <td><%=rs.getInt("id")%></td>
                    <td><%=rs.getString("name")%></td>
                    <td><%=rs.getString("surname")%></td>
                    <td><%=rs.getString("email")%></td>
                    <td><%=rs.getString("password")%></td>
                    <td><%=rs.getString("location")%></td>
                    <td><%=rs.getString("role")%></td>
                    
                    <td><a href="edit.jsp?edit_id=<%=rs.getInt("id")%>">edit</a>
                    <a href="delete.jsp?delete_id=<%=rs.getInt("id")%>">delete</a></td>
                    
               </tr>
                <%
                    }
                    
                    pstmt.close(); //close statement

                    con.close(); //close connection
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
                %>
            </table>
  
            <center>
                <h3 style="color:green;">
                <%
                    if(request.getAttribute("InsertSuccessMsg")!=null)
                    {
                        out.println(request.getAttribute("InsertSuccessMsg")); //get record insert success message from AddController.java
                    }
                %>
                
                <%
                    if(request.getAttribute("UpdateSuccessMsg")!=null)
                    {
                        out.println(request.getAttribute("UpdateSuccessMsg")); //get record update success message from EditController.java
                    }
                %>
                </h3>
            </center>
            
 </div>
</center><br/>

 
<center><h1><a href="addEvents.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add Event</a></h1></center>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 
        <center>
<table>    
                <tr>
                    <th>ID</th>
                    <th>Type</th>
                    <th>Description</th>
                    <th>Distance</th>
                    <th>Speed</th>
                    <th>Day</th>
                    <th>Location</th>
                    <th></th>
                </tr>
                <%
                    String url1="jdbc:mysql://localhost:3306/tews"; //database connection url string
                    String username1="root"; //database connection username
                    String password1=""; //database password
                  
                try
                {
                    Class.forName("com.mysql.jdbc.Driver"); //load driver
                    Connection con=DriverManager.getConnection(url1,username1,password1); //create connection
                  
                    PreparedStatement pstmt=null; //create statement
                  
                    pstmt=con.prepareStatement("select * from tewsevents"); //sql select query
                    ResultSet rs=pstmt.executeQuery(); //execute query and set in ResultSet object rs.
                    
                    while(rs.next())
                    {
                %>
                <tr>
                    <td><%=rs.getInt("id")%></td>
                    <td><%=rs.getString("type")%></td>
                    <td><%=rs.getString("description")%></td>
                    <td><%=rs.getString("distance")%></td>
                    <td><%=rs.getString("speed")%></td>
                    <td><%=rs.getString("day")%></td>
                    <td><%=rs.getString("location")%></td>
                    
                    <td><a href="deleteEvent.jsp?delete_id=<%=rs.getInt("id")%>">delete</a></td>
                    
               </tr>
                <%
                    }
                    
                    pstmt.close(); //close statement

                    con.close(); //close connection
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
                %>
            </table>
  
            <center>
                <h3 style="color:green;">
                <%
                    if(request.getAttribute("InsertSuccessMsg")!=null)
                    {
                        out.println(request.getAttribute("InsertSuccessMsg")); //get record insert success message from AddController.java
                    }
                %>
                
                <%
                    if(request.getAttribute("UpdateSuccessMsg")!=null)
                    {
                        out.println(request.getAttribute("UpdateSuccessMsg")); //get record update success message from EditController.java
                    }
                %>
                </h3>
            </center>
            
 </div>
        </center>

        <p align="right"><a href="index.html"> Logout,</a>        
        <%
            String st = (String) session.getAttribute("email");
            out.print(st);

        %></p>
    </body>
</html>

