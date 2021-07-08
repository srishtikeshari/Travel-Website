<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
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
        <link rel="stylesheet" src="style.css"></link>
        
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  
        <link type="text/css" rel="stylesheet" href="navbar.css">
    </head>
    <style>
          
         .table-header1
         {
             background-color: rgb(0,128,0);
             color:darkgreen;
         }
         .trains
         {
             margin-top:100px;
             
         }
         span{
             word-spacing:10px;
             background-color:powderblue;
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
               left:500px;
           }
           .route{
             
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
                        document.getElementById("signinbutton").style.display="inline";
                   }
                   else
                   {
                        document.getElementById("drop").style.display="inline";
                         $('#signinbutton').hide();
                   }
            });
         
            
            
            </script>
        
    <body>
        
        
        
        <%
            String cancel="no";
            if(request.getParameter("cancel")!=null)
            {
                cancel=request.getParameter("cancel");
            }
            if(cancel.equals("yes"))
            {
                %>
                
                <script>
                    
                    alert("Booking cancelled successfully");
                    
                    </script>
                    
                
                <%
            }
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
                         Hi <%=userid %>
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
                 <center><h1>My Bookings</h1></center><br>
                             <center> <h2>Train Bookings</h2></center>
                    <div class="container">
                        <div class="trains">
        <%
               
                try
                {
                   Class.forName("com.mysql.jdbc.Driver");
           
                  Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectfinal1?zeroDateTimeBehavior=convertToNull","root","");
                
                  Statement stat=conn.createStatement();
                  ResultSet rs=stat.executeQuery("select * from booking_train where userid='"+userid+"'");
                  if(rs.next())
                  {
                  %>
                  <center>
                   
                       <table class="table table-striped">
                           <tr class="table-header1">
                               <td><b>Booking Id</b></td>
                               <td><b>Train No</b></td>
                               <td><b>Date</b></td>
                               <td><b>Name</b></td>
                               <td><b>Age</b></td>
                               <td><b>Gender</b></td>
                               <td><b>Status</b></td>
                               <td><b>Quota</b></td>
                               <td><b>Class</b></td>
                               <td><b>Print</b></td>
                               <td><b>Cancel</b></td>
                           </tr>
                      <%
                  while(rs.next())
                  {
                        String booking_id=rs.getString("booking_id");
                        String train_no=rs.getString("train_no");
                        String date=rs.getString("date");
                        String passenger_name=rs.getString("passenger_name");
                        String passenger_age=rs.getString("passenger_age");
                        String passenger_gender=rs.getString("passenger_gender");
                        String seat_no=rs.getString("berth");
                        String status=rs.getString("status");
                        String quota=rs.getString("quota");
                        String class1=rs.getString("class");
                        int serial_no=rs.getInt("serial_no");
                       %> 
                     <tr>               
                     <td> <%out.println(booking_id);%></td>
                     <td>  <%out.println(train_no);%></td>
                     <td>  <%out.println(date);%></td>
                     <td>  <%out.println(passenger_name);%></td>
                      <td> <%out.println(passenger_age);%></td>
                      <td> <%out.println(passenger_gender);%></td>
                      <td> <%out.println(status);%></td>
                     <td> <%out.println(quota);%></td>
                      <td>  <%out.println(class1);%></td>
                      <td> <button name="id" class="btn btn-success" value="<%=booking_id%>" type="submit"><a style="color:white" href="new.jsp?id=<%=booking_id%>">Print Ticket</a></button> </td>
                        <td>  <button name="cancel" class="btn btn-success" value="<%=booking_id%>" type="submit"><a style="color:white" href="new.jsp?cancel=<%=booking_id%>">Cancel Ticket</a></button></td>
                               </tr>
                       <input type="hidden" name="canceltype" value="booking_train">
                     
                    <%    
                  }
               %>
                
               </table>
              
               </center>
               <%
              
                }
else{
%>
<p>You have no train bookings</p>
                  
<%
}
}
                catch(Exception e)
                {
                    out.print(e);
                }
        %>
                 </div>
                         
