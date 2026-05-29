package Project_ChildCare_Missing_Child_Reporting_System;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Page_No_5_Register_Citizens
 */
public class Page_No_5_Register_Citizens extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Page_No_5_Register_Citizens() {
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
		doGet(request, response);
		try{
			Connection con = DbConnection.connect();
			int c_id = 0;
			String name = request.getParameter("name");
			String contact =request.getParameter("contact");
			String address = request.getParameter("address");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			PreparedStatement pstmt = con.prepareStatement("insert into citizen values(?,?,?,?,?,?)");
			pstmt.setInt(1, c_id);
			pstmt.setString(2, name);
			pstmt.setString(3, contact);
			pstmt.setString(4, address);
			pstmt.setString(5, email);
			pstmt.setString(6, password);
			int i = pstmt.executeUpdate();
			if(i>0){
			 
			  response.sendRedirect("Page_No_13_Citizen_Login.html");
			}else{
				response.sendRedirect("error2.html");
				}}catch(Exception e){
			
	    	 e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
	     }
			
		}

}
