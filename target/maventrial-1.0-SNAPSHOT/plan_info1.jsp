<%-- 
    Document   : plan_info
    Created on : 23 Feb, 2019, 4:07:19 PM
    Author     : srishti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link type="text/css" rel="stylesheet" href="navbar.css">
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  
    <style>
        body{
            background-color: lavender;
        }
        .info{
            background-color: antiquewhite;
        }
        #signinbutton{
               display:none;
               color:white;
               position:relative;
               left:380px;
           }
            #navig_bar
            {
                position:relative;
                top:0px;
            }
             #load{
                width:100%;
                height:100%;
                position:fixed;
                z-index:9999;
                background:url("planload.gif") no-repeat center center ;
            }
            .info{
                margin:10px;
                padding:10px;
                  box-shadow: 3px 3px 3px gray;
            }
            .info:hover
            {
                -moz-box-shadow: 0 0 10px #ccc;
		-webkit-box-shadow: 0 0 10px #ccc;
		box-shadow: 0 0 10px #ccc;
            }
            img{
                margin:10px;
            }
            h3{
                 margin: 20px;
        -webkit-transition: color 2s; /* For Safari 3.0 to 6.0 */
        transition: color 2s; /* For modern browsers */
            }
            h3:hover{
                color: #ff0000;
            }
             #a1:hover{
                color: #ff0000;
            }
            #a1{
                 margin: 20px;
        -webkit-transition: color 2s; /* For Safari 3.0 to 6.0 */
        transition: color 2s; /* For modern browsers */
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
            function changename(id){
                
                console.log(id);
                document.getElementById(id).setAttribute("name","selected");
                
            }
            function changeaddressname(id){
                
                
                var changeid="address"+id;
                document.getElementById(changeid).setAttribute("name","selectedaddress");
                
            }
            function changename1(id){
                
                
                document.getElementById("name"+id).setAttribute("name","selectedname");
                
            }
            function changephotoname(id){
                
               
                document.getElementById("photo_ref"+id).setAttribute("name","selectedphoto");
                
            }
            
            
            
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
            <center><h2>Searching places.....</h2></center>
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
                                 <input type="hidden" name="pageurl" value="plan_info1">
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
                <center><h2>Select the places you want to visit</h2></center>
                <div class="container">
        <%
            
                String cityname=request.getParameter("city");
                session.setAttribute("sess_plancity",cityname);
                String city=cityname.replace(" ","+");
                //String range=request.getParameter("range");
                //String city="gangtok";
                String url="https://maps.googleapis.com/maps/api/place/textsearch/json?query="+city+"+city+tourist+places&language=en&key=AIzaSyAU31-paxEOkGz3VzsJ71k5VEs01W64QJE";
                URL obj=new URL(url);
                HttpURLConnection con=(HttpURLConnection)obj.openConnection();
                String charset="UTF-8";
                con.setRequestMethod("GET");
                con.setRequestProperty("Accept-charset",charset);
                BufferedReader in=new BufferedReader(new InputStreamReader(con.getInputStream()));
                String inputLine;
                StringBuffer response1=new StringBuffer();
                while((inputLine = in.readLine())!=null)
                {
                    response1.append(inputLine);
                }
                in.close();
                JSONObject object=new JSONObject(response1.toString());
                JSONArray results=object.getJSONArray("results");
                for(int i=0;i<results.length();i++)
                {
                    JSONObject place_info=results.getJSONObject(i);
                    String name=place_info.getString("name");
                    String address=place_info.getString("formatted_address");
                    String placeid=place_info.getString("place_id");
                    double rating=place_info.getDouble("rating");
                    String photo_ref=null;
                    JSONObject geometry=place_info.getJSONObject("geometry");
                    JSONObject location=geometry.getJSONObject("location");
                    Double latitude=(Double)location.get("lat");
                    Double longitude=(Double)location.get("lng");
                    if(place_info.has("photos"))
                {    
                JSONArray photos=place_info.getJSONArray("photos");
                JSONObject photo_no=photos.getJSONObject(0);
                photo_ref=(String)photo_no.getString("photo_reference");
                }
                    
                    %>
               
                    <form action="show_route.jsp" method="POST">  
                    <div class="info">
                        
                        
                        <input id="<% out.print(placeid); %>" onchange="changename(this.id); changeaddressname(this.id); changename1(this.id); changephotoname(this.id);" type="checkbox" name="places" value="<% out.print(placeid); %>" >
                        <input id="<% out.print("address"+placeid); %>" type="hidden" name="address" value="<%out.print(address+"##"+latitude+"%%"+longitude); %>">
                               <input id="<% out.print("name"+placeid); %>" type="hidden" name="name1" value="<%out.print(name); %>">
                                 <input id="<% out.print("photo_ref"+placeid); %>" type="hidden" name="photo_reference" value="<%out.print(photo_ref); %>">
                         <%
                       if(photo_ref!=null)
                       {
                            // Thread.sleep(2000);
                           %>
                         
                           
                   <img height="200" width="200" src="https://maps.googleapis.com/maps/api/place/photo?maxwidth=200&photoreference=<%out.print(photo_ref);%>&key=AIzaSyAU31-paxEOkGz3VzsJ71k5VEs01W64QJE">
                   <%
                       }
                    else{
                    %>
                    <img height="100" width="100" src="black.png">
                    <%
                        }
                     %>
                        <h2><a id="a1" href="place.jsp?placeid=<% out.print(placeid); %>" ><% out.println(name); %></a></h2>
                        <h3><% out.println(address); %></h3>
                        <h3><% out.println(rating); %></h3>
                        
                        
                    </div>
                       
                 <%   
                }
                
                %>
                <center><button type="submit" class="btn btn-success">Check Route</button></center>
                    </form>
        </div>
        </div>
        
    </body>
</html>
