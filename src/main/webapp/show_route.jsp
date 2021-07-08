<%-- 
    Document   : show_route
    Created on : 10 Mar, 2019, 9:09:04 PM
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
        
        
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" src="style.css"></link>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="navbar.css" rel="stylesheet">
        <title>Check Route</title>
        <style>
            body{
                background-color: lavender;
            }
            .places{
                background-color: antiquewhite;
            }
             #map {
        height: 400px;  /* The height is 400 pixels */
        width: 100%;  /* The width is the width of the web page */
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
               left:380px;
           }
           .navbar
           {
               position: relative;
               top:0px;
           }
           p,h1,img{
               padding:10px;
               margin:10px;
           }
           .places
           {
               margin:10px;
               padding:10px;
                box-shadow: 3px 3px 3px gray;
           }
           
           h2,h4{
                padding:10px;
                text-shadow: 0 0 3px gray;
            }
            .input1{
                width:200px;
            }
        </style>
        
        
    </head>
       <%
             String userid=(String)session.getAttribute("sess_userid");
            %>
       
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
                                 <input type="hidden" name="pageurl" value="show_route">
                             </form>
            <br/>
     
            <a href="forgot.jsp">Forgot Password?</a>
            <p>Don't have an account?<a href="signup.jsp">Sign Up</a></p>
             
       
                        </div>
                        
                       
                       
                
                </div>
                </div>
                </div> 
      
 
              <div id="navig_bar" class="navbar">
                <ul>
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
    $('#citydest').keyup(function(){
          var cityname=$('#citydest').val();
          console.log(cityname);
          var url='https://maps.googleapis.com/maps/api/place/autocomplete/json?input='+cityname+'&key=AIzaSyAU31-paxEOkGz3VzsJ71k5VEs01W64QJE';
          var myrequest=new XMLHttpRequest();
          myrequest.open('GET',url);
          myrequest.onload = function(){
                var mydata = JSON.parse(myrequest.responseText);
                var places=mydata.predictions;
                var i;
                var x=places.length;
                var stationnames=["khkj","hujg"];
            
                    for(i=0;i<x;i++)
                    {
                        stationnames[i]=(places[i].description).toString();
                       // document.write(stations[i]);
                    }
                
                
                $('#citydest').autocomplete({
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
                
            
        <%
            
            String[] places1=request.getParameterValues("selected");
            String[] names1=request.getParameterValues("selectedname");
            String[] photo_refs1 = request.getParameterValues("selectedphoto");
            String[] address1=request.getParameterValues("selectedaddress");
            int length1=places1.length;
            //out.println(length1);
            String[] addr=new String[length1];
            String[] latitudes=new String[length1];
            String[] longitudes=new String[length1];
            String placeid,name,address2,photo_ref1;
        int o=9;
            for(int i=0;i<length1;i++)
            {
             
            
            String[] addr_comp1=address1[i].split("##");
            addr[i]=addr_comp1[0];
            String[] latitude1=addr_comp1[1].split("%%");
            latitudes[i]=latitude1[0];
            String[] addr_comp2=address1[i].split("%%");
            longitudes[i]=addr_comp2[1];
           
            
             //konsa label hai marker ka vo bhi likhna hai 1-A 2-B etc
             
            }
            %>
            
             <div id="map">
                
                
            </div>    
           
              
                 
                 
            <form action="route_final.jsp" method="GET" id="form1234">
                <br>
              
                <center> Enter starting point: <input  type="text" id="citydest" name="start_addr"></center>
                
                 <% for(int g=0;g<length1;g++){ %>
                        
                        
                       <input type="hidden" name="latitudes" value="<% out.print(latitudes[g]); %>"> 
                       <input type="hidden" name="longitudes" value="<% out.print(longitudes[g]); %>">
                       <input type="hidden" name="names" value="<% out.print(names1[g]); %>">
                       <input type="hidden" name="address" value="<% out.print(addr[g]); %>">
                       <input type="hidden" name="photo_ref" value="<% out.print(photo_refs1[g]); %>">
                       
                
                <%
                  }
                %>
                
                <br>   <center>  <input class="btn btn-success" type="submit" ></center>
                
            </form>
                 
             
              <div class="container">
          
            <%
             try{
            for(int i=0;i<length1;i++)
            {
                
            %>
                
           
            <div class="places" id="<% out.print(places1[i]); %>">
            
                <%
                     placeid= places1[i];
                     name=names1[i];
                     String[] addr_comp1=address1[i].split("##");
                    address2=addr_comp1[0];
                     photo_ref1=photo_refs1[i];
                        
           %>
            
            <img height=200" width="200" src="https://maps.googleapis.com/maps/api/place/photo?maxwidth=200&photoreference=<%out.print(photo_ref1);%>&key=AIzaSyAU31-paxEOkGz3VzsJ71k5VEs01W64QJE">
            <h1><% out.print((char)(65+i)); %></h1>
            <h2><a href="place.jsp?placeid=<% out.print(placeid); %>" ><% out.println(name); %></a></h2>
            <h4><%out.print(address2); %></h4>
            
             
             <button class="btn btn-success" id="<% out.print(i); %>" onclick="removeplace(this.id)"  value="<% out.print(places1[i]); %>">Remove this place</button>
             
               </div>
           
           
            
           
        
 
              <%
          
          }

     // out.print(o);
            %>
            </div>
                           <script>
                    <%int j=0; %>
                        var labels="ABCDEFGHIJKLMNOPRSTUVWXYZ";
                        var labelIndex=0;
                        var marker={};
                        var id=0;
                        var remid=2;
                        function changeId(){
                            return id++;
                        }
                    function initMap() {
                        //var i;
                       
                        var l=<%out.print(length1); %>
                        var locations= new Array(l);
                        //var marker = new Array(l);
                       
                     // The location of Uluru
                     var k=0;
                     
                     var m=0;
                     <% for(j=0;j<length1;j++){ %>
                     
                         
                       
                        
                        
                          latlng=[<% out.print(latitudes[j]); %>,<% out.print(longitudes[j]); %>];
                          
                          locations[k]=latlng;
                          console.log(locations[k]+k);
                          //console.log(latlng+k);
                          console.log(<% out.print(j);%>);
                          k++;
                          
                         
                      
                     <% } %>
                     var city = {lat: <% out.print(latitudes[0]); %>, lng: <% out.print(longitudes[0]); %>};
                     // The map, centered at the given city
                     var map = new google.maps.Map(
                     document.getElementById('map'), {zoom: 10, center: city, mapTypeId: google.maps.MapTypeId.ROADMAP });
                     var latstart=locations[0][0]+0.1;
                     var longstart=locations[0][1]+0.1;
                     console.log(latstart);
                     console.log(longstart);
                     var marker1= new google.maps.Marker({
                         
                              position: new google.maps.LatLng(latstart, longstart),
                                 map: map,
                                 label: {text: "start"},
                                 draggable: true
        
                        });
                        google.maps.event.addListener(marker1, "mouseup", function (event) {
                    alert(this.position);
                    });
                     labelIndex=0;
                      for (i = 0; i < locations.length; i++) {  
                                 var markerid=changeId();
                                 marker[markerid] = new google.maps.Marker ({
                                 id:markerid,   
                                 position: new google.maps.LatLng(locations[i][0], locations[i][1]),
                                 map: map,
                                 label: labels[labelIndex++ % labels.length]
                             });
                            // markers[markerid]=marker;
                             
                 }
                 
}
console.log(marker);

function removeplace(id){
    remid=id;
    var marker_rem=marker[id];
    marker_rem.setMap(null);
    var placeremove=document.getElementById(id).value;
    console.log(placeremove);
    document.getElementById(placeremove).style.display="none";
   //alert(remid);
   var input = document.createElement('input');
   input.type="hidden";
   input.name="removed";
   input.value=id;
   var form1=document.getElementById('form1234');
   form1.appendChild(input);
     
}

    </script>
  
   
 <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAU31-paxEOkGz3VzsJ71k5VEs01W64QJE&callback=initMap">
    </script>
            
            
            <%
          }catch(Exception e)
          {   
                    out.println(e);
            }
          %>
           
    </body>
</html>
