<%-- 
    Document   : paytmresponse
    Created on : 29 Mar, 2019, 1:48:10 PM
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
            String mid=request.getParameter("MID");
            
            %>
        <h1>Hello World!</h1>
        <html>
   <head>
     <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
     <title>Paytm Secure Online Payment Gateway</title>
   </head>
  
      <table align='center'>
            <tr>
            <td><STRONG>Transaction is being processed,</STRONG></td>
            </tr>
            <tr>
            <td><font color='blue'>Please wait ...</font></td>
            </tr>
            <tr>
            <td>(Please do not press 'Refresh' or 'Back' button</td>
            </tr>
      </table>
      <FORM NAME='TESTFORM' ACTION='https://<Merchant_Response_URL>' METHOD='POST'>
            <input type='hidden' name='CURRENCY' value='INR'>
            <input type='hidden' name='CUST_ID' value='cust123'>
            <input type='hidden' name='GATEWAYNAME' value='WALLET'>
            <input type='hidden' name='RESPMSG' value='Txn Success'>
            <input type='hidden' name='BANKNAME' value='WALLET'>
            <input type='hidden' name='PAYMENTMODE' value='PPI'>
            <input type='hidden' name='MID' value='rxazcv89315285244163'>
            <input type='hidden' name='RESPCODE' value='01'>
            <input type='hidden' name='TXNID' value='20180821111212800110168085600021958'>
            <input type='hidden' name='TXNAMOUNT' value='100.12'>
            <input type='hidden' name='ORDERID' value='order1'>
            <input type='hidden' name='STATUS' value='TXN_SUCCESS'>
            <input type='hidden' name='BANKTXNID' value='5357590'>
            <input type='hidden' name='TXNDATE' value='2018-08-21 15:16:11.0'>
            <input type='hidden' name='CHECKSUMHASH'   value='YjtlLUVs6gQhR8RuUltwOsGnGXBg7gpdMRAKYU/ qiTZCeJZmwbciUFmwtT6RmwBmpwVswSiknJK7iEBch27q627uzTXKxJ0vzoMs68AE9A='>
      </FORM>
  
 <script type="text/javascript">  document.forms[0].submit();</script>    
</html>
    </body>
</html>
