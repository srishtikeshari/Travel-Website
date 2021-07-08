<%-- 
    Document   : feedback.jsp
    Created on : 10 Apr, 2019, 11:23:16 PM
    Author     : srishti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         
         <%
            String emailid,type,feedback;
            emailid=request.getParameter("email");
            type=request.getParameter("type");
            feedback=request.getParameter("feedback");
            Date date= new Date();
            String date1=date.toString();
            out.println(date1);
            out.print(date);
             try{
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectfinal1?zeroDateTimeBehavior=convertToNull","root","");
        
            Statement stat=conn.createStatement();
            int rs=stat.executeUpdate("insert into feedback values('"+emailid+"','"+feedback+"','"+type+"','"+date1+"')");
        
            %>
           
            <%
            response.sendRedirect("index.jsp?feedbackdone=yes");
             }
             catch(Exception e)
             {
                 
             }
         %>
    </body>
</html>
