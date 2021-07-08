<%-- 
    Document   : signup
    Created on : 15 Jan, 2019, 5:09:23 PM
    Author     : srishti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" src="style.css"></link>
         
      
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
         <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <link type="text/css" rel="stylesheet" href="navbar.css">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  
      
      
        <title>JSP Page</title>
    </head>
    <style>
        body
        {
            background-image: url("signupbg.jpg");
            background-attachment:fixed;
            background-size:cover;
            font-family: calibri;
        }
        .col-md-7
        {
             background:rgba(0,0,0,0.5);
             margin-top:40px;
             
        }
        .label
        {
            margin-top: 10px;
            font-size:20px;
           font-weight: normal;
        }
        .input-group
        {
            margin-top: 10px;
            margin-left: 20px;
        }
        .input-group-addon
        {
            background:transparent;
            border-radius:0px;
            border:0px;
            border-bottom:1px solid gray;
            font-size: 18px;
            color:gray;
            
        }
        .form-control
        {
            background:transparent;
            border-bottom:0px;
            border:0px;
            border-bottom:1px solid gray;
            padding:10px;
            color:white;
            font-size:21px;
       
        }
        h1
        {
            font-size:50px;
            color:white;
            margin-top:30px;
            margin-bottom:50px;
        }
        small
        {
            margin-left:10px;
        }
        #signinbutton{
               display:none;
               color:white;
              
  
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
    <script>
        
         $(document).ready(function(){
              
           var s="null";     
           s="<%out.print(userid);%>";
             if(s=="null")
             {
               
                 document.getElementById("signinbutton").style.display="inline";
             }
           /*  else
                 
            {
                 document.getElementById("drop").style.display="inline";
                  $('#signinbutton').hide();
             }
             */
             
             $('#signinbutton').click(function(){
                $('#signinmodal').modal('show');
           });
       });
    </script>
    <body>
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
                                 <input type="hidden" name="pageurl" value="place">
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
                    
                    
              <%--      <li>    <div class="dropdown show" id="drop" style="display:none;">
                        <a class="btn btn-secondary dropdown-toggle" href="#" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                         Hi <% out.println(userid);%>
                     </a>
              
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                          <a class="dropdown-item" href="my_bookings.jsp">My Booking</a>
                         <a class="dropdown-item" href="logout.jsp">Logout</a>
                            </div>
                        </div></li>
              --%>
                        <li><button id="signinbutton" class="btn btn-link" >Sign in/Sign Up</button></li>
             
                    <%--<li><input style="color:white" id="signinbutton" type="button" class="btn btn-link" value="Sign in/SignUp"></li>--%>
                </ul>
                </div>      
        <div class="container">
            <div class="row">
                <div class="col-md-7">
                    <form   action="verify.jsp" method="GET" onsubmit="return valid();">
                        <h1>Signup</h1>
                          <label class="label control-label">First Name</label>
                          
                          <div class="input-group">
                              <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                          <input id="t1" type="text"  name="firstname" class="form-control" placeholder="Firstname" />
                          </div>
                          <p id="l1" style="color:red ;display:none">Please enter a valid fname</p></br>
                            <label class="label control-label">Last Name</label>
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                <input id="t2" type="text"  name="lastname" class="form-control" placeholder="Lastname"/>
                            </div>
                            <p id="l2" style="color:red ;display:none">Please enter a valid lname</p></br>
                            
                           <label class="label control-label">User Id</label>
                           <div class="input-group">
                               <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                               <input id="t3" type="text" name="userid" class="form-control" placeholder="UserId" />    
                           </div>
                           <p id="l3" style="color:red ;display:none">Please enter a valid userid</p></br>     
            
                             <label class="label control-label">Password</label> 
                             <div class="input-group">
                                 <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>    
                                 <input id="t4" type="password"  name="password" class="form-control" placeholder="Password"/>
                             </div>
                             <p id="l4" style="color:red ;display:none">Password too short</p></br>
                             <label class="label label-control">Date Of Birth</label> 
                             <div class="input-group">
                                 <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                             <input id="t5" name="dob" type="date" class="form-control" />
                             </div>
                             <p id="l5" style="color:red ;display:none">Please enter a valid dob</p></br>
                             <label class="label control-label">Mobile No.</label>
                             <div class="input-group">
                                 <span class="input-group-addon"><span class="glyphicon glyphicon-earphone"></span></span>
                                 <input id="t6" name="mobileno" type="number" class="form-control" placeholder="Phone No"/>
                             </div>
                             <p id="l6" style="color:red ;display:none">Please enter a valid phone number</p></br>
                             <label class="label control-label">Email</label>
                             <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
                            <input id="t7" name="emailid" type="text" class="form-control" placeholder="Email"/>
                             </div>
                             <p id="l7" style="color:red ;display:none">Please enter a valid email id</p></br>
                             <button  class="btn btn-success">submit</button>
          
             
           


             
      
                                 
             </form>
                </div>
            </div>
         </div>
        <script type="text/javascript">
          function valid()
           {
               
            var s1=document.getElementById("t1").value;
            var s2=document.getElementById("t2").value;
            var s3=document.getElementById("t3").value;
            var s4=document.getElementById("t4").value;
            var s5=document.getElementById("t5").value;
            var s6=document.getElementById("t6").value;
            var s7=document.getElementById("t7").value;
            var regx6=/^[6-9][0-9]{9}/;
            var regx7=/^([a-zA-Z0-9\.-]+)@([a-zA-Z0-9]+).([a-z]{2,20})(.[a-z]{2-8})?$/;
      
            var flag=1;
           // window.loaction.href="signup.jsp?mess="+ s3;
            
            if(s1=="")
            {
             
               t1.style.border="solid 3px red";
                document.getElementById("l1").style.display="block";
                flag=0;
            }
            if(s2=="")
            {
                 t2.style.border="solid 3px red";
                document.getElementById("l2").style.display="block";
                flag=0;
            }  if(s3=="")
            {
                 t3.style.border="solid 3px red";
                document.getElementById("l3").style.display="block";
                flag=0;
            }
            if(s4==""||s4.length<=5)
            {
                 t4.style.border="solid 3px red";
                document.getElementById("l4").style.display="block";
                  flag=0;
            }
          
            if(s5=="")
            {
                 t5.style.border="solid 3px red";
                document.getElementById("l5").style.display="block";
                flag=0;
            }
             if(s6=="")
            {
                 t6.style.border="solid 3px red";
                document.getElementById("l6").style.display="block";
                 flag=0;
            }
               if(s7=="")
            {
                 t7.style.border="solid 3px red";
                document.getElementById("l7").style.display="block";
               flag=0;
            }
     
           if((s6!="")||(s7!="")||(s3!=""))
            {
                if(regx6.test(s6))
                {
                   
                }
                else
                {
                    
                    document.getElementById("l6").innerHTML="Please enter a valid phone no";
                    document.getElementById("t6").style.border="solid 3px red ";
                    document.getElementById("l6").style.display="block";
                    flag=0;
                }
                if(regx7.test(s7))
                {
                    
                }
                else 
                {
                 
                    document.getElementById("l7").style.display="block";
                    document.getElementById("t7").style.border="solid 3px red";
                    flag=0;
                }
              
        }
      <%  /*   try
              {
                  String userid="<script>document.write(s3)</script>";
                  Class.forName("com.mysql.jdbc.Driver");
                  Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_final2?zeroDateTimeBehavior=convertToNull","root","");
                  Statement stat=conn.createStatement();
                  ResultSet rs=stat.executeQuery("Select userid from login where userid='"+userid+"'");
                  Boolean b=rs.next();
                  session.setAttribute("result1",b);
              }
              catch(Exception e)
              {
                  
              }  
              
           */
    %>
             
        
                if(flag==0)
                    return false;
                else
                    return true;
      
        }
            

            </script> 
            
        
             <%-- <script>
                       var result="<%= b1 %>";
                  if(result=="false")
                  {
                      flag=0;
                      alert("jasdjh");
                      document.getElementById("l3").style.visibility="visible";
                      document.getElementById("t3").style.border="solid 3px red";
                     
                  }
            }
         
                if(flag==0)
                    return false;
                else
                    return true;
      
        }
            </script>--%>
        
        <%
            String m=null;
         if(request.getParameter("run")!=null)
               {
                     m=request.getParameter("run");
             if(m.equals("fail")) 
               {
               %>
                <script>alert("Code entered is incorrect. Please signup again.");</script>
               <%
               }
            }
          %>
    </body>
</html>