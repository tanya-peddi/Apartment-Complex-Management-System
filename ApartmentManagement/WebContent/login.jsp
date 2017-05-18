<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ApartmentManagementSystem",
            "root", "admin123");
   Statement st = con.createStatement();
   ResultSet rs;
   ResultSet rs1;
   rs = st.executeQuery("select user_id,role_id from user_login where uname='" + userid + "' and pass='" + pwd + "'");
    
    if(rs.next()) 
       { 
    	int usrid = rs.getInt(1);
        session.setAttribute("userid", userid);
        if(rs.getInt("role_id")==1)
        {
        	response.sendRedirect("success.jsp");
        }
        else if(rs.getInt("role_id")==2)
         {
        	response.sendRedirect("success1.jsp");	
         }
        else if(rs.getInt("role_id")==3)
        {
       	response.sendRedirect("success4.jsp");	//Employee Success
        }
        else if(rs.getInt("role_id")==4)
        {
       	response.sendRedirect("success5.jsp");	// PropertyManager Success
        }
        else if(rs.getInt("role_id")==5)
        {
        rs1 = st.executeQuery("select * from tenant where tenant_id='" + usrid + "'");	
        
        if(rs1.next())
       	response.sendRedirect("success2.jsp");	// Tenant Success
        else
        response.sendRedirect("success3.jsp");	// Permanent resident Success
        }
       }
     else
       {
     out.println("Invalid username/password <a href='index.jsp'>try again</a>");
       
      }
    rs.close();
  
%>