package Project_ChildCare_Missing_Child_Reporting_System;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Page_No_9_Update_Investigation_Status1
 */
public class Page_No_9_Update_Investigation_Status1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Page_No_9_Update_Investigation_Status1() {
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
         try {
        	 
   	        int id= Integer.parseInt(request.getParameter("id"));
   	     String Status = request.getParameter("Status");
       Connection con = DbConnection.connect();
       PreparedStatement pstmt = con.prepareStatement("UPDATE child_report SET Status = ? WHERE id = ?");
       pstmt.setString(1, Status);
       pstmt.setInt(2, id);
       int result = pstmt.executeUpdate();

       if(result > 0) {
           response.sendRedirect("Page_No_10_Police_Dashboard.html");
       } else {
    	   response.sendRedirect("error1.html");
       }
   } catch(Exception e) {
	   response.sendRedirect("Error: " + e.getMessage());
   }
} 

}
