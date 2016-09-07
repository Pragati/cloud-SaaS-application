<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Projects Info</title>
      <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
      <link href="starter-template.css" rel="stylesheet">
</head>
<body style="background-color:Beige">
 <div class="navbar navbar-inverse navbar-fixed-top" style="background-color:FireBrick">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="admin.jsp">Test Manager</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">

            <li><a href="addprojects.jsp">Create Project</a></li>
            <li><a href="ranktesters.jsp">Rank Testers</a></li>
            <li><a href="projects.jsp">Projects Status</a></li> 
          </ul>
       
        <div class="navbar-form navbar-right">
         <form action="logout.jsp">
         <p style="color:white;"><span class="glyphicon glyphicon-user"></span> Welcome
            <button  class="btn btn-info"><span class="glyphicon glyphicon-log-out"></span> Logout</button> 
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

    String query="select  projects.project_id, projects.project_name,apps.app_id,apps.app_name,projects.start_date, projects.end_date, bugs.tester_id, bugs.bug_id, bugs.bug_desc, bugs.bug_criticality, bugs.bug_status from projects, apps , bugs where projects.app_id=apps.app_id and bugs.app_id=apps.app_id and bugs.project_id=projects.project_id";
	
	Class.forName(driver).newInstance();
	
    con = DriverManager.getConnection(dburl,dbusername,dbpassword);
    ps=con.prepareStatement(query);
	
	rs=ps.executeQuery();

	
%> 
<form method="POST" name="projects.jsp" class="form-horizontal">
<div class="container theme-showcase" >
    <div class="page-header">
    <br>
     <h1>Project Status</h1>
    </div>
  <table class="table">
      <thead>
          <tr>
              <th>Project ID</th>
              <th>Project Name</th>
              <th>App ID</th>
              <th>App Name</th>
              <th>Project Start Date</th>
              <th>Project End Date</th>
              <th>Tester ID </th>
              <th>Bug ID </th>
              <th>Bug Desc </th>
              <th>Bug Criticality </th>
              <th>Bug Status </th>
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
               <td> <%= rs.getString(7) %></td>
               <td> <%= rs.getString(8) %></td>
               <td> <%= rs.getString(9) %></td>
               <td> <%= rs.getString(10) %></td>
               <td> <%= rs.getString(11) %></td>
           </tr>
         <% } %>
         <% con.close(); %>
      </tbody>
  </table>
  </div>  
</form>    
     
</body>
</html>	