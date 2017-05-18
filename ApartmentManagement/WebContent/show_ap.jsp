<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table align="center" cellpadding="5" cellspacing="9" border="1">
<tr>
</tr>
<tr bgcolor="#A52A2A">
<td><b>Apartment Number</b></td>
<td><b>Number of rooms</b></td>
<td><b>Floor Level</b></td>
<td><b>status</b></td>
<td><b>Apartment_Number</b></td>
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
 ResultSet rs = st.executeQuery("SELECT apart_no,no_of_rooms,floor_level,status,no_of_parking_permits FROM Apartment");
while(rs.next())
{
%>
<tr bgcolor="#DEB887">
<td><%=rs.getString("apart_no") %></td>
<td><%=rs.getString("no_of_rooms") %></td>
<td><%=rs.getString("floor_level") %></td>
<td><%=rs.getString("status") %></td>
<td><%=rs.getString("no_of_parking_permits") %></td>
</tr>
<% 
}
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
Go to Home Page<a href ='success1.jsp'>Home</a>
</body>
</html>