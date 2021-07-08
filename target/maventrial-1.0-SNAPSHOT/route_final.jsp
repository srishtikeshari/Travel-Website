<%-- 
    Document   : route_final
    Created on : 21 Mar, 2019, 10:58:55 PM
    Author     : srishti
--%>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.util.Scanner" %>
<%@ page import="java.util.*" %>
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
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
     <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
        
     <link rel="stylesheet" href="navbar.css" type="text/css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">   
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">      
      
        <title>JSP Page</title>
         <%
             String userid=(String)session.getAttribute("sess_userid");
            %>
     
            <style>
                
                .btn-danger{
                     background-color: #ccc;
                     cursor: pointer;
                     color: #444;
                     border: none;
                     outline: none;
                } 
                .active, .btn-danger:hover{
                    background-color: darkgray;
                    color: #444;
                }
                
                .accordion {
                    background-color: #ccc;
                     color: #444;
                      cursor: pointer;
                     padding: 18px;
                      width: 100%;
                      text-align: left;
                         border: none;
                         outline: none;
                     transition: 0.4s;
                    }


.accordion:hover {
  background-color: #ccc;
}


.panel {
  padding: 0 18px;
  background-color: white;
  display: none;
  overflow: hidden;
}
                body{
                    background-color: lavender;
                }
            .placeinfo{
                background-color: antiquewhite;
                margin:10px;
                padding:10px;
                 box-shadow: 3px 3px 3px gray;

            }
            .placeinfo:hover
            {
                 -moz-box-shadow: 0 0 10px #ccc;
		-webkit-box-shadow: 0 0 10px #ccc;
		box-shadow: 0 0 10px #ccc;
            }
            
             #map {
                 height: 400px;  /* The height is 400 pixels */
                 width: 100%;  /* The width is the width of the web page */
             }
             .directions{
                 background-color: lavender;
             }
             .directions-header{
                 background-color: black;
                 color:white;
             }
               .nava{
               color:white;
           }
           h2,h1{
                padding:10px;
                text-shadow: 0 0 3px gray;
            }
           #signinbutton{
               display:none;
               color:white;
               position:relative;
               left:400px;
           }
           #navig_bar
           {
               position:relative;
               top:0px;
           }
           p
           {
               margin:10px;
               padding:10px;
           }
           img
           {
               padding:1px;
               margin:10px;
           }
  </style>
    <script>
        
        $('#panels').accordion();
        
        
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




    function collapseopen(id){
        
     document.getElementById("panel"+id).style.display="block";
     document.getElementById("close"+id).style.display="block";
     console.log("panel"+id);
        
        
    }
     function collapseclose(id){
      
        var idname=id;
        document.getElementById(idname).style.display="none";
        var newid=idname.replace("close","panel");
        console.log(newid);
     document.getElementById(newid).style.display="none";
     
        
        
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
                                 <input type="hidden" name="pageurl" value="route_final">
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
        <div id="map">
            
            
        </div>
        
        <%
            String[] removed;
            String start_addr1=request.getParameter("start_addr");
            if(request.getParameterValues("removed")!=null)
            {    
               removed=request.getParameterValues("removed");
            }
            else{
                removed=new String[0];
            }
            //out.print(start_addr1);
            String[] latitudes=request.getParameterValues("latitudes");
            String[] longitudes=request.getParameterValues("longitudes");
            String[] names=request.getParameterValues("names");
            String[] address=request.getParameterValues("address");
            String[] photo_ref=request.getParameterValues("photo_ref");
            String start_addr=start_addr1.replace(" ","+");
            int length2=latitudes.length;
            // Double mindistance=new Double(9999);
            Integer u;
            for(int i=0;i<removed.length;i++)
            {
                u=Integer.parseInt(removed[i]);
                u=u-i;
             //  out.print(u);
                //int j;
                
                for(int j=u;j<length2-1;j++)
                {
                    latitudes[j]=latitudes[j+1];
                    longitudes[j]=longitudes[j+1];
                    names[j]=names[j+1];
                    address[j]=address[j+1];
                    photo_ref[j]=photo_ref[j+1];
                }
                 /*latitudes[length2-1]=null;
                    longitudes[length2-1]=null;
                    names[length2-1]=null;
                    address[length2-1]=null;
                    photo_ref[length2-1]=null;*/
                    length2--;
            }
            /*for(int i=0;i<length2;i++)
            {
                out.print(names[i]);
            }
            out.print(length2);*/
            int mindistance=65000; 
            int k=0;
            int[] path=new int[length2+2];
            int[] visited=new int[length2+2];
            int[] value_dist=new int[length2+2];
            int[] value_dur=new int[length2+2];
            //try{
            String url="https://maps.googleapis.com/maps/api/geocode/json?address="+start_addr+"&key=AIzaSyAU31-paxEOkGz3VzsJ71k5VEs01W64QJE";
            URL obj=new URL(url);
            String charset="UTF-8";
            HttpURLConnection con=(HttpURLConnection)obj.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Accept-charset",charset);
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
             JSONArray results=myResponse.getJSONArray("results");
             JSONObject result1=results.getJSONObject(0);
             JSONObject geometry=result1.getJSONObject("geometry");
             JSONObject location = geometry.getJSONObject("location");
             Double latitude_start=(Double)location.getDouble("lat");
             Double longitude_start=(Double)location.getDouble("lng"); 
            
             String origin=latitude_start+","+longitude_start;
            StringBuffer destinations=new StringBuffer(); 
            for(int i=0;i<length2;i++)
            {
                destinations.append(latitudes[i]+","+longitudes[i]);
                if(i!=(length2-1))
                {
                    destinations.append("|");
                }
             }
            //  out.println(destinations);
              String dest=destinations.toString();
           
              //out.print(url);
              String url1="https://maps.googleapis.com/maps/api/distancematrix/json?origins="+origin+"|"+dest+"&destinations="+dest+"&departure_time=now&key=AIzaSyAU31-paxEOkGz3VzsJ71k5VEs01W64QJE";
          //    out.println(url1);
              URL obj1=new URL(url1);
              HttpURLConnection con1=(HttpURLConnection)obj1.openConnection();
              con1.setRequestMethod("GET");
              con1.setRequestProperty("Accept-charset",charset);
              BufferedReader in1 = new BufferedReader(
              new InputStreamReader(con1.getInputStream()));
              //String inputLine;
              StringBuffer response2 = new StringBuffer();
              while ((inputLine = in1.readLine()) != null) {
         	response2.append(inputLine);
                  }
              in1.close();
              //  out.println(response1.toString());
              JSONObject myResponse2 = new JSONObject(response2.toString());
              //out.print(myResponse2);
              JSONArray rows=myResponse2.getJSONArray("rows");
             // visited[0]=1;
              int m=0;
              for(int i=0;i<=length2;i++)
              {
                
                 mindistance=65333;
                 JSONObject originno = rows.getJSONObject(m);
                 JSONArray elements=originno.getJSONArray("elements");
                 for(int j=0;j<length2;j++)
                 {
                      if(visited[j]==1)
                      {
                          continue;
                      }
                     JSONObject destno= elements.getJSONObject(j);
                     JSONObject distance= destno.getJSONObject("distance");
                     JSONObject duration= destno.getJSONObject("duration");
                     value_dist[i]=(int)distance.getInt("value");
                     value_dur[i]=(int)duration.getInt("value");
                     if(value_dist[i]==0)
                     {
                         continue;
                     }
                     if(value_dist[i]<mindistance)
                     {
                         mindistance=value_dist[i];
                          path[k] = j;
                          m=j+1;
                    }
                   
                    
                 }
              visited[m-1]=1;   
              k++;
             }
              int y;  
            %>
            <div class="container">
              <div class="placeinfo">
                  <center><h1> Origin</h1></center>
                  <center> <h2> <% out.print(start_addr); %></h2></center>
                    
                 
               </div>
               <%
                   float distance,duration;
              for(int x=0;x<length2;x++)
              {
                  y=path[x];
                  if(value_dist[y]>100)
                  {
                      distance=value_dist[y]/1000;
                  }
                  else{
                      distance=value_dist[y];
                  }
                  duration=value_dur[y]/60;
                  if(duration>60)
                  {
                      duration=duration/60;
                  }
                  
                  %>
               <div class="placeinfo">
                   
                   <img height="250" width="250" src="https://maps.googleapis.com/maps/api/place/photo?maxwidth=200&photoreference=<%out.print(photo_ref[path[x]]);%>&key=AIzaSyAU31-paxEOkGz3VzsJ71k5VEs01W64QJE">
                   <h1> <% out.print((char)(path[x]+65)); %></h1>
                   <h2> <% out.print(names[y]); %></h2>
                   <h4> <% out.print(address[y]); %> </h4>
                   <h4> Distance from previous destination: <% out.print(distance); %> </h4>
                   <h4> Approximate time to reach this destination from previous destination <% out.print(duration); %> </h4>
                   
                   
               </div>
                  <%
              }

              %>
            </div>
    <center><h1>Directions</h1></center>
              <%
            String originroads;
            String[][] lat_coordinate=new String[length2+2][50];
            String[][] lng_coordinate=new String[length2+2][50];
            %>
              <div class="container"> 
            <%
           for(int z=0;z<length2;z++)
            { 
                if(z==0)
                    originroads=origin;
                else
                    originroads=latitudes[path[z-1]]+","+longitudes[path[z-1]];
                String destroads=latitudes[path[z]]+","+longitudes[path[z]];
                String url2="https://maps.googleapis.com/maps/api/directions/json?origin="+originroads+"&destination="+destroads+"&key=AIzaSyAU31-paxEOkGz3VzsJ71k5VEs01W64QJE";
              //  out.print(url2);
                URL obj2=new URL(url2);
                HttpURLConnection con2=(HttpURLConnection)obj2.openConnection();
                con2.setRequestMethod("GET");
                con2.setRequestProperty("Accept-charset",charset);
                BufferedReader in2 = new BufferedReader(
                new InputStreamReader(con2.getInputStream()));
                //String inputLine;
                StringBuffer response3 = new StringBuffer();
                while ((inputLine = in2.readLine()) != null) {
                    response3.append(inputLine);
                 }
                in2.close();
                //  out.println(response1.toString());
                JSONObject myResponse3 = new JSONObject(response3.toString());
                //out.print(myResponse3);
                //JSONObject object=myResponse3.getJSONObject("object");
                JSONArray route=myResponse3.getJSONArray("routes");
                JSONObject route0=route.getJSONObject(0);
                JSONArray legs=route0.getJSONArray("legs");
                JSONObject legs0=legs.getJSONObject(0);
                JSONArray steps=legs0.getJSONArray("steps");
                String p;
                if(z==0)
                {
                    p="Origin";
                }
                else{
                    p=names[path[z-1]];
                }
                String p1=names[path[z]];
              
                %>
                <button class="btn btn-danger" onclick="collapseclose(this.id)" id="<%out.print("close"+p);%>" style="text-align: right;align-content: right;display:none">Close</button>
                <button class="accordion" id="<%=p%>" onclick="collapseopen(this.id)">Directions from <%out.print(p); %> to <%out.print(p1); %></button>
                <%
                    String newpanel="panel"+p;
                    %>
                    
                    <div class="panel" id="<%=newpanel%>">
                    <%
                for(int i=0;i<steps.length();i++)
                {
//String divid="directions"+z;
                    JSONObject stepno=steps.getJSONObject(i);
                    
                    JSONObject start_location=stepno.getJSONObject("start_location");
                    lat_coordinate[z][i]=start_location.getString("lat");
                    lng_coordinate[z][i]=start_location.getString("lng");
                    String instructions=(String)stepno.getString("html_instructions");
                    String final_instructions1=instructions.replace("<b>"," ");
                    String final_instructions2=instructions.replace("</b>"," ");
                    JSONObject nextdistance=stepno.getJSONObject("distance");
                    String dist_value=nextdistance.getString("text");
                    //out.println(roadcoordinates[z][i]);

                    %>
                    
                   
               
                    
                    
                    <p><% out.println(final_instructions2); %></p>  
                    <p>Distance to be travelled before next instruction: <%out.println(dist_value); %></p>
                    
                    
                    
                    
                    <hr>
                    
                <%
               
                }

%>
</div>
<hr>
<%
                
            }

            %>
                
              </div>
            
            
            
            
            
                <script>
                    
                    <% int j=0; %>
                        var labels="ABCDEFGHIJKLMNOPRSTUVWXYZ";
                        var labelIndex=0;
                    function initMap() {
                        //var i;
                       
                        var l=<%out.print(length2); %>
                        var locations= new Array(l);
                        //var marker = new Array(l);
                       
                     // The location of Uluru
                     var k=0;
                     
                     var m=0;
                     <% for(j=0;j<length2;j++){ %>
                     
                         
                       
                        
                        
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
                     document.getElementById('map'), {zoom: 12, center: city, mapTypeId: google.maps.MapTypeId.ROADMAP });
                     var latstart=<% out.print(latitude_start); %>
                     var longstart=<% out.print(longitude_start); %>
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
                                 marker = new google.maps.Marker ({
                                 position: new google.maps.LatLng(locations[i][0], locations[i][1]),
                                 map: map,
                                 label: labels[labelIndex++ % labels.length]
                             });
                 }
                 var bprev=0;
                 var now;
                 var x;
                 var w=0;
                 var pathcoordinates=[];
                 //var newpathcoordinates=[];
                 //var colors1=["#000000","#FF0000","#00FF00","#0000FF","#FFFF00","#00FFFF","#FF00FF","#808080","#800000","#008080"];
                //console.log(colors[2]);
                 var q=0;
                 <%  int b=0;
                     for(int i=0;i<length2;i++){
                          //console.log(colors[<%=i]);
                        b=0;
                        while(lat_coordinate[i][b]!=null){ %>
                       
                             
                        //console.log(<% out.print(lat_coordinate[i][b]); %>);        
                        pathcoordinates[q++]={lat:<% out.print(lat_coordinate[i][b]); %>,lng:<% out.print(lng_coordinate[i][b]); %>}            
                       
                        // console.log(pathcoordinates);      
                 <%   
                       b++; 
                       
                           }
                   
                %>
                       <%-- w=0;
                        now=q-1;
                        for(x=bprev;x<now-1;x++)
                        {
                            newpathcoordinates[w++]=pathcoordinates[x];
                        }
                        while(newpathcoordinates[x]!=null)
                        {
                            newpathcoordinates[w++]=pathcoordinates[x-1];;
                        }
                        console.log(newpathcoordinates+" "+bprev+" "+now);
                        var p=<% out.print(i); %>;--%>
                        var roadTrip = new google.maps.Polyline({
                                    path: pathcoordinates,
                                    strokeColor: '#FF0000',
                                    strokeOpacity: 0.9,
                                    strokeWeight: 5
                            });
                            roadTrip.setMap(map);
                           // bprev=q-1;
                <%
                    }  
                %>
                        
}



       var urlcurrpage=window.location.href;
       console.log(urlcurrpage);
          </script>      
                 
                 
          <%
              
                String saveroute="http://localhost:8080/"+request.getRequestURI().toString()+"?"+request.getQueryString().toString();
                String origincity=start_addr;
                String destcity=names[path[length2-1]];
                //String saveroute2=request.getQueryString().toString();
               // out.print(saveroute);
                session.setAttribute("sess_planurl",saveroute);
                session.setAttribute("sess_origincity",origincity);
                session.setAttribute("sess_destcity",destcity);
                if(request.getParameter("saved")!=null)
                {
                    if(request.getParameter("saved").equals("yes")){
                        %>
                        <script>
                            
                            alert("Route saved.");
                            </script>
                        
                        <%
                    }
                        
                }
              %>
              <form action="saveroute.jsp" method="POST">
                  
                  
                  
                  <center>      <button type="submit" class="btn btn-success">Save Route</button>   </center>
                  
                  </form>   
                 
    
   
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAU31-paxEOkGz3VzsJ71k5VEs01W64QJE&callback=initMap">
    </script>
    </body>
</html>
