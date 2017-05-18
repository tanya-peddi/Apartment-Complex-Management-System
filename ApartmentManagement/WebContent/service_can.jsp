<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Service Cancellation</title>
</head>
<body>
<%String usrnam=(String)session.getAttribute("userid");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ApartmentManagementSystem",
        "root", "admin123");
Statement st = con.createStatement();
ResultSet rs; 
ResultSet rs1;
int userid = 0;
rs= st.executeQuery("select user_id from user_login where uname='"+usrnam+"'");
   if(rs.next()) 
   { 
	   userid =rs.getInt(1);
   }
   
rs1 = st.executeQuery("select * from tenant where tenant_id='" + userid + "'");	
if(rs1.next())
	{%>
	<a href ='success2.jsp'>Go back</a>;	// Tenant Success
<% 
}
else
{ 
%>
	<a href ='success3.jsp'>Go back</a>;	// Permanent Success

<%}%>

<form method="post" action="cansuccess.jsp">
<table align="center" cellpadding="5" cellspacing="9" border="1">
<%
				    try{	String aptno="";
				    		ResultSet rs3;
				         	ResultSet rs2;
				         	rs3 =st.executeQuery("select apt_no from resident where resident_id='" +userid+ "'  ");
				         	if(rs3.next())
				         		aptno = rs3.getString(1);
				           rs2 =st.executeQuery("select complaint_description from service_request where apartment_number='" +aptno+ "' and status='Incomplete'");
				%>
				    <tr>
				    <td> Request Details</td>
				        <td><select name="req">
				        <%  while(rs2.next()){ %>
				            <option><%=rs2.getString(1)%></option>
				        <% }
				  
				        }
				        catch(Exception e)
				        {
				             out.println("wrong entry"+e);
				        }
				%>
				 </select>
				</td>
				</tr>
				<tr>
				<td><input type="submit" value="Cancel Request" /></td>
				</tr>
	</table>
	</form>
</body>
</html>