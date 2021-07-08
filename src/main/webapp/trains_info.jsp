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
        <style>
           
            .train_info{
                background-color: powderblue;
                padding:20px;
                margin-top:20px;
                margin-bottom:0px;
                box-shadow: 3px 3px 3px gray;
            }
            
            #availnavbar{
                display:inline;
            }
            .hide{
                display:none;
            }
            .header
            {
                background-color:lightgray;
                padding-bottom: 10px;
                padding-top: 10px;
                word-spacing: 20px;
               
            }
            .header ul
            {
                margin-left: 10px;
               margin-right: 60px;
            }
            .available_info
            {
                background-color:lavender;
               padding-bottom:0px;
                padding-top:0px;
               
                border-right:solid 0.5px gray; 
                border-left:solid 0.5px gray; 
                
            }
           span
            {
                margin-top: 10px;
                padding-top: 10px;
              
                margin-left:0px;
                padding-left:0px;
                padding-right:0px;
            }
           .hidden_span 
            {
                margin-top:10px;
                margin-left:10px;
                margin-bottom:10px;
                padding-bottom:10px;
                padding-right:0px;
                
            }
            a{
                text-decoration: none;
                color:white;
            }
            
            .availability_final{
                height:70px;
               
                 background-color: lavender;
               box-shadow: 3px 3px 3px gray;
                
            }
            .spaced1{
                width:10%;
                display:inline;
            }
            .spaced2{
                width:20%;
                display:inline;
            }
            .spaced3{
                width:10%;
                display:inline;
            }
            .spaced4{
                width:10%;
                display:inline;
            }
            .spaced5{
                width:10%;
                display:inline;
            }
            .spaced6{
                width:10%;
                display:inline;
            }
            .spaced7{
                width:20%;
                display:inline;
            }
            #load{
                width:100%;
                height:100%;
                position:fixed;
                z-index:9999;
                background:url("trainload.gif") no-repeat center center ;
            }
            #navig_bar{
                position:relative;
                top:0px;
            }
              .nava{
               color:white;
           }
           #signinbutton{
               display:none;
               color:white;
               position:relative;
               left:380px;
           }
           h1{
               text-align: center;
               
           }
           p{
               text-align: center;
           }
           
           
        </style>
        <%
             String userid=(String)session.getAttribute("sess_userid");
            %>
        
        
        <script>
            $(document).ready(function()
            {
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
            document.onreadystatechange = function () {
            var state = document.readyState
             if (state == 'interactive') {
                  document.getElementById('contents').style.visibility="hidden";
             } else if (state == 'complete') {
                 setTimeout(function(){
                     document.getElementById('interactive');
                     document.getElementById('load').style.display="none";
                     document.getElementById('contents').style.visibility="visible";
             },1500);
         }
       }
            
            </script>
        
    </head>
   
    
    
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
                                 <input type="hidden" name="pageurl" value="trains_info">
                             </form>
            <br/>
     
            <a href="forgot.jsp">Forgot Password?</a>
            <p>Don't have an account?<a href="signup.jsp">Sign Up</a></p>
             
       
                        </div>
                        
                       
                       
                
                </div>
                </div>
                </div> 

        <div id="load">
            <center><h2>Searching trains.....</h2></center>
        </div>
            <div id="contents">
        <%
          
             try{
               
               
               
               TrustManager[] trustAllCerts = new TrustManager[] {new X509TrustManager() {
                public java.security.cert.X509Certificate[] getAcceptedIssuers() {
                    return null;
                }
                public void checkClientTrusted(X509Certificate[] certs, String authType) {
                }
                public void checkServerTrusted(X509Certificate[] certs, String authType) {
                }
            }
        };
 
        // Install the all-trusting trust manager
        SSLContext sc = SSLContext.getInstance("SSL");
        sc.init(null, trustAllCerts, new java.security.SecureRandom());
        HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
 
        // Create all-trusting host name verifier
        HostnameVerifier allHostsValid = new HostnameVerifier() {
            public boolean verify(String hostname, SSLSession session) {
                return true;
            }
        };
 
        // Install the all-trusting host verifier
        HttpsURLConnection.setDefaultHostnameVerifier(allHostsValid);
            
     String date=new String();
     String from=new String();
     String to=new String();
     from= request.getParameter("source");
     //out.print(from);
     date= request.getParameter("date");
     //out.print(date);
     to= request.getParameter("dest");
     
     
    //from="n-ndls";
     //to="j-jp";
     //date="2019-04-10";
     String[] sourcecode=from.split("-");
     String[] destcode=to.split("-");
     String[] data= date.split("-");
     session.setAttribute("sess_sourcecode",from);
     session.setAttribute("sess_destcode",to);
     session.setAttribute("sess_date",date);
     //out.println(data[2]);
     String url = "https://api.railwayapi.com/v2/between/source/"+sourcecode[1]+"/dest/"+destcode[1]+"/date/"+data[2]+"-"+data[1]+"-"+data[0]+"/apikey/8i358aqu6k/";
     //out.println(url);
     URL obj = new URL(url);
     String charset = "UTF-8";
     HttpURLConnection con = (HttpURLConnection) obj.openConnection();
     con.setRequestMethod("GET");
     con.setRequestProperty("Accept-Charset", charset);
     int responseCode = con.getResponseCode();
     //System.out.println("\nSending 'GET' request to URL : " + url);
     //System.out.println("Response Code : " + responseCode);
     BufferedReader in = new BufferedReader(
             new InputStreamReader(con.getInputStream()));
     String inputLine;
     StringBuffer response1 = new StringBuffer();
     while ((inputLine = in.readLine()) != null) {
     	response1.append(inputLine);
     }
     in.close();
    //  out.println(response1.toString());
     JSONObject myResponse = new JSONObject(response1.toString());
     int no;
     no=myResponse.getInt("total");
     //out.println(no);
     JSONArray trains=myResponse.getJSONArray("trains");
     
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
                        <li><button id="signinbutton" class="btn btn-link" >Sign in/Sign Up</button></li>
             
                    <%--<li><input style="color:white" id="signinbutton" type="button" class="btn btn-link" value="Sign in/SignUp"></li>--%>
                </ul>
                </div>  
    <center>  <h1><%out.println(sourcecode[0]);%>  to   <%out.println(destcode[0]);%> on <%out.println(data[2]+"-"+data[1]+"-"+data[0]);%></h1></center>
             
   
    
     <form  action="booking_train.jsp" method="POST" id="form123">
         <%-- <table border="3" class="info">   --%>
         
         
         
         <div class="container">
             
             <center><span>
             <button class="btn btn-success"><a href="hotels_info.jsp?city=<% out.print(to); %>">Check hotels for the destination</a></button>
             <button class="btn btn-success"> <a href="plan_info1.jsp?city=<% out.print(to); %>">Check places to visit in the destination</a></button>
             </span>
             </center>
             <br>
             <br>
             <div class="header">
             <ul>
                    
                 <span>   
                     <div  class="spaced1"> TrainNo. </div>
                       <div  class="spaced2">   TrainName.</div>
                      <div class="spaced3">    Source </div>
                      <div class="spaced4">     Destination </div>
                      <div class="spaced5">    DeptTime </div>
                      <div class="spaced6">     ArrivalTime</div>
                      
                     <div class="spaced7">    Availability </div>
                 </span>
            </ul> 
             </div>
          
             
               
     <%
     for(int i=0;i<no;i++)
     {
         JSONObject train_detail=trains.getJSONObject(i);
      
         String Trainno,Train_Name,Source,Departure_time,Destination,Arrival_time;
         Trainno=train_detail.getString("number");
         Train_Name=train_detail.getString("name");
         JSONObject from_stn=train_detail.getJSONObject("from_station");
         Source=from_stn.getString("name");
         JSONObject to_stn=train_detail.getJSONObject("to_station");
         Departure_time=train_detail.getString("src_departure_time");
         Destination=to_stn.getString("name");
         Arrival_time=train_detail.getString("dest_arrival_time");
         //Travel_time=train_detail.getString("travel_time");
           %>
       
             
           <div class="train_info"> 
              
                 
               <span>  
                   <div class="spaced1"> <% out.println(Trainno);%></div>&nbsp;&nbsp;
                       <div class="spaced2">   <% out.println(Train_Name);%> </div>&nbsp;&nbsp;
              <div class="spaced3">  <% out.println(Source); %> </div>&nbsp;&nbsp;
              <div class="spaced4">  <% out.println(Destination); %> </div>&nbsp;&nbsp;
              <div class="spaced5">  <%out.println(Departure_time); %></div>&nbsp;&nbsp;
             <div class="spaced6">   <% out.println(Arrival_time); %></div></span> &nbsp;&nbsp;
                  
              
         
                  
                <input class="spaced7" type="button" onclick="available(this.id)" id="<% out.print(Trainno); %>" value="Check Availaibility">
               </tr>
           </div>
           
                    <%  
                        String availid = "avail"+Trainno+"id";  
                        String bookid = Trainno;
                        String classcodename="classcode1"+bookid;
                        String prefcodename="prefcode1"+bookid;
                        String trainnamename="trainname"+bookid;
                        String arrivaltimename="arrivaltime"+bookid;
                        String departuretimename="departuretime"+bookid;
                       
                    %>
                 
            <div id="<% out.print(availid); %>" class="hide available_info">
                
                <div id="availnavbar">
                    
                
                        <span >
                            <input type="button" id="1A" onclick="getclasscode(this.id)" value="1 AC" name="classcode" style="margin-top:10px;">
                        
                        
                             <input type="button" id="2A" onclick="getclasscode(this.id)" value="2 AC" name="classcode" style="margin-top:10px;">
                       
                        
                            <input type="button" id="3A" onclick="getclasscode(this.id)" value="3 AC" name="classcode" style="margin-top:10px;">
                        
                             <input type="button" id="SL" onclick="getclasscode(this.id)" value="Sleeper" name="classcode" style="margin-top:10px;">
                       
                             <input type="button" id="CC" onclick="getclasscode(this.id)" value="Chair Car" name="classcode" style="margin-top:10px;">
                     
                        <input type="hidden" name="classcode1" id="<%=classcodename%>" value="SL" style="margin-top:10px;">
                        <input type="hidden" name="prefcode1" id="<%=prefcodename%>" value="GN" style="margin-top:10px;">
                        
                        <input type="hidden" name="trainno1" id="trainno" style="margin-top:10px;" value="<% out.print(Trainno);%>">
                        <input type="hidden" name="trainname1" id="trainname" style="margin-top:10px;" value="<% out.print(Train_Name);%>">
                        <input type="hidden" name="departuretime1" id="dept_time" style="margin-top:10px;" value="<%out.print(Departure_time); %>">
                        <input type="hidden" name="arrivaltime1" id="arr_time" style="margin-top:10px;" value="<% out.print(Arrival_time); %>">
                        
                        
                    </span>
                 </div>
                
                
                
                        <button type="submit" name="book" value="<%=i%>" style="margin-top:10px;margin-left:20px;">Book</button>
                
               <div class="availability_final" id="<% out.println("avail"+Trainno);%>">
                   
                   <span>&nbsp;&nbsp;<b>Availability:</b><p style="display:inline" id="<% out.print("available"+Trainno);%>"></p><br>&nbsp;&nbsp;<b>Fare:</b><p style="display:inline" id="<% out.print("fare"+Trainno);%>"> </p></span>
                    
                   
               </div>
                
                </div>    
                     
     
         <% 
           
                }
            %>
            
     
      </div>
    </form> 
           
            
            <script>
                         var mydata1,id2;
                  function available(id){ 
                     var classcode='SL';
                    var prefcode="GN";
                     //document.getElementById('trainname1').value = "";
                    console.log(id);
                    id2=id
                    var nameofdiv1="avail"+id+"id";
                    var finaldiv1=document.getElementById(nameofdiv1);
                    finaldiv1.style.display = "inline";
                   
                   
                    var myrequest1 = new XMLHttpRequest();
                    var myrequest2 = new XMLHttpRequest();
                    var url1='https://api.railwayapi.com/v2/check-seat/train/'+id+'/source/<% out.print(sourcecode[1]); %>/dest/<% out.print(destcode[1]); %>/date/<% out.print(data[2]+"-"+data[1]+"-"+data[0]); %>/pref/SL/quota/GN/apikey/8i358aqu6k/';
                    var url3='https://api.railwayapi.com/v2/fare/train/'+id+'/source/<% out.print(sourcecode[1]); %>/dest/<% out.print(destcode[1]); %>/age/25/pref/SL/quota/GN/date/<% out.print(data[2]+"-"+data[1]+"-"+data[0]); %>/apikey/8i358aqu6k/';
                    console.log(url1);
                    myrequest1.open('GET',url1);
                    myrequest1.send();
                    myrequest2.open('GET',url3);
                    myrequest2.send();
                     var class1=document.getElementById('classcode1'+id);
                        var pref=document.getElementById('prefcode1'+id);
                        class1.value = classcode;
                        pref.value = prefcode;
                         var nameofdiv="avail"+id+"id";
                        var finaldiv=document.getElementById(nameofdiv);
                        finaldiv.style.display = "block";
                        if(myrequest1.readyState==1)
                        {   
                            document.getElementById("available"+id).innerHTML="   Getting availability. Please wait....";
                          document.getElementById("fare"+id).innerHTML="   Getting fare. Please wait....";
                        }
                       myrequest1.onreadystatechange=function(){    
                        var  state=myrequest1.readyState;
                        console.log(state);
                        if(state!=4){
                          document.getElementById("available"+id).innerHTML="   Getting availability. Please wait....";
                          document.getElementById("fare"+id).innerHTML="   Getting fare. Please wait....";
                        
                    }
                    if(state==4){
                        setTimeout(function(){
                            
                                document.getElementById("available"+id).innerHTML="   Could not get availability.Please try again later.";
                                 document.getElementById("fare"+id).innerHTML="   Could not get fare.Please try again later.";
        
        
                        },1000);
                         
                        //var mydata1=null;
                        //var mydata2=null;
                        var mydata1=JSON.parse(myrequest1.responseText);
                        var mydata2=JSON.parse(myrequest2.responseText);
                        console.log(mydata1);
                        console.log(mydata2);
                        var status1=mydata1.availability[0];
                        var status=mydata1.availability[0].status;
                        var fare=mydata2.fare;
                        console.log(mydata1.response_code);
                        console.log(status);
                        console.log(fare);
                         if(!((typeof status === undefined)||status==null))
                        {
                            console.log("available"+id);
                            document.getElementById("available"+id).innerHTML=status;
                        }
                       if(!((typeof fare === undefined)||fare==null))
                        {
                            console.log("available"+id);
                            document.getElementById("available"+id).innerHTML=fare;
                        }
                        var input1 = document.createElement("input");
                        input1.type = "hidden";
                        input1.name = "availability";
                        input1.id="availableinput"+id2;
                        input1.value = status;

                        var container = document.getElementById('form123');
                        //container.appendChild(breakNode);
                        container.appendChild(input1);
                         var input2 = document.createElement("input");
                        input1.type = "hidden";
                        input1.name = "fare";
                        input1.id="fareinput"+id2;
                        input1.value = fare;

                        var container = document.getElementById('form123');
                        //container.appendChild(breakNode);
                        container.appendChild(input1);
                       <%-- if(fare=="")
                        {
                            console.log("available"+id);
                            document.getElementById("fare"+id).innerHTML="Sorry, could not load fare. Please try again later";
                        }--%>
                       
                        <%--if(fare!="")
                        { 
                            console.log("available"+id);
                            document.getElementById("fare"+id).innerHTML=mydata2.fare;
                        }
                        var availdiv=document.createElement('div');
                        var para=document.createElement('p');
                        var para1=document.createElement('p');
                        para.innerText = status;
                        para1.innerText = mydata2.fare;
                       
                        
                        availdiv.appendChild(para);
                         availdiv.appendChild(para1);
                        
                        finaldiv.appendChild(availdiv);--%>
                    
                   }
                    };
                }
                    //myrequest1.onload = function(){
                       
                
                    function getclasscode(id1)
                    {
                        var classcode=id1;
                        //var prefcode=document.getElementById('prefcode').value;
                         var myrequest3 = new XMLHttpRequest();
                         var myrequest4 = new XMLHttpRequest();
                    var url2='https://api.railwayapi.com/v2/check-seat/train/'+id2+'/source/<% out.print(sourcecode[1]); %>/dest/<% out.print(destcode[1]); %>/date/<% out.print(data[2]+"-"+data[1]+"-"+data[0]); %>/pref/'+classcode+'/quota/GN/apikey/8i358aqu6k/';
                    var url4='https://api.railwayapi.com/v2/fare/train/'+id2+'/source/<% out.print(sourcecode[1]); %>/dest/<% out.print(destcode[1]); %>/age/25/pref/'+classcode+'/quota/GN/date/<% out.print(data[2]+"-"+data[1]+"-"+data[0]); %>/apikey/8i358aqu6k/';
                    console.log(url2);
                    myrequest3.open('GET',url2);
                    myrequest3.send();
                    myrequest4.open('GET',url4);
                    myrequest4.send();
                    var class1=document.getElementById('classcode1'+id2);
                       // var pref=document.getElementById('prefcode1'+id2);
                        class1.value = classcode;
                        //pref.value = prefcode;
                    var nameofdiv="avail"+id2+"id";
                        var finaldiv=document.getElementById(nameofdiv);
                        finaldiv.style.display = "block";
                        if(myrequest3.readyState==1)
                        {   
                            document.getElementById("available"+id2).innerHTML="Getting availability. Please wait....";
                          document.getElementById("fare"+id2).innerHTML="Getting fare. Please wait....";
                        }
                       myrequest3.onreadystatechange=function(){    
                        var  state=myrequest3.readyState;
                        console.log(state);
                        if(state!=4){
                          document.getElementById("available"+id2).innerHTML="Getting availability. Please wait....";
                          document.getElementById("fare"+id2).innerHTML="Getting fare. Please wait....";
                        
                    }
                    if(state==4){
                        setTimeout(function(){
                            
                                document.getElementById("available"+id2).innerHTML="Could not get availability.Please try again later.";
                                 document.getElementById("fare"+id2).innerHTML="Could not get fare.Please try again later.";
        
        
                        },1000);
                         
                        //var mydata1=null;
                        //var mydata2=null;
                        var mydata3=JSON.parse(myrequest3.responseText);
                        var mydata4=JSON.parse(myrequest4.responseText);
                        console.log(mydata3);
                        console.log(mydata4);
                        var status1=mydata3.availability[0];
                        var status=status1.status;
                        var fare=mydata4.fare;
                        console.log(mydata3.response_code);
                        console.log(status);
                        console.log(fare);
                         if(!((typeof status === undefined)||status==null))
                        {
                            console.log("available"+id2);
                            document.getElementById("available"+id2).innerHTML=status;
                        }
                       if(!((typeof fare === undefined)||fare==null))
                        {
                            console.log("available"+id2);
                            document.getElementById("available"+id2).innerHTML=fare;
                        }
                       
                       document.getElementById("availableinput"+id2).value=status;
                       document.getElementById("fareinput"+id2).value=fare;
                    
                   }
                    };
                }
                    
                    </script>
    
    <%
           }
        
           catch(Exception ex)
           {
               out.println(ex);
               %>
               
               <div>
                   
                   <center><i style="height:100px; width:100px;" class="fa fa-exclamation-triangle fa-lg" aria-hidden="true"></i> <h2>Sorry, Trains for given input could not be loaded right now. Please try again later.</h2></center>
                   
                   
               </div>
               
               <%
           }
        
    %>
            </div>
       
    </body>
</html>