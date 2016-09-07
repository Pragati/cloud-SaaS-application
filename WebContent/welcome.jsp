<html>
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to our APP</title>
</head>
<body style="
    height: 100%;
    width: 100%;
    font-size:20px;
    margin-top:50px;
    background-color:Beige;
    background-repeat: no-repeat;">
<img src="http://www.feathersoft.com/assets/images/level4/app_testing.png" class="img-rounded">
<h1 style="color:#cc6600 ;margin-top: -381px;text-align: center; font-size:50px; font-family:berlinsansfbdemi;"> APP TEST </h1>

<form name="Login page" id="login" method="POST" action="LoginServlet">
<div class="container">
<div class="row" style="text-align: center">
<div class="col-md-4 col-md-offset-7">
<div class="panel" style="opacity:0.9; margin-top:80px;">
<div class="panel-body">

<div class="form-group">
<label for="username" class="col-sm-3 control-label"></label>
<div class="col-sm-9">
<table align="center">
<tr>
<td> Username <input type="text" class="form-control" id="username" name="uname" required="" style="height: 28px;"></td>
</tr>
</table>
</div>
</div>
<div class="form-group">
<label for="inputPassword3" class="col-sm-3 control-label"></label>
<div class="col-sm-9">
<table align="center">
<tr>
<td> Password  <input type="password" class="form-control" id="inputPassword3" name="pwd" required="" style="height: 28px;"></td>
</tr>
</table>
</div>
</div>

<div style='color:red' >
<b>
<%
HttpSession userSession= request.getSession();
if(userSession.getAttribute("errorMessage")!=null)
{
    out.println(userSession.getAttribute("errorMessage"));
    userSession.removeAttribute("errorMessage");
}
%>
</b>
</div>
<br />
<div class="col-sm-offset-3 col-sm-9">
 <button type="submit" class="btn btn-success btn-sm" id="submit">Sign In</button>
 </div> 
<br />
</div>
<div class="panel-footer">Not Registered?
<a href="signuptester.jsp" class="">Testers</a><br />
<a href="signupapp.jsp">App Providers</a>
</div>
</div>
</div>
</div>
</div>
</form>
</body>
</html>