</div>
        
                             <br>
                 <center>  <h2>Flights Bookings</h2>   </center>
                <div class="container">
                    <div class="flights">
                <%
                    try
                    {
                        
                        Class.forName("com.mysql.jdbc.Driver");
           
                            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectfinal1?zeroDateTimeBehavior=convertToNull","root","");
                            Statement stat=conn.createStatement();
            
                            ResultSet rs=stat.executeQuery("select * from booking_flight where userid='"+userid+"'");
                            if(rs.next())
                            {
                            %>
                            <center>
                        
                            <form action="new.jsp">
                                 <table class='table table-striped'> 
                                     
                                     <tr class="table-header1">
                                         <td><b>Booking Id</b></td>
                               <td><b>Name</b></td>
                               <td><b>Age</b></td>
                               <td><b>Gender</b></td>
                               <td><b>Date</b></td>
                               <td><b>Airline Name</b></td>
                               <td><b>Price</b></td>
                               <td><b>Arrival Time</b></td>
                               <td><b>Dep Time</b></td>
                               <td><b>Print</b></td>
                               <td><b>Cancel</b></td>
                               
                               
                           </tr>
                                     
                            <%
                   while(rs.next())
                     {
                        String booking_id=rs.getString("booking_id");

                        String date=rs.getString("date");
                        String passenger_name=rs.getString("passenger_name");
                        String passenger_age=rs.getString("passenger_age");
                        String passenger_gender=rs.getString("passenger_gender");
                        String airline_name=rs.getString("airline_name");
                        String price=rs.getString("price");
                        String dep_time=rs.getString("departure_time");
                        String arr_time=rs.getString("arrival_time");
                        int serial_no=rs.getInt("serial_no");
                       %> 
                        
                       <tr>
                          <td> <%out.println(booking_id);%></td>
                          <td> <%out.println(passenger_name);%></td>
                          <td>  <%out.println(passenger_age);%></td>
                          <td>  <%out.println(passenger_gender);%></td>
                          <td>  <%out.println(date);%></td>
                          <td>  <%out.println(airline_name);%></td>
                          <td>  <%out.println(price);%></td>
                          <td>  <%out.println(arr_time);%></td>
                          <td>  <%out.println(dep_time);%></td>
                           <td> <button name="id" class="btn btn-success" value="<%=booking_id%>" type="submit">Print Ticket</button> </td>
                        <td>  <button name="cancel" class="btn btn-success" value="<%=booking_id%>" type="submit">Cancel Ticket</button></td></tr>
                            
                       
                      
                       <input type="hidden" name="canceltype" value="booking_flight">
                       
                        
                       
                     <%    
                         
                    }
                    
                    %>
                    
                    </table>
                      </form>      
                            
                       </center>
                    <%
                        }
else{
%>
<p>You have no train bookings</p>

<%
}      
                    }
                    catch(Exception e)
                    {
                        out.print(e);
                        
                    }
                %>
               
                </div>
            </div>
                 <br>
                 <center><h1>My Routes</h1></center>
                 <div class="container">
                     <div class="route">
                         <%
                             try
                    {
                        
                        Class.forName("com.mysql.jdbc.Driver");
           
                            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectfinal1?zeroDateTimeBehavior=convertToNull","root","");
                            Statement stat=conn.createStatement();
            
                            ResultSet rs=stat.executeQuery("select * from routes where userid='"+userid+"'");
                            %>
                                <div class="container">
                                    <table class="table table-striped">
                                         <tr class="table-header1">
                                             <td><b>City</b></td>
                                             <td><b>Origin</b></td>
                                             <td><b>Destination</b></td>
                                             <td><b>Show Route</b></td>
                               
                               
                               
                                </tr>
                            <%
                            while(rs.next())
                            {
                                String city=rs.getString("city");
                                String url=rs.getString("url");
                                String origin=rs.getString("origin");
                                String destination=rs.getString("destination");
                                %>
                               
                                <tr>    <td><% out.println(city); %></td> 
                                        <td><% out.println(origin); %></td> 
                                        <td><% out.println(destination); %></td> 
                                         <input type="hidden" name="canceltype" value="routes">
                                         <td><a class="btn btn-success" href="<%out.println(url); %>">Show route</a></td></tr>
                                    
                                    
                                  
                                <%
                            }

%>
      </table>
                                </div>
<%
                             
}
                      catch(Exception e)
                      {
                          
                      }
                           %>
                     </div>
                     
                 </div>
    </body>
</html>
