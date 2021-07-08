<%-- 
    Document   : verify
    Created on : 15 Jan, 2019, 5:58:09 PM
    Author     : srishti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*" %>
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
        
     <link rel="stylesheet" href="navbar.css" type="text/css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">   
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">      
      
    </head>
    <style>
         .nava{
               color:white;
           }
           #signinbutton{
               display:none;
               color:white;
               position:relative;
               left:400px;
           }
           #navig_bar
           {
               position:relative;
               top:0px;
           }
           body{
               background-color: lavender;
           }
           .col-md-9
           {
               background-color: white;
               height:100%;
               position:relative;
               top:50px;
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
       });
    </script>
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
              
             // response.setHeader("Cache-Control","private, no-store, no-cache, must-revalidate, post-check=0, pre-check=0");
             
              
        String firstname,lastname,mobileno,emailid,password,userid1,dob;
        
        //String run="firstpage.jsp?run=success";
        //run=response.encodeRedirectURL(run);
        firstname=request.getParameter("firstname");
        lastname=request.getParameter("lastname");
        mobileno=request.getParameter("mobileno");
        emailid=request.getParameter("emailid");
        session.setAttribute("sess_email", emailid); 
        password=request.getParameter("password");
        userid1=request.getParameter("userid");
        session.setAttribute("sess_ini_userid", userid1);
        //out.println(session.getAttribute("sess_ini_userid"));
        dob=request.getParameter("dob");
        
        
         /*  Enumeration e = session.getAttributeNames();
          while (e.hasMoreElements()) {
            String name = (String) e.nextElement();
            out.println(name + ": " + session.getAttribute(name) + "<BR>");
          }*/
      //out.println(request.getParameter("firstname")); 
           try{
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectfinal1?zeroDateTimeBehavior=convertToNull","root","");
        
            Statement stat=conn.createStatement();
            //out.println("connection successful");
            int x=0;
         
            x=stat.executeUpdate("insert into login values('"+firstname+"','"+lastname+"','"+userid1+"','"+dob+"','"+mobileno+"','"+emailid+"','"+password+"')");
           //out.println(x);
           //ResultSet rs=stat.executeQuery("Select * from login where userid='"+userid+"' and password='"+password+"'");
        
           
          /* if(x>0)
            {
                response.sendRedirect("firstpage.jsp?run=success");
            }
            else
            {
       
                response.sendRedirect("firstpage.jsp?run=fail");
            }*/
           
            }catch(Exception ex)
                
            {
                       out.println(ex); 
               
            }    
           
           
          //String numbers="0123456789";
        Random rand=new Random();
        StringBuffer otp=new StringBuffer();
        for (int i = 0; i < 6; i++) 
        {  
            otp.append(rand.nextInt(10));
              
  
        }
       
        String otp_final=otp.toString();
        
        /*if(request.getParameter("otp")!=null)
        {
            otp_final=request.getParameter("otp");
        }*/
         out.println(otp_final);
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
            message.setSubject("Verification");
            message.setText("Your verification code is "+otp+"");
            Transport mailTransport = mailSession.getTransport("smtp");
            mailTransport.connect(host,587,from,pass);
            mailTransport.send(message);
            mailTransport.close();
        }
        catch (AddressException ae) {
            ae.printStackTrace();
        }
   
    
                         //response.sendRedirect("registered.jsp");
        
        
        
        
        
        
        
        %>
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
                         Hi <% out.println(userid);%>
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
    <center>     <div class='container'>
                    <div class='col-md-9'>
          <p>A confirmation code has been sent to your email id. Enter the code below to verify your account. </p>
        <form action="registered.jsp" method="POST">
            <p>Enter the code here: </p><input type="password" class="form-conrol" name="verify_code">
            <input type="submit" class="btn btn-success" name="verify_submit" value="Verify">
            <input type="hidden" value="<%= otp%>" name="otp1">
            <input type="hidden" value="<%= userid%>" name="userid1">
        </form>
        <br>
        
                    </div>
                </div>
                    </center>
    </body>
</html>
