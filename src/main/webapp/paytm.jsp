<%-- 
    Document   : paytm
    Created on : 29 Mar, 2019, 11:37:33 AM
    Author     : srishti
--%>
<%@page import="com.paytm.pg.merchant.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        //import com.paytm.pg.merchant.*;
     

         
        
      String merchantMid = "FHMpjj07047623701884";
// Key in your staging and production MID available in your dashboard
String merchantKey = "wN9fuxaXYg8YX#Y5";
// Key in your staging and production merchant key available in your dashboard
String orderId = "order1";
String channelId = "WEB";
String custId = "cust123";
String mobileNo = "7777777777";
String email = "username@emailprovider.com";
String txnAmount = "100.12";
String website = "WEBSTAGING";
// This is the staging value. Production value is available in your dashboard
String industryTypeId = "Retail";
// This is the staging value. Production value is available in your dashboard
String callbackUrl = "https://localhost:8080/maventrial/paytmresponse.jsp";
TreeMap<String, String> paytmParams = new TreeMap<String, String>();
paytmParams.put("MID",merchantMid);
paytmParams.put("ORDER_ID",orderId);
paytmParams.put("CHANNEL_ID",channelId);
paytmParams.put("CUST_ID",custId);
paytmParams.put("MOBILE_NO",mobileNo);
paytmParams.put("EMAIL",email);
paytmParams.put("TXN_AMOUNT",txnAmount);
paytmParams.put("WEBSITE",website);
paytmParams.put("INDUSTRY_TYPE_ID",industryTypeId);
paytmParams.put("CALLBACK_URL", callbackUrl);
String paytmChecksum = CheckSumServiceHelper.getCheckSumServiceHelper().genrateCheckSum(merchantKey, paytmParams);
StringBuilder outputHtml = new StringBuilder();
outputHtml.append("<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>");
outputHtml.append("<html>");
outputHtml.append("<head>");
outputHtml.append("<title>Merchant Checkout Page</title>");
outputHtml.append("</head>");
outputHtml.append("<body>");
outputHtml.append("<center><h1>Please do not refresh this page...</h1></center>");
String transactionURL="https://securegw-stage.paytm.in/theia/processTransaction"; 

//String paytmChecksum = CheckSumServiceHelper.getCheckSumServiceHelper().genrateCheckSum(merchantKey, paytmParams);

%>
<form method="post" action="https://securegw-stage.paytm.in/theia/processTransaction" name="f1">
            <table border="1">
                <tbody>
                    <input type="hidden" name="MID" value="FHMpjj07047623701884">
                    <input type="hidden" name="WEBSITE" value="WEBSTAGING">
                    <input type="hidden" name="ORDER_ID" value="order1">
                    <input type="hidden" name="CUST_ID" value="cust123">
                    <input type="hidden" name="MOBILE_NO" value="7777777777">
                    <input type="hidden" name="EMAIL" value="username@emailprovider.com">
                    <input type="hidden" name="INDUSTRY_TYPE_ID" value="Retail">
                    <input type="hidden" name="CHANNEL_ID" value="WEB">
                    <input type="hidden" name="TXN_AMOUNT" value="100.12">
                    <input type="hidden" name="CALLBACK_URL" value="https://localhost:8080/maventrial/paytmresponse.jsp">
                    <input type="hidden" name="CHECKSUMHASH" value="<%=paytmChecksum%>">
                </tbody>
            </table>
</form>
        <script type="text/javascript">
            document.f1.submit();
        </script>


       
      
    </body>
</html>

        
      