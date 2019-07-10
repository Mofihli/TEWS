<%-- 
    Document   : delete
    Created on : Apr 7, 2019, 2:42:22 PM
    Author     : Katleho Motloung
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getParameter("delete_id")!=null) //get delete_id from index.jsp page with href link and check not null after continue
    {
        int id=Integer.parseInt(request.getParameter("delete_id")); //get delete_id store in "id" variable
        
        String url="jdbc:mysql://localhost:3306/tews"; //database connection url string
        String username="root"; //database connection username
        String password=""; //database password
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con=DriverManager.getConnection(url,username,password); //create connection
            
            PreparedStatement pstmt=null; //create statement
            
            pstmt=con.prepareStatement("delete from tewslogin where id=? "); //sql delete query
            pstmt.setInt(1,id);
            pstmt.executeUpdate(); //execute query

            RequestDispatcher rd=request.getRequestDispatcher("adminPage.jsp"); //after delete success forward index.jsp page
            rd.forward(request, response); 
            
            pstmt.close(); //close statement
            
            con.close(); //close connection   
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
    }
%>
