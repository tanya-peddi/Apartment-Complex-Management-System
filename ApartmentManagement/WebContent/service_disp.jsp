<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Service Requests</title>
</head>
<body>
<table align="center" cellpadding="5" cellspacing="9" border="1">
<tr>
</tr>
<tr bgcolor="#A52A2A">
<td><b>Apartment Number</b></td>
<td><b>Status</b></td>
<td><b>Complaint Description</b></td>
<td><b>Date Of Complaint  Reported</b></td>
</tr>
<%@ page import ="java.sql.*" %>
<% 
try{
String userid = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ApartmentManagementSystem",
            "root", "admin123");
Statement st = con.createStatement();
 ResultSet rs = st.executeQuery("SELECT apartment_number,status,complaint_description,date_of_complaint FROM service_request inner join propertymanager on apartment_number=apartment_no");
while(rs.next())
{
%>
<tr bgcolor="#DEB887">
<td><%=rs.getString("apartment_number") %></td>
<td><%=rs.getString("status") %></td>
<td><%=rs.getString("complaint_description") %></td>
<td><%=rs.getString("date_of_complaint") %></td>
</tr>
<% 
}
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
Go to Home Page<a href ='success5.jsp'>Home</a>
</body>
</html>