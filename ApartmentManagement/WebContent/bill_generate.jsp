<%@ page import ="java.sql.*,java.util.Date,java.text.*;" %>
<%  
    String aptno = request.getParameter("apart_no");    
    String duedt = request.getParameter("duedate");
    String amt = request.getParameter("amt");
    String status = request.getParameter("status");
    
    SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD");
    Date duedte = sdf.parse(duedt);
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ApartmentManagementSystem",
            "root", "admin123");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from maintenance_bill where apart_no='" + aptno+ "'");
    if(rs.next())
    {
    	out.println("Bill for this Apartment has already generated.<a href='insert_ap.jsp'>try again</a>");
    	
    }
    else
    {	
    int i = st.executeUpdate("insert into maintenance_bill(apart_no,due_date,amount_due,status_of_current_month) values ('"+ aptno + "','" + duedte + "','"+ amt +"','" + status +"')");
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("success1.jsp");
    } else {
        response.sendRedirect("insert_maintbill.jsp");
    }
   }
%>
 
   