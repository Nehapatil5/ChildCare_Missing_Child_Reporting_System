<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="Project_ChildCare_Missing_Child_Reporting_System.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%
try {
    Connection con = DbConnection.connect();

    String idStr = request.getParameter("id");
    String status = request.getParameter("Status");

    if(idStr != null && status != null && !idStr.trim().isEmpty() && !status.trim().isEmpty()) {
        int id = Integer.parseInt(idStr);

        String newStatus = status.equals("Not Found") ? "Found" : "Not Found";

        PreparedStatement pstmt = con.prepareStatement("UPDATE child_report SET Status = ? WHERE id = ?");
        pstmt.setString(1, newStatus);
        pstmt.setInt(2, id);

        int result = pstmt.executeUpdate();

        if(result > 0) {
            response.sendRedirect("Page_No_8_View_Child_Reports_Police.jsp");
        } else {
            out.println("Update failed for id: " + id);
        }
    } else {
        out.println("Invalid ID or Status parameter.");
    }
} catch(Exception e) {
    out.println("Error: " + e.getMessage());
    e.printStackTrace();
	response.getWriter().println("Error: " + e.getMessage());
}

%>

</body>
</html>
 %>

</body>
</html>