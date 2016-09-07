	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="starter-template.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload your app</title>
</head>
<body style="background-color:Beige; font-size:12px" >
<div class="navbar navbar-inverse navbar-fixed-top" style="background-color:FireBrick">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
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
         <p style="color:white;"><span class="glyphicon glyphicon-user"></span> Welcome
         <button  class="btn btn-info" ><span class="glyphicon glyphicon-log-out"></span> Logout</button>
         </p>
         </form>
          </div>
        </div>
      </div>
    </div>
    
<form name="uploadApp" action="AppProviderServlet" method="POST"enctype="multipart/form-data"> 
<div class="container theme-showcase" >
      <div class="page-header">
      <br>
       <h1>Upload your app</h1>
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
            <label class="control-label" for="focusedInput">App ID</label>
            <div class="controls">
            <input class="input-xlarge focused" id="focusedInput" type="text" name="appid" required="">
            </div>
            </div> 
            <br />
   	
        	<div class="control-group">
            <label class="control-label" for="focusedInput">App Name</label>
            <div class="controls">
            <input class="input-xlarge focused" id="focusedInput" type="text" name="appname" required="">
            </div>
            </div> 
            <br />
            <div class="control-group success">
            <label class="control-label" for="select">App platform</label>
            <div class="controls">
            <select required id="select" name="platform" required="">
            <option value="android">Android</option>
            <option value="ios">IOS</option>   
            <option value="windows">Windows</option> 
            </select>  
            </div>
            </div>         
            <br />
       		<div class="control-group success">
            <label class="control-label" for="selectlang">App Language</label>
            <div class="controls">
            <select required id="select" name="language">
            <option value="C">C</option>
            <option value="C++">C++</option>   
            <option value="Java">Java</option> 
            <option value="JavaScript">JavaScript</option>
            <option value="Python">Python</option>
            </select>  
    		</div>
            </div>      
            <br />
            <div class="control-group">
            <label class="control-label" for="focusedInput">Deadline</label>
            <div class="controls">
            <input class="input-xlarge focused" id="focusedInput" type="date" name="deadline" required="" >
            </div>
            </div> 
            <br />
            <div>
            <div>
            <label>Choose File</label>
            <input type="file" name="appfile" size="100"/>
            </div>
            
    <div style='color:red' >
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
            </br>
            </br>
            
            <div class="form-actions">
            	<button type="submit" class="btn btn-success" id="submit_button">Upload</button>
            </div>  
            </form>
    </fieldset>
    </div>
</body>
</html>