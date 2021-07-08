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
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="navbar.css" type="text/css" rel="stylesheet">
        <title>JSP Page</title>
        
       
        
    </head>
     <%String userid=(String)session.getAttribute("sess_userid");%>
    <script>
    
        function check()
        {
            //alert("kdsjfks");
          
                $("b1").click(function()
                {
                    alert("sad");
                    var s=$("div").text();
                    alert(s);
                });
           
        }
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
    <style>
        .d1
        {
            background-color: powderblue;
            padding:10px;
            padding-right:10px;
            padding-left:10px;
            padding-bottom: 10px;
             box-shadow: 3px 3px 3px gray;
        }
        .header{
            
            margin-top:10px;
            background-color: lavender;
            padding:10px;
            padding-bottom:10px;
        }
        #s2
        {
            word-spacing: 30px;
        }
        #s1
        {
            word-spacing:50px;
        }
         .nava{
               color:white;
           }
           #signinbutton{
               display:none;
               color:white;
               position:relative;
               left:3800px;
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
                background:url("flightload1.gif") no-repeat center center ;
            }
            
               
    </style>
    <body>
        
         <div id="load">
            <center><h2>Searching flights.....</h2></center>
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
             }catch(Exception e){  }
            
     try{   
     String to=request.getParameter("dest");  
        String from=request.getParameter("source");
        String[] sourcecode=from.split("-");
        String[] destcode=to.split("-");
     String datefrom=request.getParameter("datefrom");
    session.setAttribute("sess_sourcecode",from);
     session.setAttribute("sess_destcode",to);
     session.setAttribute("sess_date",datefrom);
     //String dateto=request.getParameter("dateto");
     // out.println(datefrom);
    // out.println(dateto);
     String datefrom1[]=datefrom.split("-");
      //String dateto1[]=dateto.split("-");
      String datefrom2=datefrom1[2]+"/"+datefrom1[1]+"/"+datefrom1[0];
     //String dateto2=dateto1[2]+"/"+dateto1[1]+"/"+dateto1[0];
     
 
     String url = "https://api.skypicker.com/flights?flyFrom="+sourcecode[1]+"&to="+destcode[1]+"&dateFrom="+datefrom2+"&partner=picky&flight_type=oneway";
   
   //  out.println(url);
     //out.println(to);
     //out.println(from);
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
     //session.setAttribute("date_from",datefrom2);
     //session.setAttribute("date_to",dateto2);
     //session.setAttribute("to",to);
     //session.setAttribute("from",from);
     
     //out.println(response1.toString());
     //JSONArray flights = new JSONArray(response1.toString()) ;
     //out.println(response1.toString());
     //JSONArray flights= response1.getJSONArray("array");
     //int no=flights.length();
     //out.println(no);
     int i=0;
     JSONObject object=new JSONObject(response1.toString());
    // out.println(response1.toString());
     JSONArray data=object.getJSONArray("data");
     int length=data.length();
     //out.println(length);
   
   /*
     {
         JSONObject flight_info=data.getJSONObject(i);
         String from1=(String)flight_info.get("flyFrom_type");
         out.println(from1);
         //String .gata,arr_time,dep_iata,dep_time,airline_name,flight_no,flight_iata;
         /*String airlines_name,fly_duration,arr
         JSONObject departure=flight_info.getJSONObject("departure");
         dep_iata=departure.getString("iataCode");
         dep_time=null;
         if(departure.has("scheduledTime"))
         {
         dep_time=departure.getString("scheduledTime");
         }           
//dep_terminal = "1";
         //if(departure.getString("terminal")!=null)
         //dep_terminal=departure.getString("terminal");
         JSONObject arrival=flight_info.getJSONObject("arrival");
         arr_iata=arrival.getString("iataCode");
         arr_time=arrival.getString("scheduledTime");
         JSONObject airline=flight_info.getJSONObject("airline");
         airline_name=airline.getString("name");
         JSONObject flightno=flight_info.getJSONObject("flight");
         flight_no=flightno.getString("number");
         flight_iata=flightno.getString("iataNumber");*/
   
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
                                 <input type="hidden" name="pageurl" value="flights_info">
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
                <center><h1><%out.print(to+"  to  "+from+"  on  "+datefrom);%></h1></center>
    <center> <button class="btn btn-success"> <a style="color:white" href="hotels_info.jsp?city=<% out.print(destcode[0]); %>">Check hotels for the destination</a></button>
        <button class="btn btn-success"> <a style="color:white" href="plan_info1.jsp?city=<% out.print(destcode[0]); %>">Check places to visit in the destination</a></button></center>
           
               <div class="container">
                   
                   
        <div class="header"> 
               <div style="margin-left: 135px">
               <span id="s2">
                    Airline_Name
                   Fly_Duration
                   Departure
                   Arrival
                 Price
               </span>
               </div>
        </div>
               </div>
           
           <form action="booking_flight.jsp" method="POST">
 <%
        Integer[] arrivaltimes=new Integer[length];
        Integer[] departuretimes=new Integer[length];
        String airline_nameprev="a";
        String fly_durationprev="a";
        Integer atime_prev=10;
        Integer dtime_prev=10;
        Integer priceprev=10;
        int k=0,flag=0; 
            for(i=0;i<length;i++)
            {
                flag=0;
                JSONObject flight_info=data.getJSONObject(i);
                JSONArray flight_arr=flight_info.getJSONArray("airlines");
                String airline_name,fly_duration;
                airline_name=(String)flight_arr.get(0);
                fly_duration=(String)flight_info.getString("fly_duration");
                String fly_duration2=fly_duration.replace("h ","hours");
                Integer atime_UTC,dtime_UTC,price;
                atime_UTC=(Integer)flight_info.get("aTimeUTC");
                dtime_UTC=(Integer)flight_info.get("dTimeUTC");
                price=(Integer)flight_info.get("price");
                price=price*78;
                String id=flight_info.getString("id");
                
                String arr_time,dep_time;
                arr_time=new java.text.SimpleDateFormat(" HH:mm").format(new java.util.Date (atime_UTC*1000));
                dep_time=new java.text.SimpleDateFormat(" HH:mm").format(new java.util.Date (dtime_UTC*1000));
               // String arr_time2=arr_time.replace(":","hours");
                //String dep_time2=dep_time.replace(":","hours");
               /* out.println(airline_name);
                out.println(fly_duration);
                out.println(arr_time);
                out.println(dep_time);
                
                out.println(price+"");*/
                
                if(i>1)
                {
                    /*if(!(airline_nameprev.equals(airline_name)&&(fly_durationprev.equals(fly_duration))))
                            {
                                 if((atime_prev==atime_UTC)&&(dtime_prev==dtime_UTC)&&(priceprev==price)){
                                            continue;
                                 }
                            }*/
                    for(int v=0;v<k;v++)
                    {
                        if((arrivaltimes[v]==atime_UTC)&&(departuretimes[v]==dtime_UTC))
                        {
                            flag=1;
                            break;
                            
                        }
                        else
                        {
                            arrivaltimes[k++]=atime_UTC;
                            departuretimes[k++]=dtime_UTC;
                        }
                    }
                    
                    if(flag==1)
                        continue;
                %>
                <div id="<%=airline_name%>" class="container">
                    
                        
                   <div class="d1">
                       <div style="margin-left:210px">
                        
                       <span id="s1"><%=airline_name %>
                           <%out.print(fly_duration2); %>
                            <%out.print(dep_time); %>
                           <%out.print(arr_time); %>
                            Rs.<%=price%> 
                            
                            <button id="<%=id%>" name="id" value="<%=i%>">BOOK</button>
                            </span>
                       </div>
                   </div>
                </div>
                  <%
                      }
                            String airline_name1="airline_name"+id;
                            String fly_duration1="fly_duration"+id;
                            String dep_time1="dep_time"+id;
                            String arr_time1="arr_time"+id;
                            String price1="price"+id;
                            
                    %>
                     <input type="hidden" name="id1" value="<%=id%>" >
                    <input type="hidden" name="airline_name1" value="<%=airline_name%>" >
                    <input type="hidden" name="fly_duration1" value="<%=fly_duration%>" >
                    <input type="hidden" name="dep_time1" value="<%=dep_time%>" >
                    <input type="hidden" name="arr_time1" value="<%=arr_time%>" >
                    <input type="hidden" name="price1" value="<%=price%>" >
                    
       <% 
           
           airline_nameprev=airline_name;
           fly_durationprev=fly_duration;
           atime_prev=atime_UTC;
           dtime_prev=dtime_UTC;
           priceprev=price;
           
            }
           for(int v=0;v<k;v++)
                    {
                      out.println(arrivaltimes[v]+" "+departuretimes[v]);
                    }

}catch(Exception e){

%>
    <center><i style="height:100px; width:100px;" class="fa fa-exclamation-triangle fa-lg" aria-hidden="true"></i> <h2>Sorry, An error occurred. Please try again later.</h2></center>
    
    <%
}
        %>
        
            
           </form>
      
        </div>
    </body>
</html>