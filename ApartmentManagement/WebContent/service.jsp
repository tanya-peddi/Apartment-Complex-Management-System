<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import ="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Service Request</title>
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



      <form method="post" action="service_req.jsp">
            <center>
            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Enter Information Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <%
						 try{
    				         	ResultSet rs2;
    				            rs2 =st.executeQuery("select job_title from job_types ");
    				     %>
    				    <tr>
    				    <td> Service Type</td>
    				        <td><select name="job" required="">
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
                        <td>Apartment Number</td>
                        <td><input type="text" name="aptno" value="" required="" /></td>
                       </tr>
                       <tr>
                        <td>Description</td>
                        <td><input type="text" name="descrip" value="" required="" /></td>
                      </tr>
                  
                    <tr>
                        <td><input type="submit" value="Submit" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>
</body>
</html>