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
<td><b>First Name</b></td>
<td><b>Last Name</b></td>
<td><b>Email</b></td>
<td><b>User_id</b></td>
<td><b>Password</b></td>
<td><b>Phone</b></td>
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
ResultSet rs = st.executeQuery("SELECT first_name,last_name,email,staff_id,pass,phone_number FROM OfficeStaff INNER JOIN user_login on staff_id=user_id");
while(rs.next())
{
%>
<tr bgcolor="#DEB887">
<td><%=rs.getString("first_name") %></td>
<td><%=rs.getString("last_name") %></td>
<td><%=rs.getString("email") %></td>
<td><%=rs.getString("staff_id") %></td>
<td><%=rs.getString("pass") %></td>
<td><%=rs.getString("phone_number")%></td>
</tr>
<% 
}
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
Go to Home Page<a href ='success.jsp'>Home</a>
</body>
</html>