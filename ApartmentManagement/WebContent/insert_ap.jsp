<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Apartment Information</title>
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
      <form method="post" action="insertion_ap.jsp">
            <center>
            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Enter Information Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Apartment Number</td>
                        <td><input type="text" name="apart_no" value="" required=""/></td>
                    </tr>
                    <tr>
                        <td>Number of rooms</td>
                        <td><input type="text" name="no_of_rooms" value="" required="" /></td>
                    </tr>
                    <tr>
                        <td>Floor level</td>
                        <td><input type="text" name="floor_level" value="" required=""/></td>
                    </tr>
                    <tr>
                        <td>Status</td>
                        <td><input type="text" name="status" value="" required=""/></td>
                    </tr>
                    <tr>
                        <td>Number of Parking Permits</td>
                        <td><input type="text" name="no_of_parking_permits" value="" required=""/></td>>
                    
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