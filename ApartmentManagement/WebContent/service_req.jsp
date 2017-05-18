<%@ page import ="java.sql.*" %>
<%
    String job = request.getParameter("job");    
    String aptno = request.getParameter("aptno");
    String descrip = request.getParameter("descrip");
    String usrnam=(String)session.getAttribute("userid");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ApartmentManagementSystem",
            "root", "admin123");
    Statement st = con.createStatement();
    ResultSet rs;
    ResultSet rs1; 
    int job_id=0;
    
    rs = st.executeQuery("select job_id from employee where job_title='" +job+ "'");
    if(rs.next())
    {
      job_id=rs.getInt(1);
    }
    int i = st.executeUpdate("insert into service_request(job_type_id,apartment_number,complaint_description,date_of_complaint) values('" + job_id + "','" +aptno + "','" + descrip+"',CURDATE())");	
    
    if (i > 0) 
    {
    	int userid=0;
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
        response.sendRedirect("service.jsp");
     }
   
%>