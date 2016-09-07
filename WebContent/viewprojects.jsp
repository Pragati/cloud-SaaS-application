<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="starter-template.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Incentives</title>
</head>
<body style="background-color:beige" >
<div class="navbar navbar-inverse navbar-fixed-top" style="background-color:FireBrick">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="tester.jsp">Tester</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="reportbugs.jsp">Report bugs</a></li>
            <li><a href="viewprojects.jsp"> View Projects</a></li>
            <li><a href="incentives.jsp">Incentives</a></li>
          </ul>
         <div class="navbar-form navbar-right">
         <form action="logout.jsp">
         <p style="color:white;"><span class="glyphicon glyphicon-user"></span> Welcome
         <button  class="btn btn-info" ><span class="glyphicon glyphicon-log-out"></span> Logout</button>
         </p>
         </form>
          </div>
        </div>
      </div>
    </div>
<%
	String driver ="com.mysql.jdbc.Driver";
	String dburl="jdbc:mysql://testdbinstance.cy7eqis8fosr.us-west-2.rds.amazonaws.com:3306/testdb";
	//String dburl = "jdbc:mysql://localhost/test_db";
	String dbusername = "root";
	String dbpassword = "mysql123";

	

	Connection con=null;
    ResultSet rs=null;
    PreparedStatement ps=null;
    PreparedStatement ps2=null;

    String query="select p.project_id, p.project_name, a.app_language, a.app_platform, p.start_date, p.end_date, a.app_file from projects p, apps a where p.app_id=a.app_id and p.app_name=a.app_name and p.project_id is not null";
	Class.forName(driver).newInstance();
	
    con = DriverManager.getConnection(dburl,dbusername,dbpassword);
    ps=con.prepareStatement(query);
	
	rs=ps.executeQuery();	
%> 
 <form action="TesterServlet" method="GET">       
 <div class="container theme-showcase" >
      <div class="page-header">

<br>
     <h1>View Projects</h1>
    </div>
  <table class="table">
      <thead>
          <tr>
              <th>Project ID</th>
              <th>Project Name</th>
              <th>App Language</th>
              <th>App Platform</th>
              <th>Project Start Date</th>
              <th>Project End Date</th>
          </tr>   
                  	
      </thead>
      <tbody>
      <% while (rs.next()) {%>
      	<tr>
               <td> <%= rs.getString(1) %> </td>
               <td> <%= rs.getString(2) %> </td>
               <td> <%= rs.getString(3) %> </td>
               <td> <%= rs.getString(4) %> </td>
               <td> <%= rs.getDate(5) %> </td>
               <td> <%= rs.getDate(6) %> </td>
               <td> <button type="submit" class="btn btn-primary" name="projectID" id="<%= rs.getString(1)%>" value="<%= rs.getString(1)%>"> Download</button> </td>
               
           </tr>
         <% } %>
         <% con.close(); %>
      </tbody>
  </table>
  
  <div align="center" style='color:red' >
  <%
	HttpSession userSession= request.getSession();	
	if(userSession.getAttribute("Message")!=null)
	{
    	out.println(userSession.getAttribute("Message"));
    	userSession.removeAttribute("Message");
	}
	%>   
  </div> 
  </form>

 
</body>
</html>