<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Office Staff</title>
</head>
<body>
<a href ='success1.jsp'>Go back</a>
      <form method="post" action="insertion_rs.jsp">
            <center>
            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Enter Information Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>First Name</td>
                        <td><input type="text" name="fname" value="" required=""/></td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td><input type="text" name="lname" value="" required="" /></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="email" value="" required=""/></td>
                    </tr>
                    <tr>
                        <td>Phone Number</td>
                        <td><input type="text" name="phone" value="" required=""/></td>
                    </tr>
                    <tr>
                        <td>Username</td>
                        <td><input type="text" name="uname" value="" required=""/></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="pass" value="" required="" /></td>
                    </tr>
                    <tr>
                        <td>Apartment Number</td>
                        <td><input type="text" name="aptno" value="" required="" /></td>
                    </tr>
 				   <tr>
 				   <td>Property Manager</td>
 				   <td><select name="PropertyManager">
					   <option value="yes">yes</option>
					   <option value="no">no</option>
				      </select>
				      </td>
 				  </tr>
 				  
				<%
				    try{
				    	 Class.forName("com.mysql.jdbc.Driver");
				    	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ApartmentManagementSystem",
				    	            "root", "admin123");
				    	    Statement st = con.createStatement();
				         	ResultSet rs2;
				            rs2 =st.executeQuery("select  first_name,last_name from propertymanager") ;
				%>
				    <tr>
				    <td> PropertManager Name</td>
				        <td><select>
				        <%  while(rs2.next()){ %>
				            <option><%= rs2.getString(1)%>,<%= rs2.getString(2)%></option>
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