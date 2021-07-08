<%-- 
    Document   : firstpage
    Created on : 15 Jan, 2019, 4:50:47 PM
    Author     : srishti
--%>
 

    <head>
       

        
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
     
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="navbar.css">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        
        <style>
        
 *           {
               
                padding:0px;
                margin:0px;
             
            }
           
            .footer{
                background-color: lavender;
                width:100%;
                height:425px;
                margin-bottom: 50px;
                
            }
           label
           {
               color:white;
               font-size:20px;
               text-align: center;
           }
           .carousel-item 
           {
               height:600px;
             
               
           }
           .col-xs-6
           {
               background:rgba(0,0,0,0.5);
               top:300px;
              
           }
           .form-control
           {
                  background:transparent;
                  border-radius: 0px;
                  border:0px;
                  border-bottom: 1px solid white;
                  padding:10px;
                  color:white;
                  font-size:21px;
                  
           }
           .customDiv
           {
               height:400px;
               padding:15px;
             margin:20px;
              
            
           }
           .item
           {
               transition:transform 5s ease;
           }
           .carousel-caption
           {
               top:50%;
               bottom:auto;
               background-color: rgba(0,0,0,0.5);
               font-family:helvetica;
               font-weight: normal;
           }
           .nava{
               color:white;
           }
           .travel{
               padding:150px;
           }
           #signinbutton{
               display:none;
               color:white;
               position:relative;
               left:400px;
           }
           h1{
               text-align: center;
               
           }
           p{
               text-align: center;
           }
           .form-control{
               background-color: white;
           }
           .input-group{
               padding: 5px;
           }
           
        </style>
         <script>
            var nav=document.getElementById("nav_bar");
            window.onscroll=function(){
                if(window.pageYOffset >100)
                {
                    nav.style.background="blue";
                }
                else
                {
                    nav.style.background="transparent";
                }
            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
        
         <%
             String userid=(String)session.getAttribute("sess_userid");
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
                            
                             <form action="check.jsp" method="POST">
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
                             </form>
            <br/>
     
            <a href="forgot.jsp">Forgot Password?</a>
            <p>Don't have an account?<a href="signup.jsp">Sign Up</a></p>
             
       
                        </div>
                        
                       
                       
                
                </div>
                </div>
                </div> 

 <script>
         $(document).ready(function(){   
           
           $('#signinbutton').click(function(){
                $('#signinmodal').modal('show');
           });
           
        
            
     
            
});  



 
        </script>
    
    
    
    
   
       <div id="carouselExample" class="carousel slide" data-interval="3000" data-ride="carousel">
           <div class="carousel-inner">
            
       
    
        
  
    <div class="carousel-item active">
        <img src="Flights_images.jpg" class="d-block w-80 ">
        <div class="carousel-caption">
            <h3>Flights</h3>
            <h4>Search the right flights for your right trip</h4>
            
        </div>
        <h1>Flights</h1>
    </div>
    <div class="carousel-item">
      <img src="Train-6.jpg" class="d-block w-100" >
       <div class="carousel-caption">
            <h3>Trains</h3>
            <h4>Begin your Journey from the right track</h4>
            
        </div>
    </div>
    <div class="carousel-item">
      <img src="hotels1.jpg" class="d-block w-100" >
      <div class="carousel-caption">
            <h3>Hotels</h3>
            <h4>Choose a wise place to stay</h4>
            
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
                  $('#signinbutton').hide();
             }
         });
         
         </script>
  </div>
</div>
      
 
      <div class="row">
          <div class="col-md-3">
              <div class="customDiv" style="text-align:center;">
                  <h1 text-align:center>
                     Trains
                  </h1> 
                   <br>
                       <br>
                  <p>You can search trains from any location in India and check the availability and fare for the same.</p>
              </div>
          </div>
          <div class="col-md-3">
               <div class="customDiv" >
                  <h1>
                     Hotels
                  </h1> 
                    <br>
                       <br>
                    <p>Search comfortable places of stay at your destination</p>
          </div>
          </div>
              <div class="col-md-3">
                   <div class="customDiv">
                  <h1>
                     Flights
                  </h1> 
                        <br>
                       <br>
                       <p>You can search flights from any location in the world and check  fare for the same.</p>
              </div>
              </div>   
                    <div class="col-md-3">
                   <div class="customDiv">
                  <h1>
                     Plan your trip
                      
                  </h1> 
                       <br>
                       <br>
                       <p>Confused about which places to visit, once you reach your destination? Check popular tourist attractions at your destination and get a route plan for the same. </p>
              </div>
      </div>
  </div>   
        
             <div class="footer" >
                
                 
                 <div class="row">
                 
                 
                     <div class="col-lg-2"></div>
                      
                     <div class="col-lg-5">
                         <h3>Give your Feedback Here.</h3>
                          <form action="feedback.jsp" style="padding:10px">
                     
                              <div class="input-group">
                     <input class="form-control col-lg-4"  name="email" type="text" placeholder="Email Id">
                              </div>
                              <div class="input-group">
                     <input class="form-control col-lg-4"  type="text" name="type" placeholder="Feedback Type"><br>
                              </div>
                     <div class="input-group">
                     <textarea class="form-controlcol-lg-6"  rows="5" cols="50" name="feedback" >Type here.... </textarea>
                     </div>
                      <div class="input-group">
                     <input class="btn btn-success" type="submit">
                     </div>
                 </form>
                         
                         
                         
                         </div>
                      
                      
                      <div class="col-lg-5 travel">
                          
                          <img src="logo.png">
                      </div>     
                        
                          
                      
                 
                 
                     
                     
                     
             </div>
             </div>
        <%
            try {
                String n = null;
                String m = null;
                if (request.getParameter("confirm") != null) {
                    n = request.getParameter("confirm");
                    if (n.equals("wrong")) {
        %>
        <script>alert("Incorrect username or password");</script>
        <%
                }
            }
            if (request.getParameter("run") != null) {
                m = request.getParameter("run");
                if (m.equals("success")) {
        %>
        <script>alert("Successfully Registered");</script>
        <%
        } else if (m.equals("fail")) {
        %>
        <script>alert("Code entered is incorrect. Please signup again.");</script>
        <%
                    }
                }

            } catch (Exception e) {
                out.println(e);
            }
        %>
        <%
            
            if(request.getParameter("feedbackdone")!=null)
            {
                String feed=request.getParameter("feedbackdone");
                if(feed.equals("yes"))
                {
                    %>
                    
                    <script>
                        
                        alert("Thanks for your feedback");
                        </script>
                    <%
                }
            }


             if(request.getParameter("change")!=null)
            {
                String feed=request.getParameter("change");
                if(feed.equals("yes"))
                {
                    %>
                    
                    <script>
                        
                        alert("Password changed successfully.");
                        </script>
                    <%
                }
else{
     %>
                    
                    <script>
                        
                        alert("Could not change passsword. Please try again.");
                        </script>
                    <%
}
            }
            
            
            %>
    </body>
</html>