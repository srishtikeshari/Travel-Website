
<%-- 
    Document   : hotels
    Created on : 18 Jan, 2019, 4:36:40 PM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="navbar.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" src="style.css"></link>
        
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <title>JSP Page</title>

        <style>
            .hotel_detail{
                background-color:antiquewhite;
            }
              
            #navig_bar
            {
                position:relative;
                top:0px;
            }   
            #signinbutton{
               display:none;
               color:white;
               position:relative;
               left:350px;
           }
           
            #load{
                width:100%;
                height:100%;
                position:fixed;
                z-index:9999;
                background:url("hotelload.gif") no-repeat center center ;
            }
            img
            {
                padding:10px;
                margin:10px;
            }
            .hotel_detail
            {
                 box-shadow: 3px 3px 3px gray;
            }
            img
            {
                transition: 1s;
            }
            img:hover
            {
                transform: scale(1.1);
                transition: 1s;
            }
            h2,h4{
                padding:10px;
                text-shadow: 0 0 3px #FF0000;
            }
            body
            {
                background-color: lavender ;
            }
            .hotel_detail:hover
            {
                -moz-box-shadow: 0 0 10px #ccc;
		-webkit-box-shadow: 0 0 10px #ccc;
		box-shadow: 0 0 10px #ccc;
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
        
         <div id="load">
            <center><h2>Searching hotels.....</h2></center>
        </div>
        
        <div id="contents">
        
        
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
                                 <input type="hidden" name="pageurl" value="hotels_info">
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
                
               
        <%
            try {
                String city = request.getParameter("city");
                
                %>
                <center> <h2>Hotels in <%out.print(city);%></h2></center>
                <%
                String url = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=" + city + "&inputtype=textquery&fields=geometry&key=AIzaSyAU31-paxEOkGz3VzsJ71k5VEs01W64QJE";
                URL obj = new URL(url);
                String charset = "UTF-8";
                HttpURLConnection con = (HttpURLConnection) obj.openConnection();
                con.setRequestMethod("GET");
                con.setRequestProperty("Accept-charset", charset);
                BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
                StringBuffer response1 = new StringBuffer();
                String inputLine;
                while ((inputLine = in.readLine()) != null) {
                    response1.append(inputLine);
                }
                in.close();
                JSONObject object = new JSONObject(response1.toString());
                //out.println(response1.toString());
                JSONArray latlng = object.getJSONArray("candidates");
                JSONObject coordinates = latlng.getJSONObject(0);
                JSONObject geometry = coordinates.getJSONObject("geometry");
                JSONObject location = geometry.getJSONObject("location");
                double lat = location.getDouble("lat");
                double lng = location.getDouble("lng");
               // out.println(lat + " " + lng);
                con.disconnect();

                String url1 = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=" + lat + "," + lng + "&radius=5000&fields=name,rating,vicinity,photos&type=lodging&key=AIzaSyAU31-paxEOkGz3VzsJ71k5VEs01W64QJE";
                URL obj1 = new URL(url1);
                HttpURLConnection con1 = (HttpURLConnection) obj1.openConnection();
                con1.setRequestMethod("GET");
                con1.setRequestProperty("Accept-charset", charset);
                BufferedReader in1 = new BufferedReader(new InputStreamReader(con1.getInputStream()));
                StringBuffer response2 = new StringBuffer();
                String inputLine1;
                while ((inputLine1 = in1.readLine()) != null) {
                    response2.append(inputLine1);
                }
                in1.close();
                //out.println(response2.toString());
                JSONObject object1 = new JSONObject(response2.toString());
                String status1 = object1.getString("status");
             //   out.println(status1);
                JSONArray hotels = object1.getJSONArray("results");
                %>
                <div class="container"> 
                <%
                for (int i = 0; i < 19; i++) {
                    JSONObject hotel_details = hotels.getJSONObject(i);
                    //JSONObject geometry1=hotel_details.getJSONObject("geometry");
                    String name = (String) hotel_details.getString("name");
                    String placeid = (String) hotel_details.getString("place_id");
                    String photo_ref = null;
                    if (hotel_details.has("photos")) {
                        JSONArray photos = hotel_details.getJSONArray("photos");
                        JSONObject photo_no = photos.getJSONObject(0);
                        photo_ref = (String) photo_no.getString("photo_reference");
                    }
                    //double rating =hotel_details.getDouble("rating");
                    String address = (String) hotel_details.getString("vicinity");
                    Double rating=0.0;
                    if(hotel_details.has("rating")){
                        rating = (Double)hotel_details.getDouble("rating");
                    }
        %> 
         
        <div class="hotel_detail">

            <%
                if (photo_ref != null) {
                    // Thread.sleep(2000);
            %>


            <img height="250" width="250" src="https://maps.googleapis.com/maps/api/place/photo?maxwidth=200&photoreference=<%out.println(photo_ref);%>&key=AIzaSyAU31-paxEOkGz3VzsJ71k5VEs01W64QJE">
            <%
            } else {
            %>
            <img height="250" width="250" src="black.png">
            <%
                }
            %>
            <h2><a href="place.jsp?placeid=<% out.print(placeid); %>" ><% out.println(name); %></a></h2>
            <h4><% out.println(address); %></h4>
            <%
                if(rating!=0.0){
                %>
             <h4><b>Rating: &nbsp;</b><% out.println(rating); %></h4>
            
            <%
                }
                %>


        </div>
        <%
                }

            } catch (Exception e) {
                out.println(e);
            }
        %>
    </form>
    </div>
        </div>
</body>
</html>