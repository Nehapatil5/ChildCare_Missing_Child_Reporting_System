package Project_ChildCare_Missing_Child_Reporting_System;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

@MultipartConfig

public class Page_No_7_Report_Missing_Child extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Page_No_7_Report_Missing_Child() {
        super();
    }
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            try {
                Connection con = DbConnection.connect();
                int id = 0; 
                int c_id = GetterSetter.getC_id(); 
                String child_Name = request.getParameter("child_Name");
                int age = Integer.parseInt(request.getParameter("age"));
                String lastSeen_Location = request.getParameter("lastSeen_Location");
                String report_Date = request.getParameter("report_Date");
                String description = request.getParameter("description");

                Part filePart = request.getPart("image_Path");
                String fileName = getFileName(filePart);
                String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdir();
                filePart.write(uploadPath + File.separator + fileName);
                String image_Path = fileName; 

                String sql = "INSERT INTO child_report VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, id);
                pstmt.setInt(2, c_id);
                pstmt.setString(3, child_Name);
                pstmt.setInt(4, age);
                pstmt.setString(5, lastSeen_Location);
                pstmt.setString(6, image_Path);
                pstmt.setString(7, report_Date);
                pstmt.setString(8, "Not Found");
                pstmt.setString(9, description);

                int i = pstmt.executeUpdate();
                if (i > 0) {
                    response.sendRedirect("Page_No_17_Citizen_Dashboard.html");
                } else {
                    response.sendRedirect("error.html");
                }

            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().println("<pre>" + e.getMessage() + "</pre>");
            }
        }
        private String getFileName(Part part) {
            String contentDisp = part.getHeader("content-disposition");
            for (String s : contentDisp.split(";")) {
                if (s.trim().startsWith("filename")) {
                    return s.substring(s.indexOf("=") + 2, s.length() - 1).replaceAll("[^a-zA-Z0-9\\.\\-_]", "_");
                }
            }
            return "unknown";
        }
    }

   

