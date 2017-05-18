 <%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    String phone =request.getParameter("phone");
    String jbtype = request.getParameter("jbtype");
    int role =3;
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ApartmentManagementSystem",
            "root", "admin123");
    Statement st = con.createStatement();
    ResultSet rs;
    ResultSet rs1; 
	ResultSet rs2;
	String job_id ="" ;
    int count=0;
    
    
  rs1= st.executeQuery("select * from user_login");
    while (rs1.next()) 
    {
  	//out.println("before"+count); 
      ++count;
  	out.println("\n after"+count);   
     }
   
    rs = st.executeQuery("select * from employee where email='" + email+ "'");
    if(rs.next())
    {
    	out.println("User already exits.<a href='insert_os.jsp'>try again</a>");
    	
    }
    else
    {	
       rs2= st.executeQuery("select job_id from job_types where job_title='"+jbtype+"'");
   	   if(rs2.next())
   	    {
   	   
   	    	job_id=rs2.getString(1);
   	    }	
    int j = st.executeUpdate("insert into user_login (user_id,uname,pass,role_id) values('" + (count+1) + "','" + user + "','" + pwd+ "','"+role +"')");	
    int i = st.executeUpdate("insert into employee(employee_id,job_type,last_name,first_name,email,phone_number) values ('"+ (count+1) +"','"+ job_id + "','" + lname + "','"+ fname +"','" + email + "','" + phone+"')");

    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("welcome1.jsp");
    } else {
        response.sendRedirect("insert_em.jsp");
    }
   } 
%>