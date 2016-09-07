<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%



String user_type=request.getParameter("usertype");

if(user_type.equals("app-provider")){
	String first_name=request.getParameter("fname");
	String last_name=request.getParameter("lname");
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	String email=request.getParameter("email");
	String phone=request.getParameter("phone");
	String address=request.getParameter("address");
	String card_number=request.getParameter("cardnumber");
	String expiry_date=request.getParameter("expirydate");
	String cvv=request.getParameter("cvv");
	
	System.out.println(first_name);
	System.out.println(last_name);
	System.out.println(username);
	System.out.println(password);
	System.out.println(email);
	System.out.println(phone);
	System.out.println(address);
	System.out.println(user_type);
	System.out.println(card_number);
	System.out.println(expiry_date);
	System.out.println(cvv);

	try{
		
		String driver ="com.mysql.jdbc.Driver";
		String dburl="jdbc:mysql://testdbinstance.cy7eqis8fosr.us-west-2.rds.amazonaws.com:3306/testdb";
		//String dburl = "jdbc:mysql://localhost/test_db";
		String dbusername = "root";
		String dbpassword = "mysql123";
		
		Connection con=null;
		Class.forName(driver).newInstance();
		con = DriverManager.getConnection(dburl,dbusername,dbpassword);
		
		PreparedStatement pst1=null;
		PreparedStatement pst2=null;
		
		pst1=con.prepareStatement("insert into users(username,password,user_type) VALUES (?, ?, ?)");
		pst2=con.prepareStatement("insert into app_providers(first_name,last_name,username,password,email,phone,address,cardnumber,cvv,expirydate) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		
		pst1.setString(1,username);
		pst1.setString(2,password);
		pst1.setString(3,user_type);
		
		pst2.setString(1,first_name);
		pst2.setString(2,last_name);
		pst2.setString(3,username);
		pst2.setString(4,password);
		pst2.setString(5,email);
		pst2.setString(6,phone);
		pst2.setString(7,address);
		pst2.setString(8,card_number);
		pst2.setString(9,cvv);
		pst2.setString(10,expiry_date);
		
		
		int i= pst1.executeUpdate();
		int j= pst2.executeUpdate();
		
		pst1.clearParameters();
		pst2.clearParameters();
		
		if(i>0){
			if(j>0){
				session.setAttribute("message","Registration done successfully!!!");
				response.sendRedirect(request.getContextPath() + "/signupapp.jsp");	
				//response.sendRedirect("regsuccess.html");
			}
			else{
		    response.sendRedirect("regfailed.html");
		    }
			}
		else{
				response.sendRedirect("regfailed.html");
			}
				
	}
	catch (Exception e) {
	System.out.println("Error!!!" +e);
	e.printStackTrace();
	response.sendRedirect("regfailed.html");	
}	
}
	
 else if (user_type.equals("tester"))
	{
	 
			String first_name=request.getParameter("fname");
			String last_name=request.getParameter("lname");
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			String skillset1=request.getParameter("skillset1");
			String skillset2=request.getParameter("skillset2");
			String skillset3=request.getParameter("skillset3");
			String email=request.getParameter("email");
			String phone=request.getParameter("phone");
			String address=request.getParameter("address");
			String card_number=request.getParameter("cardnumber");
			String expiry_date=request.getParameter("expirydate");
			String cvv=request.getParameter("cvv");
			
			System.out.println(first_name);
			System.out.println(last_name);
			System.out.println(username);
			System.out.println(password);
			System.out.println(skillset1);
			System.out.println(skillset2);
			System.out.println(skillset3);
			System.out.println(email);
			System.out.println(phone);
			System.out.println(address);
			System.out.println(user_type);
			System.out.println(card_number);
			System.out.println(expiry_date);
			System.out.println(cvv);


			try{
				
				String driver ="com.mysql.jdbc.Driver";
				String dburl="jdbc:mysql://testdbinstance.cy7eqis8fosr.us-west-2.rds.amazonaws.com:3306/testdb";
				//String dburl = "jdbc:mysql://localhost/test_db";
				String dbusername = "root";
				String dbpassword = "mysql123";
				
				Connection con=null;
				Class.forName(driver).newInstance();
				con = DriverManager.getConnection(dburl,dbusername,dbpassword);
				
				PreparedStatement pst1=null;
				PreparedStatement pst2=null;
				
				pst1=con.prepareStatement("insert into users(username,password,user_type) VALUES (?, ?, ?)");
				pst2=con.prepareStatement("insert into testers(first_name,last_name,username,password,email,phone,address,skillset1,skillset2,skillset3,cardnumber,expirydate,cvv) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
				
				pst1.setString(1,username);
				pst1.setString(2,password);
				pst1.setString(3,user_type);
				
				pst2.setString(1,first_name);
				pst2.setString(2,last_name);
				pst2.setString(3,username);
				pst2.setString(4,password);
				pst2.setString(5,email);
				pst2.setString(6,phone);
				pst2.setString(7,address);
				pst2.setString(8,skillset1);
				pst2.setString(9,skillset2);
				pst2.setString(10,skillset3);
				pst2.setString(11,card_number);
				pst2.setString(12,expiry_date);
				pst2.setString(13,cvv);
				
				
				int i= pst1.executeUpdate();
				int j= pst2.executeUpdate();
				
				pst1.clearParameters();
				pst2.clearParameters();
				
				if(i>0){
					if(j>0){
						session.setAttribute("message","Registration done successfully!!!");
						response.sendRedirect(request.getContextPath() + "/signuptester.jsp");	
					//response.sendRedirect("regsuccess.html");
					}
					else{
				    response.sendRedirect("regfailed.html");
				    System.out.println("Error inside if!!!");
				    }
					}
				else{
						response.sendRedirect("regfailed.html");
						System.out.println("Error inside else!!!");
					}
						
			}
			catch (Exception e) {
			System.out.println("Error!!!" +e);
			e.printStackTrace();
			response.sendRedirect("regfailed.html");
			
		}	

	}

%>