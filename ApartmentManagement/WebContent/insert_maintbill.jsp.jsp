<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import ="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Generate maintenance bill</title>
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
<a href ='success1.jsp'>Go back</a>
      <form method="post" action="bill_generate.jsp">
            <center>
            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Enter Information Here</th>
                    </tr>
                </thead>
                <tbody>
                <%
				    try{
				    	 Class.forName("com.mysql.jdbc.Driver");
				    	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ApartmentManagementSystem",
				    	            "root", "admin123");
				    	    Statement st = con.createStatement();
				         	ResultSet rs2;
				            rs2 =st.executeQuery("select apart_no from apartment") ;
				%>
				    <tr>
				    <td>Apartment Number</td>
				        <td><select name="apart_no">
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
                        <td>Due Date</td>
                        <td><input type= "date"  name="duedate" value="" required="" /></td>
                    </tr>
                    <tr>
                        <td>Amount Due</td>
                        <td><input type="text" name="amt" value="" required=""/></td>
                    </tr>
                    <tr>
                        <td>Status_of_current_month</td>
                        <td><input type="text" name="status" value="" required=""/></td>
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

</body>
</html>