<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="starter-template.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Report bugs</title>
</head>
<body  style="background-color:Beige; font-size:12px">
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
    
<form method="POST" action="TesterServlet" name="reportbugs"> 
<div class="container theme-showcase" >
      <div class="page-header">
      <br>
       <h1>Report bugs</h1>
      </div>
   <fieldset>
        	<div class="control-group">
            <label class="control-label" for="focusedInput">Username</label>
            <div class="controls">
            <input class="input-xlarge focused" id="focusedInput" type="text" name="username" value=<%= session.getAttribute("user")%> readonly>
            </div>
            </div> 
            <br/>
            
            <div class="control-group">
            <label class="control-label" for="focusedInput">Bug ID</label>
            <div class="controls">
            <input class="input-xlarge focused" id="focusedInput" type="text" name="bugid" required="" value="">
            </div>
            </div> 
            <br />
        	
        	<div class="control-group">
            <label class="control-label" for="focusedInput">App ID</label>
            <div class="controls">
            <input class="input-xlarge focused" id="focusedInput" type="text" name="appid" required="" value="">
            </div>
            </div> 
            <br />
            <div class="control-group">
            <label class="control-label" for="focusedInput">App Name</label>
            <div class="controls">
            <input class="input-xlarge focused" id="focusedInput" type="text" name="appname" required="" value="">
            </div>
            </div> 
            <br />
            <div class="control-group">
            <label class="control-label" for="focusedInput">Project ID</label>
            <div class="controls">
            <input class="input-xlarge focused" id="focusedInput" type="text" name="projectid" required="" value="">
            </div>
            </div> 
            <br />
            <div class="control-group success">
            <label class="control-label"  for="selectError">Bug Criticality</label>
            <div class="controls">
            <select id="selectcriticality" name="bug_criticality" required="" value="">
            <option value="Low">Low</option>
            <option value="Medium">Medium</option>   
            <option value="High">High</option> 
            </select>  
            </div>
            </div>         
            <br />
       		<div class="control-group success">
            <label class="control-label" for="selectError">Bugs status</label>
            <div class="controls">
            <select id="selectstatus" name="bug_status" required="" value="">
            <option value="Open">Open</option>
            <option value="In-Progress">In-Progress</option>
            <option value="Closed">Closed</option>   
            <option value="Re-test">Re-test</option> 
            </select>  
      		</div>
            </div>
			<br /> 
            <div class="control-group">
            <label class="control-label" for="focusedInput">Bug Description</label>
            <div class="controls">
            <input class="input-xlarge focused" id="focusedInput" type="text" name="bug_desc" required="" value="">
            </div>
            </div> 
            <br />
            <div class="control-group">
            <label class="control-label"  for="focusedInput">Reported date</label>
            <div class="controls">
            <input class="input-xlarge focused" id="focusedInput" type="date" name="reported_date" value="">
            </div>
            </div> 
            <br />
            <br />

            
            <div class="form-actions">
            <button type="submit" class="btn btn-success" id="submit_button">Update</button>
            </div>  
            </form>
    </fieldset>
    </div>
    <br />
    
      <div style='color:red' align="center" >	
	<b>
	<%
	HttpSession userSession= request.getSession();
	if(userSession.getAttribute("Message")!=null)
		{
  		  out.println(userSession.getAttribute("Message"));
    	  userSession.removeAttribute("Message");
		}
	%>
	</b>
	</div>
</body>
</html>