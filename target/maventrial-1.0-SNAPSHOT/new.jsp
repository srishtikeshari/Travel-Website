<%-- 
    Document   : new.jsp
    Created on : Apr 5, 2019, 12:29:42 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
   
    <body>
        
        <%
            
                 String a=request.getParameter("id");
                 String b=request.getParameter("cancel");
                 String canceltype=request.getParameter("canceltype");
                 String status="no";
            
            if(b!=null)
            {
                status="yes";
                 try
            {
              Class.forName("com.mysql.jdbc.Driver");
           
                  Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectfinal1?zeroDateTimeBehavior=convertToNull","root","");
                  Statement stat=conn.createStatement();
                  int rs=stat.executeUpdate("delete from "+canceltype+" where booking_id='"+b+"'");
                    
                    
                    %>
                    
                    <script>
                              alert("Booking cancelled successfully");
                        
                        </script>
                       
                        
                    <%
                
              
                 
         
                
            }
            catch(Exception x)
            {
                
                        out.println(x);
            }
               response.sendRedirect("my_bookings.jsp?cancel="+status);
            }
           // String path="PDF_box/ticket"+a+".pdf";
           if(a!=null){
            %>
         <object data="PDF_box/<%=a%>.pdf" type="application/pdf" width="100%" height="1200px"></object>
         
         <%
             
             }

             
             %>
    </body>
</html>