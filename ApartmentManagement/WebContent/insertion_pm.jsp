<%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    String phone =request.getParameter("phone");
    String aptno = request.getParameter("aptno");
    int role =4;
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ApartmentManagementSystem",
            "root", "admin123");
    Statement st = con.createStatement();
    ResultSet rs;
    ResultSet rs1; 

    int count=0;
    rs1= st.executeQuery("select * from user_login");
    
    while (rs1.next()) 
    {
  	//out.println(count); 
      ++count;
      //out.println(count); 
     }
    
    rs = st.executeQuery("select * from propertymanager where email='" + email+ "'");
    if(rs.next())
    {
    	out.println("User already exits.<a href='insert_os.jsp'>try again</a>");
    	
    }
    else
    {	
    int j = st.executeUpdate("insert into user_login (user_id,uname,pass,role_id) values('" + (count+1) + "','" + user + "','" + pwd+ "','"+role +"')");	
    int i = st.executeUpdate("insert into propertymanager(propertymanager_id,apartment_no,last_name,first_name, email,phone_no) values ('"+ (count+1) +"','"+ aptno + "','" + lname + "','"+ fname +"','" + email + "','" + phone+"')");

    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("welcome1.jsp");
    } else {
        response.sendRedirect("insert_pm.jsp");
    }
   }
%>