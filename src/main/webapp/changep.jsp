<%-- 
    Document   : changep
    Created on : Apr 12, 2019, 12:51:08 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String password=request.getParameter("password");
        String userid=request.getParameter("userid");
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectfinal1?zeroDateTimeBehavior=convertToNull","root","");
        
            Statement stat=conn.createStatement();
            int rs=stat.executeUpdate("update login SET password='"+password+"' where userid='"+userid+"' ");
            
            if(rs>0)
            {
                response.sendRedirect("index.jsp?change=yes");
            }
        }catch(Exception e){
            
        }
           
         %>
                
        %>
    </body>
</html>