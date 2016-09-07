package com.sjsu.cloud.proj;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import java.sql.PreparedStatement;



/**
 * Servlet implementation class AppProvider
 */
@WebServlet("/AppProviderServlet")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class AppProviderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AppProviderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("****inside doPost..Yay");
		uploadApp(request,response);
	}
	
	public void uploadApp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String app_id = request.getParameter("appid");
		String app_name = request.getParameter("appname");
		String app_platform = request.getParameter("platform");
		String app_language = request.getParameter("language");
		String app_deadline = request.getParameter("deadline");
		String app_provider_id= request.getParameter("username");
		
		System.out.println(app_id);
		System.out.println(app_name);
		System.out.println(app_platform);
		System.out.println(app_language);
		System.out.println(app_deadline);
		System.out.println(app_provider_id);
		
		HttpSession session = request.getSession();
		
		InputStream inputStream = null; 
        
        Part filePart = request.getPart("appfile");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
		
		if ((app_id != null && !app_id.trim().isEmpty()) || (app_name != null && !app_name.trim().isEmpty())
				|| (app_platform != null && !app_platform.trim().isEmpty())
				|| (app_language != null && !app_language.trim().isEmpty())
				|| (app_deadline != null && !app_deadline.trim().isEmpty())
				|| (app_provider_id!=null && !app_provider_id.trim().isEmpty()))

		{
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
						"insert into apps(app_id,app_name,app_platform,app_language,app_deadline,app_provider_id,app_file) VALUES (?, ?, ?, ?, ?, ?, ?)");

				pst.setString(1, app_id);
				pst.setString(2, app_name);
				pst.setString(3, app_platform);
				pst.setString(4, app_language);
				pst.setString(5, app_deadline);
				pst.setString(6, app_provider_id);
				
				if (inputStream != null) {
	                // fetches input stream of the upload file for the blob column
	                pst.setBlob(7, inputStream);
	            }
	 
				
				int i = pst.executeUpdate();
				pst.clearParameters();

				if (i > 0) {
					session.setAttribute("Message", "App uploaded Successfully  !!!");
					response.sendRedirect("uploadapp.jsp");
					
				} else {
					session.setAttribute("Message", "Error while uploading, Please try again later !!!");
					response.sendRedirect("uploadapp.jsp");
				}

			} catch (Exception e) {
				System.out.println("Error!!!" + e);
				e.printStackTrace();
			}
		} else {
			session.setAttribute("Message", "Error while uploading, Please try again later !!!");
			response.sendRedirect("uploadapp.jsp");
		}
	}
}