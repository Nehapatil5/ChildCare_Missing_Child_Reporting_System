package Project_ChildCare_Missing_Child_Reporting_System;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Page_No_4_Police_Change_Password
 */
public class Page_No_4_Police_Change_Password extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Page_No_4_Police_Change_Password() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		try{
			Connection con = DbConnection.connect();
			String email = request.getParameter("email");
			String password = request.getParameter("newpassword");
			String password1 = request.getParameter("confirmpassword");
			if(password.equals(password1)){
			PreparedStatement pstmt = con.prepareStatement("update police set password=? where email=? ");
			pstmt.setString(1, password);
			pstmt.setString(2, email);
			int i = pstmt.executeUpdate();
			if(i>0){
			  response.sendRedirect("Page_No_7_Police_Login.html");
			}}else{
				response.sendRedirect("error2.html");
				}}catch(Exception e){
			
	    	 e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
	     }
			
		}
	}


