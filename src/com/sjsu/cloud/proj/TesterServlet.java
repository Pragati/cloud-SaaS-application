package com.sjsu.cloud.proj;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Blob;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class TesterServlet
 */
@WebServlet("/TesterServlet")
public class TesterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TesterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("****inside Tester Servlet doGet....Yay");
		downloadApp(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("****inside Tester Servlet doPost....Yay");
		reportBugs(request,response);
	}
	
	public void reportBugs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String tester_id = request.getParameter("username");
		String bug_id = request.getParameter("bugid");
		String app_id = request.getParameter("appid");
		String app_name = request.getParameter("appname");
		String project_id = request.getParameter("projectid");
		String bug_criticality = request.getParameter("bug_criticality");
		String bug_status= request.getParameter("bug_status");
		String bug_desc= request.getParameter("bug_desc");
		String reported_date=request.getParameter("reported_date");

		System.out.println(tester_id);
		System.out.println(bug_id);
		System.out.println(app_id);
		System.out.println(app_name);
		System.out.println(project_id);
		System.out.println(bug_criticality);
		System.out.println(bug_status);
		System.out.println(bug_desc);
		System.out.println(reported_date);
		
		HttpSession session = request.getSession();
		
		String driver = "com.mysql.jdbc.Driver";
		String dburl="jdbc:mysql://testdbinstance.cy7eqis8fosr.us-west-2.rds.amazonaws.com:3306/testdb";
		//String dburl = "jdbc:mysql://localhost/test_db";
		String dbusername = "root";
		String dbpassword = "mysql123";

			try {
				Connection con = null;
				Class.forName(driver).newInstance();
				con = DriverManager.getConnection(dburl, dbusername, dbpassword);

				PreparedStatement pst = null;

				pst = con.prepareStatement(
						"insert into bugs(tester_id,bug_id,app_id,app_name,project_id,bug_criticality,bug_status,bug_desc,reported_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

				pst.setString(1, tester_id);
				pst.setString(2, bug_id);
				pst.setString(3, app_id);
				pst.setString(4, app_name);
				pst.setString(5, project_id);
				pst.setString(6, bug_criticality);
				pst.setString(7, bug_status);
				pst.setString(8, bug_desc);
				pst.setString(9, reported_date);

				int i = pst.executeUpdate();
				pst.clearParameters();

				if (i > 0) {
					session.setAttribute("Message", "Bug updated Successfully  !!!");
					response.sendRedirect("reportbugs.jsp");
					
				} else {
					session.setAttribute("Message", "Error while updating bug !!!");
					response.sendRedirect("reportbugs.jsp");
					
				}

			} catch (Exception e) {
				System.out.println("Error!!!" + e);
				e.printStackTrace();
			}
	}


	public void downloadApp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		HttpSession session = request.getSession();
		String projectID = request.getParameter("projectID");
		System.out.println(projectID);

		String driver = "com.mysql.jdbc.Driver";
		String dburl="jdbc:mysql://testdbinstance.cy7eqis8fosr.us-west-2.rds.amazonaws.com:3306/testdb";
		//String dburl = "jdbc:mysql://localhost/test_db";
		String dbusername = "root";
		String dbpassword = "mysql123";
		
		
		Connection con = null;	
		
		try{
				Class.forName(driver).newInstance();
				con = DriverManager.getConnection(dburl, dbusername, dbpassword);

				String query="select a.app_name, a.app_file from apps a, projects p where a.app_id=p.app_id and a.app_name=p.app_name and p.project_id= '" +projectID + "'";
				PreparedStatement ps = con.prepareStatement(query);
				
				System.out.println("----2");
				//ps.setString(1, projectID);
				System.out.println("----3");
				ResultSet rs= ps.executeQuery();
				System.out.println("----4");
				System.out.println(rs);
		
        if (rs.next()) {
            // gets file name and file blob data
     
        	String appName = rs.getString("app_name");
        	Blob blob = rs.getBlob("app_file");
            InputStream inputStream = blob.getBinaryStream();
            int fileLength = inputStream.available();
            System.out.println("fileLength = " + fileLength);
            
            ServletContext context = getServletContext();

            // sets MIME type for the file download
            String mimeType = context.getMimeType("app_name");
            if (mimeType == null) {        
                mimeType = "application/octet-stream/vnd.android.package-archive";
            }              
             
            // set content properties and header attributes for the response
            response.setContentType(mimeType);
            response.setContentLength(fileLength);
            String headerKey = "Content-Disposition";
            String headerValue = String.format("attachment; filename=\"%s\"", "app_file");
            response.setHeader(headerKey, headerValue);

            System.out.println("-----");
            // writes the file to the client
            OutputStream outStream = response.getOutputStream();
             
            byte[] buffer = new byte[4096];
            int bytesRead = -1;
             
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outStream.write(buffer, 0, bytesRead);
            }
             
            inputStream.close();
            outStream.close();
            
        } else {
            // no file found
            response.getWriter().print("File not found for the id: " + "5");  
        }
        
        
	} catch (Exception ex) {
        ex.printStackTrace();
        response.getWriter().print("Error" + ex.getMessage());
    } finally {
        if (con != null) {
            // closes the database connection
            try {
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }   
     // sets the message in request scope
        
    }    
		session.setAttribute("Message", "Successfully downloaded!!");
        response.sendRedirect(request.getContextPath() + "/viewprojects.jsp");

         
     //   getServletContext().getRequestDispatcher("/viewprojects.jsp").forward(request, response);
    }
	}
	
