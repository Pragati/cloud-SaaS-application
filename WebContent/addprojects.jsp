<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Create project</title>
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
    
    <div class="container theme-showcase" >

     <div class="page-header">
      <br>
       <h1>Create Project</h1>
      </div>
    <form method="POST" action="AdminServlet" name="addprojects" class="form-horizontal">
    <fieldset>
      <div class="control-group">
          <label class="control-label" for="focusedInput">App ID</label>
          <div class="controls">
            <input class="input-xlarge focused" id="focusedInput" type="text" name="appid" required=""
          value="">
          </div>
        </div>
        
        <div class="control-group">
          <label class="control-label" for="focusedInput">App Name</label>
          <div class="controls">
            <input class="input-xlarge focused" id="focusedInput" type="text" name="appname" required=""
          value="">
          </div>
        </div>
        
    	  <div class="control-group">
            <label class="control-label" for="focusedInput">Project ID</label>
            <div class="controls">
              <input class="input-xlarge focused" id="focusedInput" type="text" name="projectid" required=""
            value="">
            </div>
          </div>
            <div class="control-group">
            <label class="control-label" for="focusedInput">Project Name </label>
            <div class="controls">
              <input class="input-xlarge focused" id="focusedInput" type="text" name="projectname" required=""
            value="">
            </div>
          </div>

           <div class="control-group">
            <label class="control-label" for="focusedInput">Project Start Date</label>
            <div class="controls">
              <input class="input-xlarge focused" id="focusedInput" type="date" name="project_start_date" required=""
            value="">
            </div>
          </div>
          <div class="control-group">
           <label class="control-label" for="focusedInput">Project End Date</label>
           <div class="controls">
             <input class="input-xlarge focused" id="focusedInput" type="date" name="project_end_date" required=""
           value="">
           </div>
          </div>

        <br>
        <br>
            <div class="form-actions">
            <button type="submit" name="addprojects" class="btn btn-success">Submit</button>
          </div>
       </fieldset>

    </form>
    </div>
</body>
</html>
