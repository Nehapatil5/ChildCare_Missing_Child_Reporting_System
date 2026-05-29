package Project_ChildCare_Missing_Child_Reporting_System;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Page_No_2_Add_Police_Officers
 */
public class Page_No_2_Add_Police_Officers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Page_No_2_Add_Police_Officers() {
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
		try {Connection con = DbConnection.connect();
		int p_id=0;
		String name = request.getParameter("name");
		String station = request.getParameter("station");
		String contact = request.getParameter("contact");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
			PreparedStatement pstmt = con.prepareStatement("insert into police values(?,?,?,?,?,?)");
			pstmt.setInt(1, p_id);
			pstmt.setString(2, name);
			pstmt.setString(3, station);
			pstmt.setString(4, contact);
			pstmt.setString(5, email);
			pstmt.setString(6, password);
			int i = pstmt.executeUpdate();
			if(i>0){
				response.sendRedirect("Page_No_2_Admin_Dashboard.html");
			}
			else{
				response.sendRedirect("error1.html");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
