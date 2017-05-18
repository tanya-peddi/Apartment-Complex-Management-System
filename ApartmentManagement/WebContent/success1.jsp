<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LoginSession</title>
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
<td><a href="insert_ap.jsp">Insert Apartment Data</a>&nbsp;</td>
<td><a href="insert_rs.jsp">Insert Resident Details</a>&nbsp;</td>
<td><a href="insert_em.jsp">Insert Employee Details</a>&nbsp;</td>
<td><a href="insert_pm.jsp">Insert Property Manager Details</a>&nbsp;</td>
<td><a href="insert_maintbill.jsp">Generate Maintenance</a></td>

</tr>
<tr>
<td><a href="show_ap.jsp">Show Apartment Data</a>&nbsp;</td>
<td><a href="show_rs.jsp">Show Resident Data</a>&nbsp;</td>
<td><a href="show_em.jsp">Show Employee Data</a>&nbsp;</td>
<td><a href="show_pm.jsp">Show Property Manager Data</a>&nbsp;</td>
<td><a href="show_req_raised.jsp">Show Service Requests Raised</a>&nbsp;</td>
</tr>
<tr>
<td><a href="assign_emp.jsp">Assign Employee</a>&nbsp;</td>
<td><a href="insert_maintbill.jsp">Generate Maintenance</a></td>
</tr>
</table>
</body>
</html>