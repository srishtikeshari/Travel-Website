<%-- 
    Document   : page1
    Created on : 11 Jan, 2019, 11:29:47 PM
    Author     : srishti
--%>

<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.util.Scanner" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="javax.net.ssl.HostnameVerifier" %>
<%@ page import="javax.net.ssl.HttpsURLConnection" %>
<%@ page import="javax.net.ssl.SSLContext" %>
<%@ page import="javax.net.ssl.SSLSession" %>
<%@ page import="javax.net.ssl.TrustManager" %>
<%@ page import="javax.net.ssl.X509TrustManager" %>
<%@ page import="java.security.cert.X509Certificate" %>
<%@ page import="java.io.Reader" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
   
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
     <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
        
     <link rel="stylesheet" href="navbar.css" type="text/css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">   
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">      
      
        <title>JSP Page</title>
    </head>
    <style>
        body{
            
        
        background:url("railway1.jpg");
        background-size:cover;
        background-attachment:fixed;
        font-family:calibri;
        }
      .form-conrol
      {
           margin-top: 20px;
           padding:10px;
      }
     .col-md-4
     {
         margin:100px;
         background:rgba(0,0,0,0.5);
         padding:20px;
         margin-left:400px;
     }
     h1
     {
         color:white;
     }
     
     button
     {
         padding:20px;
      
     }
     label
     {
         color:white;
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
           
   /*      .navbar
         {
             width:100%;
               padding:10px;
                top:0px;
                transition: 0.5s;
               position:fixed;
           height:70px;
          background:rosybrown;
        
           }
          .navbar ul li{
                list-style-type:none;
                padding:5px 20px;
                display:inline-block;
                font-size:24px;
                font-family:sans-serif;
                cursor:pointer;
                color:white;
                border-radius: 6px;
                transition:.5s;
             
             
          }
          .navbar ul li input
          {
              font-size:24px;
          }
         .navbar ul li:hover
         {
             background:palevioletred;
         }
       */
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
         
      $('#source').keyup(function(){
          var cityname=$('#source').val();
          console.log(cityname);
          var url='https://api.railwayapi.com/v2/suggest-station/name/'+cityname+'/apikey/8i358aqu6k/';
          //alert(url);
          var myrequest=new XMLHttpRequest();
          myrequest.open('GET',url);
          myrequest.onload = function(){
                var mydata = JSON.parse(myrequest.responseText);
                var stations=mydata.stations;
                var i;
                var stationnames=["hjkhk","gjh"];
               
                var x=stations.length;
               
                //alert(stationnames);
             
                    for(i=0;i<15;i++)
                    {
                        stationnames[i]=(stations[i].name).toString()+"-"+(stations[i].code).toString();
                       // document.write(stations[i]);
                    }
                
                $('#source').autocomplete({
                    source: stationnames
                },{
                    minLength:2
                });
                //console.log(stations);
                //console.log(stationnames[5]);
               console.log(mydata);
               
    };
     myrequest.send();
   });
      
    $('#destination').keyup(function(){
          var cityname=$('#destination').val();
          console.log(cityname);
          var url='https://api.railwayapi.com/v2/suggest-station/name/'+cityname+'/apikey/8i358aqu6k/';
          var myrequest=new XMLHttpRequest();
          myrequest.open('GET',url);
          myrequest.onload = function(){
                var mydata = JSON.parse(myrequest.responseText);
                var stations=mydata.stations;
                var i;
                var x=stations.length;
                var stationnames=["khkj","hujg"];
            
                    for(i=0;i<15;i++)
                    {
                        stationnames[i]=(stations[i].name).toString()+"-"+(stations[i].code).toString();
                       // document.write(stations[i]);
                    }
                
                
                $('#destination').autocomplete({
                    source: stationnames
                },{
                    minLength:2
                });
                
                //console.log(stationnames[5]);
               console.log(mydata);
           
    };
    myrequest.send();
   });
  }); 
    
    
     </script> 
    
    
        
    <script>
      /*   $(document).ready(function(){   
           
           $('#signinbutton').click(function(){
                $('#signinmodal').modal('show');
           });
           
        
            */
     
             
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
        <%-- <div id="navig_bar" class="navbar">
                <ul >
                    <li ><a href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i>Home</a></li>
                    <li>  <a href="trains.jsp" ><i class="fa fa-train" aria-hidden="true"></i>Trains</a></li>
                    <li>    <a href="flight.jsp" ><i class="fa fa-plane" aria-hidden="true"></i>Flights</a> </li>
                    <li>  <a href="hotels.jsp" ><i class="fa fa-bed" aria-hidden="true"></i>Hotels</a> </li>
                    <li> <a href="plan.jsp" ><i class="fa fa-map-marker" aria-hidden="true"></i>Plan Your Trip</a> </li>
                    <li><a href="help.jsp"><i class="fa fa-question-circle" aria-hidden="true"></i>Help</a></li>
                    <li><a href="signup.jsp">Sign up</a></li>
                    <li><input type="button" class="btn btn-link" value="Sign in"></li>
                </ul>
                </div>  --%>
       <div class="row">
               
               
              <div class="col-md-4">
                    <form action="trains_info.jsp" method="GET" onsubmit="return valid();">
            <center><h1>Search Train</h1></center>
            
             <label class="label">From</label> 
            <div class="input-group">
                 
            <input class="form-control" type="text" name="source" id="source">
            
            </div>
              <p id="p1" style="display:none;color:red;">Enter source</p>
             <p id="p4" style="display:none;color:red;">Enter valid source</p>
             <label class="label">To</label> 
            <div class="input-group">
            <input  class="form-control" type="text" name="dest" id="destination">
            
            </div>
             <p id="p2" style="display:none;color:red;">Enter destination</p>
               <p id="p5" style="display:none;color:red;">Enter valid destination</p>
            <label class="label">Date</label> 
            <div class="input-group">
            <input class="form-control" type="date" name="date" id="date">
            
            </div>
              <p id="p3" style="display:none;color:red;">Enter date</p>
            </br>
            <center>  <input class="btn btn-success" type="submit" name="search"></center>
        </form>
               </div>
                </div>
       
      
        
      
       
     <script>
         function valid()
         {
        
             var source=document.getElementById("source").value;
             console.log(source);
             var dest=document.getElementById("destination").value;
             var date=document.getElementById("date").value;
             var regx=/^([A-Za-z ]+)-([A-Za-z]+)/;
             var flag=1;
             if(source=="")
             {
                 document.getElementById("p1").style.display="block";
                 document.getElementById("source").style.border="3px solid red";
                 flag=0;
             }
             if(source!="")
             {
                 document.getElementById("p1").style.display="none";
                 document.getElementById("source").style.border="0px";
                 //flag=0;
             }
             if(dest=="")
             {
                 document.getElementById("p2").style.display="block";
                  document.getElementById("destination").style.border="3px solid red";
                 flag=0;

             }
             if(dest!="")
             {
                 document.getElementById("p2").style.display="none";
                  document.getElementById("destination").style.border="0px";
                 //flag=0;

             }
             if(date=="")
             {
          
                  document.getElementById("p3").style.display="block";
                document.getElementById("date").style.border="3px solid red";
                 flag=0;

             }
             if(date!="")
             {
          
                  document.getElementById("p3").style.display="none";
                document.getElementById("date").style.border="0px";
                 //flag=0;

             }
           if(!regx.test(source))
           {
                document.getElementById("p4").style.display="block";
               
                 document.getElementById("source").style.border="3px solid red";
                 flag=0;
           }
           if(regx.test(source))
           {
                document.getElementById("p4").style.display="none";
               
                 document.getElementById("source").style.border="0px";
                 //flag=0;
           }
           if(!regx.test(dest))
           {
                document.getElementById("p5").style.display="block";
                 document.getElementById("destination").style.border="3px solid red";
                 flag=0;
           }
           if(regx.test(dest))
           {
                document.getElementById("p5").style.display="none";
                 document.getElementById("destination").style.border="0px";
                 //flag=0;
           }
             if(flag==0)
             {
                 
                 return false;
                 
             }
             else
             {
             
                 return true;
             }
         }
         
        
     </script>
    </body>
</html>