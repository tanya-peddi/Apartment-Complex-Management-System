<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import ="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pay Maintenance</title>
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
			    	        String aptno ="";
					    	ResultSet rs2;
					    	ResultSet rs;
					    	rs =st.executeQuery("select apt_no from resident where resident_id='"+userid+"'");
						    rs2 =st.executeQuery("select apartment_number from apartment_propmanager where property_mgr_id='"+userid+"'");
							if(rs2.next())
							{ 
								aptno = rs2.getString(1);
							}
							else if (rs.next())
							{
								aptno = rs.getString(1);
							
							}	
			
			int i = st.executeUpdate("update maintain set status ='Paid' "+ " where  service_request_id='" +req+ "'");	    
				    
				    
				    
				    
				    }
					
					%>
				    	        



</body>
</html>