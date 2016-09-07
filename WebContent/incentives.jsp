<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession"%>
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
	
	int total=0;
	
	//String tester_id= (String)session.getAttribute("user");

	Connection con=null;
    ResultSet rs=null;
    PreparedStatement ps=null;

    String query="select bug_id, bug_criticality, reported_date, incentives from incentives where tester_id= '"+request.getSession().getAttribute("user") +"'";
	
	Class.forName(driver).newInstance();
	
    con = DriverManager.getConnection(dburl,dbusername,dbpassword);
    ps=con.prepareStatement(query);
	
	rs=ps.executeQuery();
%> 

<div class="container theme-showcase" >
    <div class="page-header">
    <br>
<h1>Incentives</h1>
    </div>

  <table class="table">
      <thead>
          <tr>          	 
              <th>Bug ID </th>
              <th>Bug Criticality </th>
              <th>Reported Date </th>
              <th>Incentive </th>
          </tr>   
                  	
      </thead>
      <tbody>
      <% while (rs.next()) {%>
      	<tr>
               <td> <%= rs.getString(1) %> </td>
               <td> <%= rs.getString(2) %> </td>
               <td> <%= rs.getDate(3) %> </td>
               <td> <%= rs.getInt(4) %> </td>
           </tr>
         <% total = total + rs.getInt(4);
        
         } %>
         <% System.out.println(total); %>
         <br>
         <br>
         

         
         <% con.close(); %>
      </tbody>
  </div>  
  
	 <table align="center" style="color:red; font-size:18px; margin-top:30px">
	 <td> Earned Incentives: $<%=total %> </td>
	 </table>
	 
</body>
</html>