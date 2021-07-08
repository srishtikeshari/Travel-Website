<%-- 
    Document   : final1
    Created on : 7 Apr, 2019, 12:03:38 PM
    Author     : srishti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
            
            String start_addr1=request.getParameter("start_addr");
            String[] removed=request.getParameterValues("removed");
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
               out.print(u);
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
            for(int i=0;i<length2;i++)
            {
                out.print(names[i]);
            }
            out.print(length2);
            
            %>
    </body>
</html>
