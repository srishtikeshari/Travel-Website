<%-- 
    Document   : mail
    Created on : Apr 12, 2019, 12:34:43 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "javax.mail.Authenticator" %>
<%@page import= "javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
     
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="navbar.css">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        
        <title>JSP Page</title>
    </head>
     <style>
          label
     {
         color:black;
         font-size:30px;
     }
       .nava{
               color:white;
           }
           #signinbutton{
               display:none;
               color:white;
               position:relative;
               left:400px;
           }
           body
           {
               background-color: lavender;
           }
           .col-md-6{
               background-color: white;
                box-shadow: 3px 3px 3px gray;
                position: relative;
                top:100px;
                    box-shadow: 3px 3px 3px gray;
           }
           
    </style>
     <%
             String userid=(String)session.getAttribute("sess_userid");
            %>
     <script>
         $(document).ready(function(){
              
           var s="null";     
           s="<%out.print(userid);%>";
             if(s=="null")
             {
                 //alert("ksd");
                 document.getElementById("signinbutton").style.display="inline";
             }
             else
                 
            {
                 document.getElementById("drop").style.display="inline";
                  $('#signinbutton').hide();
             }
             
             
             $('#signinbutton').click(function(){
                $('#signinmodal').modal('show');
           });
           )};
     </script>
     
     
     
      <%
             String userid1=(String)session.getAttribute("sess_userid");
            %>
     <script>
         $(document).ready(function(){
              
           var s="null";     
           s="<%out.print(userid1);%>";
             if(s=="null")
             {
                 //alert("ksd");
                 document.getElementById("signinbutton").style.display="inline";
             }
             else
                 
            {
                 document.getElementById("drop").style.display="inline";
                  $('#signinbutton').hide();
             }
             
             
             $('#signinbutton').click(function(){
                $('#signinmodal').modal('show');
           });
           )};
     </script>
    <body>
           <div class="modal fade" role="dialog" tabIndex="-1" id="signinmodal">
                   
            <div class="modal-dialog">
                    <div class="modal-content">
                        
                        <div class="modal-header">
                            <h2>Sign In</h2>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
                        
                    </div>
                        <div class="modal-body">
                            
                             <form action="checkall.jsp" method="POST">
            <table> 
                <tr>
                  <td>   <b>USER ID: </b></td>
                <td><input type="text" name="userid" ><br></td>
            </tr>
            <tr>
                <td><b>PASSWORD: </b></td>
            <td><input type="password" name="password"><br></td>
            </tr>
            <tr><td></td>
                
                <td><input type="submit" name="login" value="Login"></td>
                             </tr>
            </table>
                                 <input type="hidden" name="pageurl" value="trains">
                             </form>
            <br/>
     
            <a href="forgot.jsp">Forgot Password?</a>
            <p>Don't have an account?<a href="signup.jsp">Sign Up</a></p>
             
       
                        </div>
                        
                       
                       
                
                </div>
                </div>
                </div> 

 
              <div id="navig_bar" class="navbar">
                <ul >
                    <li ><a class="nava" href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i>Home</a></li>
                    <li>  <a class="nava" href="trains.jsp" ><i class="fa fa-train" aria-hidden="true"></i>Trains</a></li>
                    <li>    <a class="nava" href="flights.jsp" ><i class="fa fa-plane" aria-hidden="true"></i>Flights</a> </li>
                    <li>  <a class="nava" href="hotels.jsp" ><i class="fa fa-bed" aria-hidden="true"></i>Hotels</a> </li>
                    <li> <a class="nava" href="plan.jsp" ><i class="fa fa-map-marker" aria-hidden="true"></i>Plan Your Trip</a> </li>
                    <li><a class="nava" href="help.jsp"><i class="fa fa-question-circle" aria-hidden="true"></i>Help</a></li>
                    
                    
                    <li>    <div class="dropdown show" id="drop" style="display:none;">
                        <a class="btn btn-secondary dropdown-toggle" href="#" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                         Hi <% out.println(userid1);%>
                     </a>

                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                          <a class="dropdown-item" href="my_bookings.jsp">My Booking</a>
                         <a class="dropdown-item" href="logout.jsp">Logout</a>
                            </div>
                        </div></li>
                        <li><button id="signinbutton" class="btn btn-link" >Sign in/Sign Up</button></li>
             
                    <%--<li><input style="color:white" id="signinbutton" type="button" class="btn btn-link" value="Sign in/SignUp"></li>--%>
                </ul>
                </div>     
    <body>
        <%!  class SMTPAuthenticator extends javax.mail.Authenticator
      {
        public PasswordAuthentication getPasswordAuthentication()
        {
            return new PasswordAuthentication("travelt616","banasthali12345");
        }
       }   
            
            %>
        <%
            String userid3=request.getParameter("userid");
            //out.print(userid3);
            String emailid="skeshari09@gmail.com";
          //  String userid=request.getParameter("userid");
            try{
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectfinal1?zeroDateTimeBehavior=convertToNull","root","");
        
            Statement stat=conn.createStatement();
            ResultSet rs=stat.executeQuery("Select * from login where userid='"+userid3+"' ");
        %>
        <%
            while(rs.next())
           emailid=rs.getString("emailid");
            //out.print(emailid);
             }
             catch(Exception e)
             {
                 out.print(e);
             }
         %>
          <%  
            Random rand=new Random();
        StringBuffer otp=new StringBuffer();
        for (int i = 0; i < 6; i++) 
        {  
            otp.append(rand.nextInt(10));
              
  
        }
        //out.println(otp);
        String otp_final=otp.toString();
        // out.println(otp_final);
        session.setAttribute("sess_otp", otp_final);
    
        String from="travelt616@gmail.com";
        String to=emailid;
        String pass="banasthali12345";
        Properties props = System.getProperties();
        String host = "smtp.gmail.com";
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.debug", "true");
        props.put("mail.smtp.socketFactory.port", "587");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        SecurityManager security = System.getSecurityManager();
       
        Authenticator autho = new SMTPAuthenticator();
        Session mailSession = Session.getInstance(props, autho);
        //Session mailSession=Session.getDefaultInstance(props,autho);
        MimeMessage message=new MimeMessage(mailSession);

        try {
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject("Change Password");
            message.setText("Your verification code is "+otp+"");
            Transport mailTransport = mailSession.getTransport("smtp");
            mailTransport.connect(host,587,from,pass);
            mailTransport.send(message);
            mailTransport.close();
        }
        catch (AddressException ae) {
            ae.printStackTrace();
        }
        
        %>
        
        
        
    <center>  <div class="col-md-6">
         <p>A verification code has been sent to your email id. Enter the code below to change your password. </p>
        <form action="registered1.jsp" method="POST">
            <p>Enter the code here: </p><input type="password" name="verify_code">
            <input type="submit" name="verify_submit" value="Verify">
            <input type="hidden" value="<%= otp%>" name="otp1">
            <input type="hidden" value="<%= userid%>" name="userid1">
        </form>
        <br>
        </div></center>
    </body>
</html>
