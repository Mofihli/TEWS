<%-- 
    Document   : add
    Created on : Apr 7, 2019, 2:41:08 PM
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
            String name, surname, password, location, role;

            name = request.getParameter("txt_name"); //txt_name 
            surname = request.getParameter("txt_surname"); //txt_owner
            password = request.getParameter("txt_password"); //txt_owner
            location = request.getParameter("txt_location"); //txt_owner
            role = request.getParameter("txt_role"); //txt_owner

            PreparedStatement pstmt = null; //create statement 

            pstmt = con.prepareStatement("insert into tewslogin(name,surname,password,location,role)values(?,?,?,?,?)"); //sql insert query 
            pstmt.setString(1, name);
            pstmt.setString(2, surname);
            pstmt.setString(3, password);
            pstmt.setString(4, location);
            pstmt.setString(5, role);
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
            var surname = document.getElementById("surname"); //get textbox id "surname" and store in "owner" variable
            var password = document.getElementById("password"); //get textbox id "owner" and store in "owner" variable
            var location = document.getElementById("location"); //get textbox id "owner" and store in "owner" variable
            var role = document.getElementById("role"); //get textbox id "owner" and store in "owner" variable
              
            if(!name_pattern.test(name.value) || name.value=='') //check if condition using test() method for name matching parameter pattern or not blank value
            {
              alert("Enter Name Alphabet Only....!"); //alert message
              name.focus();
              name.style.background = '#f08080'; //set textbox color
              return false;                    
            }
            if(!surname_pattern.test(surname.value) || surname.value=='') //check if condition using test() method for owner matching parameter pattern or not blank value
            {
              alert("Enter Surname Alphabet Only....!"); //alert message
              surname.focus();
              surname.style.background = '#f08080'; //set textbox color
              return false;                    
            }
            if(!password_pattern.test(password.value) || password.value=='') //check if condition using test() method for owner matching parameter pattern or not blank value
            {
              alert("Enter Password Alphabet Only....!"); //alert message
              password.focus();
              password.style.background = '#f08080'; //set textbox color
              return false; 
            if(!location_pattern.test(location.value) || location.value=='') //check if condition using test() method for owner matching parameter pattern or not blank value
            {
              alert("Enter Location Alphabet Only....!"); //alert message
              location.focus();
              location.style.background = '#f08080'; //set textbox color
              return false; 
            if(!role_pattern.test(role.value) || role.value=='') //check if condition using test() method for owner matching parameter pattern or not blank value
            {
              alert("Enter Role Alphabet Only....!"); //alert message
              role.focus();
              role.style.background = '#f08080'; //set textbox color
              return false; 
            }
 </script> 

    </head>
    <body>
        <center><font color="red"><Strong>ADMINISTRATION</Strong></font>
        <h1>&nbsp;&nbsp;&nbsp;&nbsp;Tsunamis Early Warning &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System</h1>
        </center>
        <div class="main">
            <center>
                <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add Record</h3>
            
        <form action="AddController" method="post" onsubmit="return validate();">
                
            <table>         
                
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txt_name" id="name" required=""></td>
                </tr>
    
                <tr>
                    <td>Surname</td>
                    <td><input type="text" name="txt_surname" id="surname" required=""></td>
                </tr> 
                
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="txt_email" id="email" required=""></td>
                </tr>
                
                <tr>
                    <td>Password</td>
                    <td><input type="text" name="txt_password" id="password"></td>
                </tr> 
                <tr>
                    <td>Location</td>
                    <td><input type="text" name="txt_location" id="location" required=""></td>
                </tr> 
                <tr>
                    <td>Role</td>
                    <td><input type="text" name="txt_role" id="role" required=""></td>
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

