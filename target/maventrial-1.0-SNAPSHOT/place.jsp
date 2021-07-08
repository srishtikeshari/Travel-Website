
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
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    
        <link type="text/css" rel="stylesheet" href="navbar.css">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
           #signinbutton{
               display:none;
               color:white;
               position:relative;
               left:370px;
           }
            #navig_bar
            {
                position:relative;
                top:0px;
            }
            #infoofplace{
                background-color: powderblue;
            }
            .reviews{
                background-color: lightgray;
            }
            .gallery
            {
                margin:10px 50px;
                
            }
            .gallery img
            {
                transition:1s;
                padding:15px;
                width:300px;
            }
            .gallery img:hover
            {
                filter:grayscale(100%);
                transform:scale(1.1);
            }
            .reviews
            {
                box-shadow: 3px 3px 3px gray;
                padding:10px;
                margin:10px;
            }
            .infoofplace
            {
                box-shadow: 3px 3px 3px gray;
                padding:10px;
                margin:10px;
            }
            .infoofplace:hover
            {
                -moz-box-shadow: 0 0 10px #ccc;
		-webkit-box-shadow: 0 0 10px #ccc;
		box-shadow: 0 0 10px #ccc;
            }
            .reviews:hover
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
            try{
                String placeid="new";
                if(request.getParameter("placeid")!=null){
                    placeid=request.getParameter("placeid");
                    session.setAttribute("sess_placeid1",placeid);
                }
                else{
                     placeid=(String)session.getAttribute("sess_placeid1");
                }
            
            //out.print(placeid);
            String url="https://maps.googleapis.com/maps/api/place/details/json?placeid="+placeid+"&key=AIzaSyAU31-paxEOkGz3VzsJ71k5VEs01W64QJE ";
            String charset="UTF-8";
            URL obj = new URL(url);
            HttpURLConnection con =(HttpURLConnection)obj.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Accept-charset",charset);
            BufferedReader in=new BufferedReader(new InputStreamReader(con.getInputStream()));
            StringBuffer response1=new StringBuffer();
            String inputline;
            while((inputline=in.readLine())!=null)
            {
                response1.append(inputline);
            }
            //out.println(response1.toString());
            JSONObject object1=new JSONObject(response1.toString());
            JSONObject result=object1.getJSONObject("result");
            String address=result.getString("formatted_address");
            JSONArray photos=result.getJSONArray("photos");
            String name=result.getString("name");
            
            %>
              <center><h2><%=name%></h2></center>
              <div class="container">
              <div class="gallery">
            <%
                int j=photos.length();
            for(int i=0;i<j;i++)
                
            {
                JSONObject photo_no=photos.getJSONObject(i);
                int height=photo_no.getInt("height");
                int width=photo_no.getInt("width");
                String photo_ref=photo_no.getString("photo_reference");
                %>
            
                <img  src="https://maps.googleapis.com/maps/api/place/photo?maxwidth=200&photoreference=<%out.println(photo_ref);%>&key=AIzaSyAU31-paxEOkGz3VzsJ71k5VEs01W64QJE">
              
                <%
                   // out.print();
                   //aur bhi jo sab print karana hai
            }

          %>
        </div>
      
          <div id="infoofplace" class="infoofplace">
              
              
                  
              <b>Address: &nbsp</b> <p><%out.println(result.getString("formatted_address")); %></p>
                          <%
                              if(result.has("formatted_phone_number"))
                              {
                              %>
                                     <b>Phone No.: &nbsp;</b> <p><%out.println(result.getString("formatted_phone_number")); %></p>
                             <%
                              }
           
                             %>
                         
                          <%
                              if(result.has("website"))
                              {
                              %>
                                    <b>Website: &nbsp;</b>  <p><%out.println(result.getString("website")); %></p>
                             <%
                              }
           
                             %>
                             </div>
      <center><h3>Reviews for <%=name%></h3>
              <%
                  
            JSONArray reviews=result.getJSONArray("reviews");
            for(int i=0;i<reviews.length();i++)
            {
                    JSONObject reviewno=reviews.getJSONObject(i);

               %>
               
               </center>
                    <div class="reviews">
                        
                       <b>Name: &nbsp;</b> <p><%out.println(reviewno.getString("author_name")); %></p>
                      <b>Rating: &nbsp;</b>  <p><%out.println(reviewno.getString("rating")); %></p>
                      <p><%out.println(reviewno.getString("relative_time_description")); %></p>
                       <p><%out.println(reviewno.getString("text")); %> </p>
                        
                        
                    </div>
                    
             <%          
            }
             %>
        
            
      </div>
            <%
             }catch(Exception e){
%>
                    <center><i style="height:100px; width:100px;" class="fa fa-exclamation-triangle fa-lg" aria-hidden="true"></i> <h2>Sorry, Information of the place could not be loaded right now. Please try again later.</h2></center>
               <%
                    }
            
            %>
            
           
    </body>
</html>