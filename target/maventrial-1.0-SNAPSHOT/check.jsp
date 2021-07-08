x<%-- 
    Document   : check
    Created on : 15 Jan, 2019, 10:56:58 PM
    Author     : srishti
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
            
            //String url=request.getParameter("url");
            String userid,password;
            userid=request.getParameter("userid");
            password=request.getParameter("password");
            
             try{
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectfinal1?zeroDateTimeBehavior=convertToNull","root","");
        
            Statement stat=conn.createStatement();
            ResultSet rs=stat.executeQuery("Select * from login where userid='"+userid+"' and password='"+password+"' ");
        %>
        <%
            if(rs.next())
            {
                response.sendRedirect("homepage.jsp");
                session.setAttribute("sess_userid", userid);
            }
            else
            {
                response.sendRedirect("index.jsp?confirm=wrong");
            }
             }
             catch(Exception e)
             {
                 
             }
         %>
    </body>
</html>
