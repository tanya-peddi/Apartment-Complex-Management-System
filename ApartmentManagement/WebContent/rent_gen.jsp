<%@ page import ="java.sql.*,java.util.Date,java.text.*;" %>
<%  
    String aptno = request.getParameter("apart_no");
	String tenant = request.getParameter("tenant");
    String duedt = request.getParameter("duedate");
    String amt = request.getParameter("amt");
    String status = request.getParameter("pstatus");
    String comment = request.getParameter("comm");  
    SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD");
    Date duedte = sdf.parse(duedt);
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ApartmentManagementSystem",
            "root", "admin123");
    Statement st = con.createStatement();
    ResultSet rs;
    int userid = 0;
    rs= st.executeQuery("select resident_id from resident where first_name='"+tenant+"'");
       if(rs.next()) 
       { 
    	   userid =rs.getInt(1);
    	   
       }
    ResultSet rs1;
    rs1 = st.executeQuery("select * from rent where apart_number='" + aptno+"and tenant_id='"+userid+"'");
    if(rs.next())
    {
    	out.println("Rent has been generated for tenant this Apartment has already generated.<a href='insert_ap.jsp'>try again</a>");
    	
    }
    else
    {	
    int i = st.executeUpdate("insert into rent(tenant_id,apart_no,rent_amount,due_date,payment_status,comment) values ('"+ aptno + "','" +userid +"','"+ duedte + "','"+ amt +"','" + status+"','" +comment+"')");
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("success5.jsp");
    } else {
        response.sendRedirect("insert_rent.jsp");
    }
   }
%>
 
   