<%-- 
    Document   : saveroute
    Created on : 7 Apr, 2019, 3:14:16 PM
    Author     : srishti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
     <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
        
     <link rel="stylesheet" href="navbar.css" type="text/css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">   
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">      
    </head>
    <body>
        <style>
               #signinbutton{
               display:none;
               color:white;
               position:relative;
               left:550px;
           }
            #navig_bar
            {
                position:relative;
                top:0px;
            }
        </style>
        <%
            String userid=(String)session.getAttribute("sess_userid");
            %>
               <div id="navig_bar" class="navbar">
                <ul >
                    <li ><a class="nava" href="#"><i class="fa fa-home" aria-hidden="true"></i>Home</a></li>
                    <li>  <a class="nava" href="trains.jsp" ><i class="fa fa-train" aria-hidden="true"></i>Trains</a></li>
                    <li>    <a class="nava" href="flight.jsp" ><i class="fa fa-plane" aria-hidden="true"></i>Flights</a> </li>
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
                         <li><input id="signinbutton" style="display:none;color:white;" type="button" class="btn btn-link" value="Sign in/Sign Up"></li>
             
                    <%--<li><input style="color:white" id="signinbutton" type="button" class="btn btn-link" value="Sign in/SignUp"></li>--%>
                </ul>
                </div>  
                     
                     <script>       
                     $(document).ready(function()
         {
       var s="HGHG";     
        s="<%out.print(userid);%>";
             if(s=="null")
             {
                 //alert("ksd");
                 document.getElementById("signinbutton").style.display="inline";
             }
             else
                 
            {
                 document.getElementById("drop").style.display="inline";
             }
         });
         
         </script>
        
        <%
            int signedin=1;
            if(session.getAttribute("sess_userid")==null)
            {
                signedin=0;
                
            }
            %>
   
        
       
                <div class="modal" id="errorsignin">
                    
                    <div class="modal-dialog">
                        
                        <div class="modal-header">
                            <h2>You are not signed in!</h2>
                        
                    </div>
                        <div class="modal-body">
                            
                            <p>Please sign-in to continue</p>
                        </div>
                        <div class="modal-footer">
                            
                            <button id="signin" ><a href="index.jsp">Sign In</a></button> 
                        </div>
                
                </div>
                
                </div> 
                
        <div class="modal fade" role="dialog" tabIndex="-1" id="signinmodal">
                   
           <div class="modal-dialog">
                    <div class="modal-content">
                        
                        <div class="modal-header">
                            
                            <h4>Please Sign In to continue </h4>
                          
        </button>
                        
                    </div>
                        <div class="modal-body">
                            
                             <form action="check3.jsp" method="POST">
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
                                 <input type="hidden" name="url" value="booking_train.jsp">
                             </form>
            <br/>
     
            <a href="forgot.jsp">Forgot Password?</a>
            <p>Don't have an account?<a href="signup.jsp">Sign Up</a></p>
             
       
                        </div>
                        
                       <div class="modal-footer">
                            
                            <button><a href="plan.jsp">Close</a></button>
                            
                            
                        </div>
                       
                
                </div>
              </div>
                </div> 
       
        
         <script>
         $(document).ready(function(){   
                var s="HGHG";     
        s="<%out.print(userid);%>";
             if(s=="null")
             {
                 //alert("ksd");
                 document.getElementById("signinbutton").style.display="inline";
             }
             else
                 
            {
                 document.getElementById("drop").style.display="inline";
             }
            var signin=<% out.print(signedin); %>
            if(signin==0)
            {
                $('#signinmodal').modal({
                        backdrop: 'static',
                        keyboard: false  
                });
                $('#signinmodal').modal('show');
                
                <%--$(document).click(function(){
                    
                        
                         $('#signinmodal').modal('show');
    });--%>
            }
           
});    
        </script>
        
        
        
          <%
           
            String url=(String)session.getAttribute("sess_planurl");
           String city=(String)session.getAttribute("sess_plancity");
           String origin=(String)session.getAttribute("sess_origincity");
           String dest=(String)session.getAttribute("sess_destcity");
           //out.print(origin);
           //out.print(dest);
            if(userid!=null)
            {
             try{
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectfinal1?zeroDateTimeBehavior=convertToNull","root","");
        
            Statement stat=conn.createStatement();
            int rs=stat.executeUpdate("insert into routes values('"+userid+"','"+city+"','"+url+"','"+origin+"','"+dest+"') ");
        
            if(rs>0)
            {
                
                response.sendRedirect(url+"&saved=yes");
                
                
            }
                else{
                %>
             <script>
                         alert("Sorry, there was an error saving the route.");
        
                 </script>
       

                <%
                         response.sendRedirect("plan_info1.jsp?city="+city);
                }

             }catch(Exception e){
                 out.print(e);
                }
            }
       %>
    </body>
</html>
