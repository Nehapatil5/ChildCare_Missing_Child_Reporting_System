package Project_ChildCare_Missing_Child_Reporting_System;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class Page_No_1_Admin_Login1
 */
public class Page_No_1_Admin_Login1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Page_No_1_Admin_Login1() {
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
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			if(email.equals("admin@gmail.com") && password.equals("12345")){
			    response.sendRedirect("Page_No_2_Admin_Dashboard.html");
				
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


