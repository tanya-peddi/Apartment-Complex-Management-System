<%@ page import ="java.sql.*" %>
<%
    String aptno = request.getParameter("apart_no");    
    String noofrooms = request.getParameter("no_of_rooms");
    String flrlvl = request.getParameter("floor_level");
    String status = request.getParameter("status");
    String noofpp =request.getParameter("no_of_parking_permits");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ApartmentManagementSystem",
            "root", "admin123");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from apartment where apart_no='" + aptno+ "'");
    if(rs.next())
    {
    	out.println("Apartment already exits.<a href='insert_ap.jsp'>try again</a>");
    	
    }
    else
    {	
    int i = st.executeUpdate("insert into apartment(apart_no,no_of_rooms,floor_level, status,no_of_parking_permits) values ('"+ aptno + "','" + noofrooms + "','"+ flrlvl +"','" + status + "','" + noofpp +"')");
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("welcome1.jsp");
    } else {
        response.sendRedirect("insert_ap.jsp");
    }
   }
%>
 
   