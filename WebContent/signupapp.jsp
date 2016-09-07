<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>App-provider sign up</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body style="
    height: 100%;
    width: 100%;
    font-size:18px;
    margin-top:40px;
    background-color:Beige;
    background-repeat: no-repeat;">
<img src="http://www.feathersoft.com/assets/images/level4/app_testing.png" class="img-rounded">
<h1 style="color:#cc6600 ;margin-top: -381px;text-align: center; font-size:50px; font-family:berlinsansfbdemi;">Sign Up</h1>
<br />
<form name="Registration" id="Register" method="post" action="regvalidate.jsp">
<div>
<table align="center" style="width:402px">
<tbody>

	<tr>
	<td> <input type="hidden" name="usertype" value="app-provider">
	</tr>
	
	<tr>
	<td>First Name:<sup>*</sup></td><td><input type="text" name="fname" required=""></td>
	</tr>
	
	<tr>
	<td>Last Name:<sup>*</sup></td><td><input type="text" name="lname" required=""></td>
	</tr>
	
	<tr>
	<td>User name:<sup>*</sup></td><td><input type="text" name="username" required=""></td>
	</tr>
	
	<tr>
	<td>Password:<sup>*</sup></td><td><input type="password" name="password" required=""></td>
	</tr>
	
	<tr>
	<td>Email ID:<sup>*</sup></td><td><input type="text" name="email" required=""></td>
	</tr>

	<tr>
	<td>Phone number:<sup>*</sup></td><td><input type="text" name="phone" required=""></td>
	</tr>
	
	<tr>
	<td>Address:</td><td><textarea rows="4" cols="30" name="address" required="" placeholder="Max. 40 characters(optional)"></textarea></td>
	</tr>
	
	<tr>
	<td>Card Number:<sup>*</sup></td><td><input type="text" name="cardnumber" required=""></td>
	</tr>
	
	<tr>
	<td>Expiration date:<sup>*</sup></td><td><input type="date" name="expirydate" required=""></td>
	</tr>
	
	<tr>
	<td>CVV:<sup>*</sup></td><td><input type="password" name="cvv" required=""></td>
	</tr>
</tbody>
</table>	
</div>

<div align="center" style="margin-top:10px">
			<input type="checkbox" required>
			I accept the <a target="_blank" href="terms.pdf">Terms and Conditions</a>
			</div>
</br>

<div align="center" style='color:red' >
<%
HttpSession userSession= request.getSession();
if(userSession.getAttribute("message")!=null)
{
    out.println(userSession.getAttribute("message"));
    userSession.removeAttribute("message");
}
%>
</div>		

<div>	
	<table align="center">
	<tbody>
	<tr>
	<td><button type="submit" class="btn btn-success btn-sm" onClick="regvalidate.jsp">Register</button> </td>
	</tr>
	</tbody>
	</table>
	<br>
	<center><a href="welcome.jsp">Login Here</a></center>
</div>
</div>
</form>
</body>
</html>