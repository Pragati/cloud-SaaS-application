package com.sjsu.cloud.proj;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import javax.sql.*;
import java.util.*;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("uname");
		String password = request.getParameter("pwd");

		String driver = "com.mysql.jdbc.Driver";
		String dburl="jdbc:mysql://testdbinstance.cy7eqis8fosr.us-west-2.rds.amazonaws.com:3306/testdb";
		//String dburl = "jdbc:mysql://localhost/test_db";
		String dbusername = "root";
		String dbpassword = "mysql123";

		HttpSession session = request.getSession();

		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		String query = "select * from users where username=? and password=?";
		try {

			Class.forName(driver).newInstance();

			con = DriverManager.getConnection(dburl, dbusername, dbpassword);
			ps = con.prepareStatement(query);

			ps.setString(1, username);
			ps.setString(2, password);
			// ps.setString(3,user_type);
			rs = ps.executeQuery();

			int count = 0;
			// db user & pwd

			String user_name = new String("");
			String pwd = new String("");
			String usertype = new String("");
			if ((username != null && !username.trim().isEmpty()) && (password != null && !password.trim().isEmpty()))
			// ||(user_type!=null && !user_type.trim().isEmpty()))
			{
				if (rs.next()) {
					count++;
					user_name = rs.getString("username");
					pwd = rs.getString("password");
					usertype = rs.getString("user_type");
				
				if (count > 0) {

					try {
						if (password.equals(pwd)) {

							session.setAttribute("user", username);
							session.setAttribute("password", password);
							
							System.out.println("usertype from db----- - " + usertype);
									
							if (usertype.equals("app-provider")) {
								
								System.out.println(usertype);
								RequestDispatcher dispatcher = request.getRequestDispatcher("app-provider.jsp");
								dispatcher.forward(request, response);
								//response.sendRedirect(request.getContextPath() + "/app-provider.jsp");
							} else if (usertype.equals("tester")) {
								
								System.out.println(usertype);
								RequestDispatcher dispatcher = request.getRequestDispatcher("tester.jsp");
								dispatcher.forward(request, response);
								//response.sendRedirect(request.getContextPath() + "/tester.jsp");
							} else {
								
								System.out.println(usertype);
								RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
								dispatcher.forward(request, response);
								//response.sendRedirect(request.getContextPath() + "/admin.jsp");
							}
						}
					}

					catch (Exception e) {
						System.out.println(e.getMessage());
					}
				}
			}
			}
			else {
				//session.invalidate();
				session.setAttribute("errorMessage", "Invalid user or password !!!");
				//request.setAttribute("errorMessage", "Invalid user or password!!!");
				//RequestDispatcher dispatcher = request.getRequestDispatcher("/welcome.jsp");
				//dispatcher.forward(request, response);
				response.sendRedirect(request.getContextPath() + "/welcome.jsp");

			}
		}
				
		 catch (Exception e) {
			System.out.println("Unable to make connection with DB" + e);
			e.printStackTrace();

		}
	}

}
