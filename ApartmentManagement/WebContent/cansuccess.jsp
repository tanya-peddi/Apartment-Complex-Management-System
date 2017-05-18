<%@ page import ="java.sql.*" %>
<%
    String req = request.getParameter("req");    
    String usrnam=(String)session.getAttribute("userid");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ApartmentManagementSystem",
            "root", "admin123");
    Statement st = con.createStatement();
    ResultSet rs;
     int i = st.executeUpdate("delete from service_request where  complaint_description='" +req+ "'");
     
      if (i > 0) 
      {  int userid=0;
        //session.setAttribute("userid", user);
		      	 rs= st.executeQuery("select user_id from user_login where uname='"+usrnam+"'");
		        if(rs.next()) 
		        { 
		     	   userid =rs.getInt(1);
		        }
		       	 rs = st.executeQuery("select * from tenant where tenant_id='" + userid + "'");	
		  		   if(rs.next())
		     		{ 
		     		%>
			  <html><script type="text/javascript">alert("service request has been cancelled"); </script></html>
		        <%
		        response.sendRedirect("success2.jsp");
		     		// Tenant Success
		     
		    		 }
		     	else
		     	{ 
		   		  %>
		     	 <html><script type="text/javascript">alert("service request has been cancelled"); </script></html>	// Permanent Success
				<%
		    	response.sendRedirect("success3.jsp");
		    	} 
  	
      }  		   
     else 
    {
        response.sendRedirect("service_can.jsp");
    }
   
 
  %> 