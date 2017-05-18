<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Status</title>
</head>
<body>
<a href ='success4.jsp'>Go back</a>
<form method="post" action="upsuccess.jsp">
<table align="center" cellpadding="5" cellspacing="9" border="1">
<%
				    try{
				    	 Class.forName("com.mysql.jdbc.Driver");
				    	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ApartmentManagementSystem",
				    	            "root", "admin123");
				    	    Statement st = con.createStatement();
				    	    ResultSet rs1;
				    	    String usrnam=(String)session.getAttribute("userid");
				    	    int userid = 0;
				    	    rs1= st.executeQuery("select user_id from user_login where uname='"+usrnam+"'");
				    	       if(rs1.next()) 
				    	       { 
				    	    	   userid =rs1.getInt(1);
				    	       }
				    	        
				         	ResultSet rs2;
				            rs2 =st.executeQuery("select service_request_id from service_request inner join service_request_assigned on service_request_id=service_req_id where employee_assigned_id='"+userid+"'");
				%>
				    <tr>
				    <td> Request Details</td>
				        <td><select name="req">
				        <%  while(rs2.next()){ %>
				            <option><%= rs2.getString(1)%></option>
				        <% } %>
				        </select>
				     </td>
					</tr>
				        <%
				        }
				        catch(Exception e)
				        {
				             out.println("wrong entry"+e);
				        }
						%>
				        
				<tr>
				<td><input type="submit" value="Update Status" /></td>
				</tr>
	</table>
	</form>
</body>
</html>