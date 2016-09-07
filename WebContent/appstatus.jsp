<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="http://getbootstrap.com/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="starter-template.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>App status</title>
</head>
<body style="background-color: Beige">
	<div class="navbar navbar-inverse navbar-fixed-top"
		style="background-color: FireBrick">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="app-provider.jsp">App-provider</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="uploadapp.jsp">Upload App</a></li>
					<li><a href="appstatus.jsp">App Status</a></li>
				</ul>
				<div class="navbar-form navbar-right">
					<form action="logout.jsp">
						<p style="color: white;">
							<span class="glyphicon glyphicon-user"></span> Welcome
							<button class="btn btn-info">
								<span class="glyphicon glyphicon-log-out"></span> Logout
							</button>
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

    String query="select apps.app_id,apps.app_name, bugs.tester_id, bugs.bug_id, bugs.bug_desc, bugs.bug_criticality, bugs.bug_status from apps, bugs where bugs.app_id=apps.app_id and bugs.app_name=apps.app_name and apps.app_provider_id = '"+request.getSession().getAttribute("user") +"'";
	
    Class.forName(driver).newInstance();
	
    con = DriverManager.getConnection(dburl,dbusername,dbpassword);
    ps=con.prepareStatement(query);
	
	rs=ps.executeQuery();

	
%>
	<form method="POST" name="appstatus.jsp" class="form-horizontal">
		<div class="container theme-showcase">
			<div class="page-header">
				<br>
				<h1>App status</h1>
			</div>
			<table class="table">
				<thead>
					<tr>
						
						<th>App ID</th>
						<th>App Name</th>
						<th>Tester ID</th>
						<th>Bug ID</th>
						<th>Bug Desc</th>
						<th>Bug Criticality</th>
						<th>Bug Status</th>
					</tr>

				</thead>
				<tbody>
					<% while (rs.next()) {%>
					<tr>
						<td><%= rs.getString(1) %></td>
						<td><%= rs.getString(2) %></td>
						<td><%= rs.getString(3) %></td>
						<td><%= rs.getString(4) %></td>
						<td><%= rs.getString(5) %></td>
						<td><%= rs.getString(6) %></td>
						<td><%= rs.getString(7) %></td>
					</tr>
					<% } %>
					<% con.close(); %>
				</tbody>
			</table>
		</div>
	</form>

</body>
</html>
