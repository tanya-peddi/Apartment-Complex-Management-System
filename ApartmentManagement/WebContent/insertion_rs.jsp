<%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    String phone =request.getParameter("phone");
    String aptno = request.getParameter("aptno");
    String propmgr = request.getParameter("PropertyManager");
    int role =5;
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ApartmentManagementSystem",
            "root", "admin123");
    Statement st = con.createStatement();
    ResultSet rs;
    ResultSet rs1; 
    ResultSet rs2;
    int count=0;
    rs1= st.executeQuery("select * from user_login");
    
    while (rs1.next()) 
    {
  	//out.println(count); 
      ++count;
       
     }
    
    rs = st.executeQuery("select * from resident where email='" + email+ "'");
    if(rs.next())
    {
    	out.println("User already exits.<a href='insert_os.jsp'>try again</a>");
    	
    }
    else
    {	
    	String pm = "";
    	rs2 = st.executeQuery("select propertymanager_id from propertymanager where apartment_no='" +aptno+ "'");
   		 if(rs2.next())
   		 {
   		 pm= rs2.getString(1); 
   		 }
   			 
    	if(propmgr.equals("yes"))
   		{
    
		    int j = st.executeUpdate("insert into user_login (user_id,uname,pass,role_id) values('" + (count+1) + "','" + user + "','" + pwd+ "','"+role +"')");	
		    int i = st.executeUpdate("insert into resident(resident_id,last_name,first_name, email,phone_number,apt_no) values ('"+ (count+1) + "','" + lname + "','"+ fname +"','" + email + "','" + phone +"','"+aptno+"')");
		    int k =	st.executeUpdate("insert into tenant(tenant_id,propertymanager_id) values('" + (count+1) + "','" +pm+"')");
			    if (i > 0) {
			        //session.setAttribute("userid", user);
			        response.sendRedirect("welcome1.jsp");
			    } else {
			        response.sendRedirect("insert_rs.jsp");
			    }
   		
   		
   		}
   		else
   		{
			  
			  int l = st.executeUpdate("insert into user_login (user_id,uname,pass,role) values('" + (count+1) + "','" + user + "','" + pwd+ "','"+role +"')");	
			  int m = st.executeUpdate("insert into resident(resident_id,last_name,first_name, email,phone_number,apt_no) values ('"+ (count+1) + "','" + lname + "','"+ fname +"','" + email + "','" + phone +"','"+aptno+"')");
			  int n =	st.executeUpdate("insert into permanentresident(pr_id) values('" + (count+1)+"')");    
			  if (m > 0) {
			      //session.setAttribute("userid", user);
			      response.sendRedirect("welcome1.jsp");
			  } else {
			      response.sendRedirect("insert_rs.jsp");
			  }	
   			
   		}
   
    
    
   }
%>
 
   