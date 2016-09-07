<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="starter-template.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tester</title>
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
<div class="container theme-showcase">
      <div class="page-header">
      <br>
       <h3>Hello, <%= session.getAttribute("user") %></h3>
      </div>
</div>
</body>
</html>