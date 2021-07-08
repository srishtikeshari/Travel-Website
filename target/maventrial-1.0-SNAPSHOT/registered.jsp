<%-- 
    Document   : registered
    Created on : 15 Jan, 2019, 11:03:48 PM
    Author     : srishti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            
                 //String otp=(String)session.getAttribute("sess_otp");
                 //String userid=(String)session.getAttribute("sess_ini_userid");

                String get_code=request.getParameter("verify_code");
                String otp=request.getParameter("otp1");
                String userid=request.getParameter("userid1");
                out.println(get_code);
                out.println(otp);
                if(get_code.equals(otp))
                {
                     response.sendRedirect("index.jsp?run=success");
                   // out.println("success");
                }
                else
                {
                    try{
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectfinal1?zeroDateTimeBehavior=convertToNull","root","");
        
            Statement stat=conn.createStatement();
            //out.println("connection successful");
           
           
             out.println(userid);
            int x=stat.executeUpdate("Delete from login where userid='"+userid+"' ");
            
             // session.removeAttribute("sess_otp");
             // session.removeAttribute("sess_ini_userid");
              
              //response.sendRedirect("firstpage.jsp?run=fail");
              
              //out.println("fail");
              %>
              <script> alert("Please verify and try again")</script>
              
              <%
          
             response.sendRedirect("signup.jsp?run=fail  ");
            }catch(Exception e)
                
            {
                       out.println(e); 
                 
            } 
                }
                    
                 %>
                    
            </form>
    </body>
    
         
</html>
