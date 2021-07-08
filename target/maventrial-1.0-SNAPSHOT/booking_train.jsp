<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
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
    </head>
    <style>
        body
        {
            background: url(train1.jpg);
            background-size:cover;
           
          
        }
        .input1{
            width:150px;
            display:inline;
        }
        .input2{
            width:250px;
            display:inline;
        }
       label
       {
           color:Black;
           font-size:20px;
           padding:10px;
       }
       h1{
           color:Black;
           padding-bottom: 30px;
       }
       #div_booking
       {
           margin-top:50px;
           margin-left:40px;
           padding:20px;
           
       }
        #div_bookingnew
       {
           margin-top:50px;
           margin-left:40px;
           padding:20px;
           
       }
       h3{
           color:black;
           margin-left:40px;
           padding-top:10px;
           
       }
       .sub_button
       {
           margin-left:100px;
           padding:10px;
       }
       h4:hover
       {
           cursor: pointer;
        
       }
       .col-md-10{
           background-color:whitesmoke;
           margin-left:130px;
           opacity:0.9;
           padding:10px;
           box-shadow: 3px 3px gray;
       }
         .nava{
               color:white;
           }
           #signinbutton{
               display:none;
               color:white;
               position:relative;
               left:50px;
           }
            #navig_bar
            {
                position:relative;
                top:0px;
            }
    </style>
    <body>
        
         <%
            String userid=(String)session.getAttribute("sess_userid");
            %>
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
                         <li><input id="signinbutton" style="display:none;color:white;" type="button" class="btn btn-link" value="Sign in/Sign Up"></li>
             
                    <%--<li><input style="color:white" id="signinbutton" type="button" class="btn btn-link" value="Sign in/SignUp"></li>--%>
                </ul>
                </div>  
                     
                     <script>       
              /*       $(document).ready(function()
         {
       var s="HGHG";     
        s="<%//out.print(userid);%>";
             if(s=="null")
             {
                 //alert("ksd");
                 document.getElementById("signinbutton").style.display="inline";
             }
             else
                 
            {
                 document.getElementById("drop").style.display="inline";
                  
             }
               var s="null";     
     /*      s="<%//out.print(userid);%>";
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
         });*/
         
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
                            
                            <button><a href="trains_info1.jsp">Close</a></button>
                            
                            
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
               var s="null";     
     /*      s="<%out.print(userid);%>";
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
             
             */
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
            
            var name=document.getElementById("name").value;
            var age=document.getElementById("age").value;
            var flag=0;
            if(name=="")
            {
                document.getElementById("name").style.border="solid 2px red";
                flag=1;
            }
            if(age=="")
            {
                document.getElementById("age").style.border="solid 2px red";
                flag=1;
            }
            if(flag==1)
            {
                alert("Please Enter valid details");
                return false;
            }
            else
            {
                
                return true;
            }
        }
        </script>
        
        
        
    <center>  <h1 style="color:white">Enter passenger details</h1></center>
        
        <%
            String train_no= request.getParameter("book");
            out.print(train_no);
            //session.setAttribute("book",train_no);
                    //String classcode = request.getParameter("classcode");
           //out.println("Trainno. "+booking+" ");
            //out.println(classcode);
            int i=0;
            Integer trainno1=Integer.parseInt(train_no);
            String availability=request.getParameter("availableinput"+train_no);
            session.setAttribute("sess_availability",availability);
            String fare=request.getParameter("fareinput"+train_no);
            session.setAttribute("sess_fare",fare);
            String[] trainno=request.getParameterValues("trainno1");
            session.setAttribute("book",trainno[trainno1]);
            String[] trainname=request.getParameterValues("trainname1");
            session.setAttribute("sess_trainname",trainname);
            String[] dep_time=request.getParameterValues("departuretime1");
            String[] arr_time=request.getParameterValues("arrivaltime1");
            String[] classcode=request.getParameterValues("classcode1");
            String[] prefcode=request.getParameterValues("prefcode1");
            session.setAttribute("sess_classcode",classcode[trainno1]);
            session.setAttribute("sess_prefcode",prefcode[trainno1]);
            session.setAttribute("sess_trainname",trainname[trainno1]);
            session.setAttribute("sess_depttime",dep_time[trainno1]);
            session.setAttribute("sess_arrtime",arr_time[trainno1]);
            String source=(String)session.getAttribute("sess_sourcecode");
            //out.print("Source: "+source+" ");
            String dest=(String)session.getAttribute("sess_destcode");
            //out.print("Dest: "+dest+" ");
            String date=(String)session.getAttribute("sess_date");
           //out.print(trainno[trainno1]); 
           //out.print(classcode[trainno1]);
           //out.print(prefcode[trainno1]);
           //out.print(date[trainno1]);
           //out.print(trainname[trainno1]);
           //out.print(dep_time[trainno1]);
           //out.print(arr_time[trainno1]);
           //out.print(classcode[trainno1]);
           //out.print(availability);
           //out.print(fare);
           //out.println(train_no);
           
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

          <%--  <div id="navig_bar" class="navbar">
                <ul >
               
                    <li ><a href="#"><i class="fa fa-home" aria-hidden="true"></i>Home</a></li>
                    <li>  <a href="trains.jsp" ><i class="fa fa-train" aria-hidden="true"></i>Trains</a></li>
                    <li>    <a href="flight.jsp" ><i class="fa fa-plane" aria-hidden="true"></i>Flights</a> </li>
                    <li>  <a href="hotels.jsp" ><i class="fa fa-bed" aria-hidden="true"></i>Hotels</a> </li>
                    <li> <a href="plan.jsp" ><i class="fa fa-map-marker" aria-hidden="true"></i>Plan Your Trip</a> </li>
                    <li><a href="help.jsp"><i class="fa fa-question-circle" aria-hidden="true"></i>Help</a></li>
             
             
                    <li><input type="button" class="btn btn-link" value="Sign in/SignUp"></li>
                </ul>
                </div>  --%>
           
            <div class="container">
                
                <div >
                      <center>      <form id="booking_form" action="booking_confirm.jsp" method="POST" onsubmit="return valid();">
                        <div class="col-md-10">
                           
                            <h2><%out.println(trainname[trainno1]+" "+source+" "+dest+" "+date+" "+classcode[trainno1]+train_no);%></h2>
                
                            <br>
                             <h4 id="newdivreq" onclick="addpass()">+ Add Passenger </h4> 
                    <h4 id="newdivremove" onclick="removepass()">- Remove Passenger </h4> 
                <div id="div_booking">
                  
                    <label class="label1">   Name:</label> <input class="form-control input2"  name="name" type="text" placeholder="Name" id="name">
                    <label class="label1">  Age:</label> <input class="form-control input2" name="age" type="text" placeholder="Age" id="age">
                    <span style="padding:20px;">
                   <select class="form-control input1" name="gender">
                       <option value="Female">Female</option>
                        <option value="Male">Male</option>
                   </select>
                        </span>
                     <span style="padding:20px;">
                   <select class="form-control input1" name="country" >
	                  <option value="Indian">India</option>
                          <option value="Non-Indian">Other</option>
                   
                   </select>
                          </span>
                    <span style="padding:20px;">
                   <select class="form-control input1" name="berth" >
	                  <option value="any">Any berth</option>
                          <option value="lower">Lower Berth</option>
                           <option value="side">Side Berth</option>
                  
                   </select>
                    </span>
                   
                 
                   
                </div> 
                    
                    
                    </center>
                            
      
                      
                        
                          </div>
         
                             <center>    <input style="margin:50px" type="submit" value="Book" class="btn btn-success"></center>
                   </form>
                    </div>
                            
        </div>  
                        
            
             
           
       
                   
                   <script>
                      
                       //var i;
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