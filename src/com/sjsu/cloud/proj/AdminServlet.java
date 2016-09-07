package com.sjsu.cloud.proj;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.PreparedStatement;



/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")

public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("****inside doGet..Yay");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("****inside doPost..Yay");
		if(request.getParameter("addprojects")!=null){
			addProject(request,response);
		}
		else if(request.getParameter("giveincentive")!=null){
			giveIncentive(request,response);
		}
	}
	
	
	public void addProject(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String app_id = request.getParameter("appid");
		String app_name = request.getParameter("appname");
		String project_id = request.getParameter("projectid");
		String project_name = request.getParameter("projectname");
		String start_date = request.getParameter("project_start_date");
		String end_date = request.getParameter("project_end_date");

		System.out.println(app_id);
		System.out.println(app_name);
		System.out.println(project_id);
		System.out.println(project_name);
		System.out.println(start_date);
		System.out.println(end_date);

		if ((app_id != null && !app_id.trim().isEmpty()) 
				|| (app_name!=null && !app_name.trim().isEmpty())
				|| (project_id != null && !project_id.trim().isEmpty())
				|| (project_name != null && !project_name.trim().isEmpty())
				|| (start_date != null && !start_date.trim().isEmpty())
				|| (end_date != null && !end_date.trim().isEmpty()))

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
						"insert into projects(app_id,app_name,project_id,project_name,start_date,end_date) VALUES (?, ?, ?, ?, ?, ?)");

				pst.setString(1, app_id);
				pst.setString(2, app_name);
				pst.setString(3, project_id);
				pst.setString(4, project_name);
				pst.setString(5, start_date);
				pst.setString(6, end_date);

				int i = pst.executeUpdate();
				pst.clearParameters();

				if (i > 0) {
					response.sendRedirect("addprojects.jsp");
				} else {
					response.sendRedirect("failed.html");
				}

			} catch (Exception e) {
				System.out.println("Error!!!" + e);
				e.printStackTrace();
			}
		} else {
			response.sendRedirect("regfailed.html");
			System.out.println("Enter all the required information");
		}
	}
	
	public void giveIncentive(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("****inside doPost..giveIncentive...Yay");
		
		HttpSession session=request.getSession();
		
		String bug_id = request.getParameter("giveincentive");
		System.out.println(bug_id);
		
		String driver = "com.mysql.jdbc.Driver";
		String dburl="jdbc:mysql://testdbinstance.cy7eqis8fosr.us-west-2.rds.amazonaws.com:3306/testdb";
		//String dburl = "jdbc:mysql://localhost/test_db";
		String dbusername = "root";
		String dbpassword = "mysql123";

		Connection con = null;
		ResultSet rs=null;
	    PreparedStatement ps=null;

		try {
			Class.forName(driver).newInstance();
			con = DriverManager.getConnection(dburl, dbusername, dbpassword);
			
			String query="select tester_id, bug_id, bug_criticality,reported_date from bugs where bug_id='"+ bug_id +"'";
			
			ps=con.prepareStatement(query);
			
			rs=ps.executeQuery();
			
			while(rs.next()){
			System.out.println(rs.getString(3));
			try{
			if(rs.getString(3).equals("Medium")){
				
				int incentive=10;
				ps = con.prepareStatement(
						"insert into incentives(tester_id,bug_id,bug_criticality,reported_date,incentives) VALUES (?, ?, ?, ?, ?)");

				ps.setString(1, rs.getString(1));
				ps.setString(2, rs.getString(2));
				ps.setString(3, rs.getString(3));
				ps.setDate(4, rs.getDate(4));
				ps.setInt(5, incentive);

			}
			
			else if(rs.getString(3).equals("Low")){
					
					int incentive=5;
					ps = con.prepareStatement(
							"insert into incentives(tester_id,bug_id,bug_criticality,reported_date,incentives) VALUES (?, ?, ?, ?, ?)");

					ps.setString(1, rs.getString(1));
					ps.setString(2, rs.getString(2));
					ps.setString(3, rs.getString(3));
					ps.setString(4, rs.getString(4));
					ps.setInt(5, incentive);

			}
			else if(rs.getString(3).equals("High")){
				
				int incentive=15;
				ps = con.prepareStatement(
						"insert into incentives(tester_id,bug_id,bug_criticality,reported_date,incentives) VALUES (?, ?, ?, ?, ?)");

				ps.setString(1, rs.getString(1));
				ps.setString(2, rs.getString(2));
				ps.setString(3, rs.getString(3));
				ps.setString(4, rs.getString(4));
				ps.setInt(5, incentive);

			}
			int i = ps.executeUpdate();
			ps.clearParameters();
			

			if (i > 0) {
				session.setAttribute("errorMessage", "Incentive given successfully!!!");
				response.sendRedirect(request.getContextPath() + "/ranktesters.jsp");
				
				//response.sendRedirect("ranktesters.jsp");
			} else {
				session.setAttribute("errorMessage", "Error occured while giving incentive !!!");
				response.sendRedirect(request.getContextPath() + "/ranktesters.jsp");
				//response.sendRedirect("failed.html");
			}
			}
			catch(SQLIntegrityConstraintViolationException e){
				session.setAttribute("errorMessage", "Incentive given already !!!");
				response.sendRedirect(request.getContextPath() + "/ranktesters.jsp");
			}

		}
		}
		catch (Exception e) {
			System.out.println("Error!!!" + e);
			e.printStackTrace();
				
			}
	
		}}
	