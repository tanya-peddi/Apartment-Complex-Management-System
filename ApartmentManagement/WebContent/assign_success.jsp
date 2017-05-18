<%@ page import ="java.sql.*" %>
<%
    int req = Integer.parseInt(request.getParameter("svr"));  
    String fname = request.getParameter("emp");  
    
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ApartmentManagementSystem",
            "root", "admin123");
    Statement st = con.createStatement();
    ResultSet rs;
    int empid =0;
    rs =st.executeQuery("select employee_id from employee where first_name='"+fname+"'");
    if(rs.next())
    {
    	empid=rs.getInt(1);
    }
  	

     int i = st.executeUpdate("insert into service_request_assigned(service_req_id,employee_assigned_id) values('" + req+ "','"+empid+"')");
     
      if (i > 0) 
      {
        //session.setAttribute("userid", user);
         %>
	  <html><script type="text/javascript">alert("service request has been submitted"); </script></html>
        <%
        response.sendRedirect("assign_emp.jsp");
    } else 
    {
        response.sendRedirect("show_req_raised.jsp");
    }
   
 
  %> 