<%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    String phone =request.getParameter("phone");
    int role =2;
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
    
    // rs1.last();
    // int count = rs1.getRow();
    rs = st.executeQuery("select * from OfficeStaff where email='" + email+ "'");
    if(rs.next())
    {
    	out.println("User already exits.<a href='insert_os.jsp'>try again</a>");
    	
    }
    else
    {	
    int j = st.executeUpdate("insert into user_login (user_id,uname,pass,role_id) values('" + (count+1) + "','" + user + "','" + pwd+ "','"+role +"')");	
    int i = st.executeUpdate("insert into OfficeStaff(staff_id,last_name,first_name, email,phone_number) values ('"+ (count+1) + "','" + lname + "','"+ fname +"','" + email + "','" + phone +"')");

    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("welcome.jsp");
    } else {
        response.sendRedirect("insert_os.jsp");
    }
   }
  
%>

 
   