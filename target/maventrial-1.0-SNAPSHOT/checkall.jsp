<%-- 
    Document   : checkall
    Created on : 11 Apr, 2019, 12:09:54 AM
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
            String userid,password;
            userid=request.getParameter("userid");
            password=request.getParameter("password");
            session.setAttribute("sess_userid", userid);
            String pageurl=request.getParameter("pageurl");
            try{
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectfinal1?zeroDateTimeBehavior=convertToNull","root","");
        
            Statement stat=conn.createStatement();
            ResultSet rs=stat.executeQuery("Select * from login where userid='"+userid+"' and password='"+password+"' ");
        %>
        <%
            if(rs.next())
            {
                response.sendRedirect(pageurl+".jsp");
            }
            else
            {
                %>
                <script>
                      alert("Invalid credentials");
                    </script>
                    <%
                response.sendRedirect(pageurl+".jsp");
            }
             }
             catch(Exception e)
             {
                 
             }
         %>
            
            
            %>
    </body>
</html>
