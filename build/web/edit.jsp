<%-- 
    Document   : edit
    Created on : Apr 7, 2019, 2:43:58 PM
    Author     : Katleho Motloung
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TEWS</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <script type="text/javascript"> 
        function validate()
        {
            var name_pattern= /^[a-z A-Z]+$/; //name pattern allowed alphabet a-z or A-Z 
            var surname_pattern= /^[a-z A-Z]+$/; //owner pattern allowed alphabet a-z or A-Z
            var password_pattern= /^[a-z A-Z]+$/; //owner pattern allowed alphabet a-z or A-Z
            var location_pattern= /^[a-z A-Z]+$/; //owner pattern allowed alphabet a-z or A-Z
            var role_pattern= /^[a-z A-Z]+$/; //owner pattern allowed alphabet a-z or A-Z
   
            var name = document.getElementById("name"); //get textbox id "name" and store in "name" variable
            var surname = document.getElementById("surname"); //get textbox id "owner" and store in "owner" variable
            var password = document.getElementById("password"); //get textbox id "owner" and store in "owner" variable
            var location = document.getElementById("location"); //get textbox id "owner" and store in "owner" variable
            var role = document.getElementById("role"); //get textbox id "owner" and store in "owner" variable
              
            if(!name_pattern.test(name.value) || name.value=='') //check if condition using test() method for matching name parameter pattern or not blank value
            {
                alert("Enter Name Alphabet Only....!"); //alert message
                name.focus();
                name.style.background = '#f08080'; //set textbox color
                return false;                    
            }
            if(!surname_pattern.test(surname.value) || surname.value=='') //check if condition using test() method for matching owner parameter pattern or not blank value
            {
                alert("Enter Surname Alphabet Only....!"); //alert message
                surname.focus();
                surname.style.background = '#f08080'; //set textbox color
                return false; 
            if(!password_pattern.test(password.value) || password.value=='') //check if condition using test() method for matching owner parameter pattern or not blank value
            {
                alert("Enter Password Alphabet Only....!"); //alert message
                password.focus();
                password.style.background = '#f08080'; //set textbox color
                return false; 
            if(!location_pattern.test(location.value) || location.value=='') //check if condition using test() method for matching owner parameter pattern or not blank value
            {
                alert("Enter Location Alphabet Only....!"); //alert message
                location.focus();
                location.style.background = '#f08080'; //set textbox color
                return false; 
            if(!role_pattern.test(role.value) || role.value=='') //check if condition using test() method for matching owner parameter pattern or not blank value
            {
                alert("Enter Role Alphabet Only....!"); //alert message
                role.focus();
                role.style.background = '#f08080'; //set textbox color
                return false; 
            }
        }
       </script> 

    </head>
    <body>
        <center><font color="red"><Strong>ADMINISTRATION</Strong></font>
        <h1>&nbsp;&nbsp;&nbsp;&nbsp;Tsunamis Early Warning &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System</h1>
        </center>
        <div class="main">
            <center>
             <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Update Record</h3>
  
        <form method="post" action="EditController" onsubmit="return validate();">
                
            <table>         
            <%
            if(request.getParameter("edit_id")!=null) //get edit_id from index.jsp page with href link and check not null after continue
            {
                int id=Integer.parseInt(request.getParameter("edit_id")); //get edit_id store in "id" variable
                
                String url="jdbc:mysql://localhost:3306/tews"; //database connection url string
                String username="root"; //database connection username
                String password=""; //database password
                
                try
                {
                    Class.forName("com.mysql.jdbc.Driver"); //load driver
                    Connection con=DriverManager.getConnection(url,username,password); //create connection
                    
                    PreparedStatement pstmt=null; //create statement
                    
                    pstmt=con.prepareStatement("select * from tewslogin where id=?"); //sql select query 
                    pstmt.setInt(1,id);
                    ResultSet rs=pstmt.executeQuery(); //execute query and set in Resultset object rs.
                    
                    while(rs.next())
                    {
            %>    
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txt_name" id="name" value="<%=rs.getString("name")%>"></td>
                </tr>
    
                <tr>
                    <td>Surname</td>
                    <td><input type="text" name="txt_surname" id="surname" value="<%=rs.getString("surname")%>"></td>
                </tr>
                
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="txt_email" id="email" value="<%=rs.getString("email")%>"></td>
                </tr>
                
                <tr>
                    <td>Password</td>
                    <td><input type="text" name="txt_password" id="password" value="<%=rs.getString("password")%>"></td>
                </tr> 
                
                <tr>
                    <td>Location</td>
                    <td><input type="text" name="txt_location" id="location" value="<%=rs.getString("location")%>"></td>
                </tr> 
                
                <tr>
                    <td>Role</td>
                    <td><input type="text" name="txt_role" id="role" value="<%=rs.getString("role")%>"></td>
                </tr> 
    
                <tr>
                    <td><input type="submit" name="btn_edit" value="Update"></td>
                    <td><a href="adminPage.jsp">>>>>>Back</a></td>
                </tr>
                
                    <input type="hidden" name="hidden_id" value="<%=rs.getInt("id")%>">
            <%
                    }
                    
                    pstmt.close(); //close statement

                    con.close(); //close connection
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
            %>
            </table>
             
            <center>
                <h3 style="color:red;">
                    <%
                        if(request.getAttribute("UpdateErrorMsg")!=null)
                        {
                            out.print(request.getAttribute("UpdateErrorMsg")); //get update record fail error message from EditController.java
                        }
                    %>
                </h3>
                
            </center>
    
        </form>
    </center>
 </div>

    </body>
</html>

