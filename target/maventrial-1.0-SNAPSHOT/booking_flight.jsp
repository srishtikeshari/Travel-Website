<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" src="style.css"></link>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link type="text/css" href="navbar.css" rel="stylesheet">
        <title>JSP Page</title>
 
        
        
       
    </head>
    <style>
        body
        {
            background-color:activecaption;
        
           
          
        }
        .modal-dialog{
                background-color: white;
            }
       label
       {
           color:white;
           font-size:20px;
       }
       h1{
           color:black;
       }
       #div_booking
       {
           margin-top:50px;
           margin-left:40px;
           padding:20px;
           padding-bottom: 30px;
           
       }
       #div_bookingnew
       {
           margin-top:50px;
           margin-left:40px;
           padding:20px;
           padding-bottom: 30px;
           
       }
        h4:hover
       {
           cursor: pointer;
        
       }
      #signinbutton{
               display:none;
               color:white;
               position:relative;
               left:300px;
           }
            #navig_bar
            {
                position:relative;
                top:0px;
            }
       h3{
           color:white;
           margin-left:40px;
           padding-top:10px;
           
       }
       .sub_button
       {
           margin-left:100px;
           padding:10px;
       }
       h3:hover
       {
           cursor: pointer;
        
       }
       span{
           margin-top: 20px;
       }
       .col-md-12
       {
           background-color: white;
            box-shadow: 3px 3px 3px gray;
       }
    </style>
    <body>
              <%
            int signedin=1;
            if(session.getAttribute("sess_userid")==null)
            {
                signedin=0;
                
            }
            %>
        
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
                            
                             <form action="check2.jsp" method="POST">
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
             }
         
          
             $('#signinbutton').click(function(){
                $('#signinmodal').modal('show');
            });
            
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
           function valid()
           {
               var s1=document.getElementById("name").value;
               var s2=document.getElementById("age").value;
               var flag=1;
               if(s1=="")
               {
                   flag=0;
                   document.getElementById("name").style.border="solid 2px red";
                  
               }
               if(s2=="")
               {
                   flag=0;
                   document.getElementById("age").style.border="solid 2px red";
               }
               if(flag==0)
               {
                   alert("Enter valid details");
                   return false;
               }
               else
                   return true;
          }
         </script>
        
        
       
                <div class="modal" id="errorsignin">
                    
                    <div class="modal-dialog">
                        
                        <div class="modal-header">
                            <h2>You are not signed in!</h2>
                        
                    </div>
                        <div class="modal-body">
                            
                            <p style="font-size:20px">Please sign-in to continue your booking</p>
                        </div>
                        <div class="modal-footer">
                            
                            <a id="closemodal" onclick="redirectindex()" href="index.jsp">Sign In</a> 
                        </div>
                
                </div>
                
                </div> 
                
             <div class="modal fade" role="dialog" tabIndex="-1" id="signinmodal">
                   
           <div class="modal-dialog">
                    <div class="modal-content">
                        
                        <div class="modal-header">
                            
                            <h4>Please Sign In to continue your booking </h4>
                          
        </button>
                        
                    </div>
                        <div class="modal-body">
                            
                             <form action="check1.jsp" method="POST">
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
     
            <p>Don't have an account?<a href="signup.jsp">Sign Up</a></p>
             
       
                        </div>
                        
                       <div class="modal-footer">
                            
                            <button><a href="flightsinfo1.jsp">Close</a></button>
                            
                            
                        </div>
                       
                
                </div>
              </div>
                </div> 
        
         <script>
       /*  $(document).ready(function(){   
            var signin=<% // out.print(signedin); %>
            if(signin==0)
            {
                 $('#signinmodal').modal({
                        backdrop: 'static',
                        keyboard: false  
                });
                $('#signinmodal').modal('show');
                
            
            }
            
});    */
        </script>
    <center>  <h1>Enter Passenger Details</h1></center>
        
        <%
            String booking = request.getParameter("id");
            //out.print(booking);
            //session.setAttribute("id",booking);
            String[] flightid=request.getParameterValues("id1");
            
            Integer booking1=Integer.parseInt(booking);
            session.setAttribute("sess_flightid", flightid[booking1]);
            //out.println("booking");
            String[] airline_name=request.getParameterValues("airline_name1");
            String[] fly_duration=request.getParameterValues("fly_duration1");
            String[] dep_time=request.getParameterValues("dep_time1");
             String[] price=request.getParameterValues("price1");
            String[] arr_time=request.getParameterValues("arr_time1");
            session.setAttribute("airline_name",airline_name[booking1]);
            session.setAttribute("fly_duration",fly_duration[booking1]);
            session.setAttribute("dep_time",dep_time[booking1]);
            session.setAttribute("arr_time",arr_time[booking1]);
            //session.setAttribute("dep_time",dep_time[booking1]);
            session.setAttribute("price",price[booking1]);
            //out.print(airline_name[booking1]);
            //String classcode = request.getParameter("classcode");
         //   out.println(booking);
            //out.println(classcode);
            /* String airline_name1="airline_name"+booking;
                            String fly_duration1="fly_duration"+booking;
                            String dep_time1="dep_time"+booking;
                            String arr_time1="arr_time"+booking;
                            String price1="price"+booking;
            String source=(String)session.getAttribute("sess_sourcecode");
           // out.print(source);
            String dest=(String)session.getAttribute("sess_destcode");
            //out.print(dest);
            String date=(String)session.getAttribute("sess_date");
            String airline_name=request.getParameter(airline_name1);
            session.setAttribute("airline_name",airline_name);
            String fly_duration=request.getParameter(fly_duration1);
            session.setAttribute("fly_duration",fly_duration);
            String dep_time=request.getParameter(dep_time1);
            
            session.setAttribute("dep_time",dep_time);
            String arr_time=request.getParameter(arr_time1);
            session.setAttribute("arr_time",arr_time);
            String price=request.getParameter(price1);
            session.setAttribute("price",price);*/
           //out.print(airline_name);
           //out.print(fly_duration);
           //out.print(dep_time);
           //out.print(arr_time);
           //out.print(dept_time);
           //out.print(arrival_time);
            //Integer travel_time;
           // Integer arr,dep;
            //arr=Integer.parseInt(arrival_time);
            //dep=Integer.parseInt(dept_time);
           // travel_time=arr-dep;
           // String travel_time1=travel_time.toString();
            //String travel_time1="kjk";
           // String train_type="ksa";
           // int i=1;
             String datefrom=(String)session.getAttribute("sess_date");
         
        String to=(String)session.getAttribute("sess_destcode");
        String from=(String) session.getAttribute("sess_sourcecode");
        //String id=request.getParameter("id");
        session.setAttribute("id",booking);
        
       /* String aa="airline_name"+id;
       String airline_name=request.getParameter(aa);
       session.setAttribute("airline_name",airline_name);
       String fly_duration=request.getParameter("fly_duration"+id);
        session.setAttribute("fly_duration",fly_duration);
        String dep_time=request.getParameter("dep_time"+id);
         session.setAttribute("dep_time",dep_time);
        String arr_time=request.getParameter("arr_time"+id);
         session.setAttribute("arr_time",arr_time);
        String price=request.getParameter("price"+id);
         session.setAttribute("price",price);
      */
        
            %>
            <div class="container">
                <center> 
                <div class="form-inline">
                      <div class="col-md-12">
                    <center> <h2><% out.print(from+" to "+to+" on "+datefrom);%></h2></center><br>
                    
                    
                    
                    <center> <h4 id="newdivreq" onclick="addpass()">+ Add Passenger </h4> 
                    <h4 id="newdivremove" onclick="removepass()">- Remove Passenger </h4> </center>
                       <form id="booking_form" class="form-inline" action="bookingflight_confirm.jsp" method="POST" onsubmit="return valid();">
              
                     <div class="form-group" id="div_booking">
                         
                    <label for="name">Name:</label>
                  
                    <input  class="form-control" name="name" type="text" placeholder="Name" id="name">
                               
                    <label for="age">  Age:</label>
                 
                    <input class=" form-control" name="age" type="text" placeholder="Age" id="age">
                 
                      &nbsp;&nbsp;&nbsp;&nbsp;     
                   <select name="gender" class="form-control">
                       <option value="Female">Female</option>
                        <option value="Male">Male</option>
                   </select>
                       
                     &nbsp;&nbsp;&nbsp;&nbsp;     
                   <select name="country" class="form-control">
	                  <option value="Indian">India</option>
                          <option value="Non-Indian">Other</option>
                   
                   </select>
                    
                    <br>
                  
              
                </div> 
                  
                
          
                        </div>
                   
                   
             </div>
            </center>
                     
                    
                      
            </div>
                    <center>
                     <div class="container sub_button">
                      <input type="submit" value="Book" class="btn btn-success" > 
                   </div>
                    </center>    
              
           </form>
                   <script>
                       
                      function addpass(){
                          
                           //i=id;
                           //var idofform="div"+i;
                           //console.log(idofform);
                           //var original=document.getElementById('booking_form');
                           
                           var newdiv=document.getElementById('div_booking');
                           
                           newdivnew=newdiv.cloneNode(true);
                          // i=i+1;
                           //var newid="div"+i;
                           //console.log(newid);
                           newdivnew.id = "div_bookingnew";
                           //var newhiddeninput=document.getElementById('idno');
                           //newhiddeninput.value = i;
                           //newdivnew.id= "div"+i;
                           newdiv.parentNode.appendChild(newdivnew);
                          
                           
                       }
                       function removepass()
                       {
                          
                           var newdiv=document.getElementById('div_bookingnew');
                           newdiv.parentNode.removeChild(newdiv);
                       
                   }  
                    </script>
    </body>
</html>
