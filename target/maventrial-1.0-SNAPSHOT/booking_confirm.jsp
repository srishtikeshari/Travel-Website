<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<%@page import="org.apache.pdfbox.pdmodel.*" %>
<%@page import="java.io.IOException"%>
<%@page import="java.io.*"%>
 <%@page import="com.itextpdf.text.*"%>
        <%@page import="com.itextpdf.text.Document"%>
         <%@page import="com.itextpdf.text.pdf.PdfDocument"%>
          <%@page import="com.itextpdf.text.pdf.PdfPCell"%>
           <%@page import="com.itextpdf.text.pdf.PdfPTable"%>
          <%@page import="com.itextpdf.text.pdf.PdfWriter"%>
         <%@page import="com.itextpdf.text.Element"%>
          <%@page import="com.itextpdf.text.DocumentException"%>
          <%@page import="java.io.*"%>
<%@page import=" org.apache.pdfbox.pdmodel.font.PDType1Font" %>
<!DOCTYPE html>
<html>
    <head>
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="navbar.css">
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" src="style.css"></link>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <style>
        body{
            background-color: lavender;
        }
        .contain{
            
            margin-top:50px;
        }
        .nava{
               color:white;
           }
           #signinbutton{
               display:none;
               color:white;
               position:relative;
               left:550px;
           }
             #navig_bar
            {
                position:relative;
                top:0px;
            }
            table
            {
                position:relative;
                top:50px;
            }
            #p1
            {
                position:relative;
                top:100px;
                left:30px;
            }
             #p2
            {
                position:relative;
                top:120px;
                left:30px;
            }
            button{
                position:relative;
                left:30px;
                top:130px;
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
        <% 
            int i=1;   //ise har baar increment karna hai database me daalte time
            Random rand=new Random();
        StringBuffer booking_id=new StringBuffer();
        booking_id.append("btr"); 
        for (int j = 0; i < 4; i++) 
        {  
            booking_id.append(rand.nextInt(10));
              
  
        }
        String status;
        Integer fare;
        String booking_id1=booking_id.toString();
            String[] name =request.getParameterValues("name");
            String[] age =request.getParameterValues("age");
            String[] country =request.getParameterValues("country");
            String[] gender =request.getParameterValues("gender");
            String[] berth =request.getParameterValues("berth");
            //String name2=request.getParameter("name[1]");
            String source=(String)session.getAttribute("sess_sourcecode");
            //String trainname=(String)session.getAttribute("sess_trainname");
            //out.print(source);
            String dest=(String)session.getAttribute("sess_destcode");
            //out.print(dest);
            String date=(String)session.getAttribute("sess_date");
            String classcode=(String)session.getAttribute("sess_classcode");
            String prefcode=(String)session.getAttribute("sess_prefcode");
            String trainname=(String)session.getAttribute("sess_trainname");
            String arrival_time=(String)session.getAttribute("sess_arrtime");
            String dept_time=(String)session.getAttribute("sess_depttime");
            String train_no=(String)session.getAttribute("book");
            int length1=name.length;
            String availability=(String)session.getAttribute("sess_availability");
            Integer fare1=(Integer)session.getAttribute("sess_fare");
            if(availability==null)
                status="confirmed";
            else
                status=availability;
            if(fare1==null)
                fare=500;
            else
                fare=fare1*length1;
            //out.println(name[0]);
            //out.println(name[1]);
            //in sab ko database me daalna hai
            //next page pe payment wala hoga agar vahaan decline ho gaya to hatana hai database se
            int j=0;
                     String user_id=(String)session.getAttribute("sess_userid");
           %>
          
               <div id="navig_bar" class="navbar">
                <ul >
                    <li ><a class="nava" href="#"><i class="fa fa-home" aria-hidden="true"></i>Home</a></li>
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
                        <li><input id="signinbutton" style="display:none;color:white;" type="button" class="btn btn-link" value="Sign in/Sign Up"></li> 
             
                    <%--<li><input style="color:white" id="signinbutton" type="button" class="btn btn-link" value="Sign in/SignUp"></li>--%>
                </ul>
                </div>  
                     
                    
           <div class="container">
               <div class="row">
                   
                    <table class="table table-striped">
                   <%
                       for(i=0;i<length1;i++)
                       {
                           %>
                          
                           <div class="container">
                           <div class="details">
                               <tr>
                                   <td> <%out.print(train_no);%></td>
                                   <td> <%out.print(trainname);%></td>
                                   <td><%out.print(name[i]);%></td>
                              <td> <%out.print(age[i]);%></td>
                              <td> <%out.print(gender[i]);%></td>
                              <td> <%out.print(country[i]);%></td>
                              <td> <%out.print(berth[i]);%></td>
                              <td> <%out.print(source);%></td>
                              <td> <%out.print(dest);%></td>
                              <td> <%out.print(date);%></td>
                         <%--     <td> <%out.print(train_no);%></td>
                              <td> <%out.print(arrival_time);%></td>
                               
                              <td> <%out.print(dept_time);%></td>--%>
                               </tr>
                           </div>
                           </div>
                           <%
                       }
                   %>
                   
                    </table>
               </div>
                   
                  
           </div>
           <%
              Document document = new Document();
                 PdfWriter.getInstance(document, new FileOutputStream("C:/Users/srishti/Documents/NetBeansProjects/maventrial/src/main/webapp/PDF_box/"+booking_id+".pdf"));
            document.open();
            document.addTitle("skfks");
                        String heading="                             e-ticket";
            Font font=FontFactory.getFont(FontFactory.TIMES,30f); 
           Paragraph para=new Paragraph(heading,font);
         //  Integer pri=Integer.parseInt(price); 
           //pri=pri*length1; 

            
             document.add(para);
          //document.setMargins(280, 108, 72, 36);
          Paragraph p1=new Paragraph("  ");
          String source1="              Source: "+source;
          String Destination="              Destination: "+dest; 
          String Date_of_Journey="              Date: "+date;
        
            String Arrival="              Arrival time: "+arrival_time;
            String Dep="              Departure: "+dept_time;
       //  String price1="Price: "+pri; 
            String train_name="              Train Name: "+trainname; 
            String train_no1="              Train No: "+train_no; 
         document.add(new Paragraph(source1));
         
         document.add(new Paragraph(Destination));
         document.add(new Paragraph(Date_of_Journey)); 
       
         document.add(new Paragraph(Arrival));
         document.add(new Paragraph(Dep));
          document.add(new Paragraph(train_name));
           document.add(new Paragraph(train_no1)); 
      //    document.add(new Paragraph(price1)); 
          document.add(p1);
                 PdfPTable table = new PdfPTable(new float[] {2,2,2,2,2,2});
                 table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
                 table.addCell("Userid");
                 table.addCell("Name");
                 table.addCell("Age");
            
                 table.addCell("gender");
                 table.addCell("berth");
                 table.addCell("Class");
    
                table.setHeaderRows(1);
                 PdfPCell[] cells = table.getRow(0).getCells(); 
              
	  for (int j1=0;j1<cells.length;j1++){
	     cells[j1].setBackgroundColor(BaseColor.GRAY);
	  }    
                    
            try
            {
              Class.forName("com.mysql.jdbc.Driver");
             
                  Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectfinal1?zeroDateTimeBehavior=convertToNull","root","");
                 
                  Statement stat=conn.createStatement();
                  ResultSet rs1=stat.executeQuery("Select serial_no from booking_train");
            
                  while(rs1.next())
                  {
                    j=rs1.getInt("serial_no");
                  }
            
                for(i=0;i<length1;i++)
                {
                    j++;
                    int rs=stat.executeUpdate("insert into booking_train values("+j+",'"+booking_id1+"','"+train_no+"','"+trainname+"','"+user_id+"','"+date+"','"+name[i]+"','"+age[i]+"','"+gender[i]+"','"+status+"','"+prefcode+"','"+classcode+"','"+country+"','"+berth[i]+"','"+source+"','"+dest+"','"+arrival_time+"','"+dept_time+"',"+fare+") ");
                     table.addCell(user_id);
                    table.addCell(name[i]);
                     table.addCell(age[i]);
                     table.addCell(gender[i]);
                     table.addCell("any");
                    table.addCell(classcode);
                
                   
                
            }
            }
            catch(Exception a)
            {
                out.println(a);
            }
            
    
          document.add(new Chunk(""));
         document.add(table);
	  document.close();
        //String user12=(String)session.get
            
            %>
         
    <center><p id="p1"><a href="homepage.jsp">Booking Done. Go to Homepage?</a></p>
        <p id="p2">Do you want print ticket</p>
        <form action="new.jsp">
            <input type="hidden" value="<%=booking_id%>" name="id"> 
        <button class="btn btn-success" type="submit">Yes</button>
        </form>
    </center>
            
    </body>
</html>