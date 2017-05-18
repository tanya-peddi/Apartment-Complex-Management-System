<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LoginSession_tenant</title>
</head>
<body>
<%
 if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) 
 {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("userid")%>
<a href='logout.jsp'>Log out</a>
<%
    }
%>
<table>
<tr>
<td><a href="service.jsp">Raise A Service Request</a>&nbsp;</td>
<td><a href="service_can.jsp">Cancel A  Raised Service Request</a>&nbsp;</td>
<td><a href="pay_rent">Pay Rent</a>&nbsp;</td>
<td><a href="#">Request Parking Permit</a>&nbsp;</td>
<td><a href="#">Renew Parking Permit</a>&nbsp;</td>

</tr>
</table>
</body>
</html>