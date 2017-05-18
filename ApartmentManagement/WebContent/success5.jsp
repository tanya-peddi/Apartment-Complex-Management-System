<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LoginSession_Propertymanager</title>
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
<td><a href="service_disp.jsp">Show Service Requests Raised</a>&nbsp;</td>
<td><a href="insert_rent.jsp">Generate Rent Amount</a></td>
<td><a href="pay_maint.jsp">Pay Maintenance</a>&nbsp;</td>

</tr>
</table>
</body>
</html>