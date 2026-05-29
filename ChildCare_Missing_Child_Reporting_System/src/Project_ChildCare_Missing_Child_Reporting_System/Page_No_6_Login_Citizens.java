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
 * Servlet implementation class Page_No_6_Login_Citizens
 */
public class Page_No_6_Login_Citizens extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Page_No_6_Login_Citizens() {
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
		try{
			Connection con = DbConnection.connect();
			int c_id =0;
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			PreparedStatement pstmt = con.prepareStatement("select * from citizen where email=? and password=?");
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				 GetterSetter.setC_id(rs.getInt(1));
			  response.sendRedirect("Page_No_17_Citizen_Dashboard.html");
			}
			else{
				response.sendRedirect("error.html");
			}
			}catch(Exception e){
	    	 e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
	     }
			
		}
	}


