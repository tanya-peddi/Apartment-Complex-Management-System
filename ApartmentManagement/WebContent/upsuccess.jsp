<%@ page import ="java.sql.*" %>
<%
    String req = request.getParameter("req");    
    
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ApartmentManagementSystem",
            "root", "admin123");
    Statement st = con.createStatement();
    //ResultSet rs;
     int i = st.executeUpdate("update service_request set status =' Complete' "+ " where  service_request_id='" +req+ "'");
     
      if (i > 0) 
      {
        //session.setAttribute("userid", user);
         %>
	  <html><script type="text/javascript">alert("service request has been submitted"); </script></html>
        <%
        response.sendRedirect("success4.jsp");
    } else 
    {
        response.sendRedirect("update_req.jsp");
    }
   
  %> 