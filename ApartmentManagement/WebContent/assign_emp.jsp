<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assign Employee to service request</title>
</head>
<body>
<a href ='success1.jsp'>Go back</a>
      <form method="post" action="insertion_em.jsp">
           <center>
            <table border="1" width="30%" cellpadding="5">
                <tbody>
                    <%
				    try{
				    	 Class.forName("com.mysql.jdbc.Driver");
				    	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ApartmentManagementSystem",
				    	            "root", "admin123");
				    	    Statement st = con.createStatement();
				    	    String jbtle = (String)session.getAttribute("jobtitle");
				         	ResultSet rs2;
				            rs2 =st.executeQuery("select job_id from job_types where job_title='"+jbtle+"'");
				            int jobid = rs2.getInt(1);
				            ResultSet rs1;
				            rs1 =st.executeQuery("select service_request from service_request inner join job_types on job_type_id=job_id where job_title='"+jbtle+"'");
				%>
				    <tr>
				    <td>Service request</td>
				        <td><select name="svr">
				        <%  while(rs2.next()){ %>
				            <option><%= rs2.getString(1)%></option>
				        <% } %>
				        </select>
					</td>
					</tr>
				
				<% ResultSet rs;
				   rs =st.executeQuery("select first_name from employee inner join job_types on job_type=job_id where job_type='"+jobid+"'");
				  %>
				   <tr>
				    <td>Employee</td>
				        <td><select name="emp">
				        <%  while(rs.next()){ %>
				            <option><%= rs.getString(1)%></option>
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
                        <td><input type="submit" value="Submit" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
				  </tbody>
            </table>
            </center>
	</form>
</body>
</html>