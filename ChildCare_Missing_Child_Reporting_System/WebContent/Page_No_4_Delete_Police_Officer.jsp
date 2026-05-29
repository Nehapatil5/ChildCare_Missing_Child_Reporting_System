<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="Project_ChildCare_Missing_Child_Reporting_System.*" %>
<%@ page import ="java.sql.*"%>
<%
    Connection con = null;
    int i = 0;
    try {
        con = DbConnection.connect();
        int p_id = Integer.parseInt(request.getParameter("p_id"));
        PreparedStatement pstmt = con.prepareStatement("DELETE FROM police WHERE p_id=?");
        pstmt.setInt(1, p_id);
        i = pstmt.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Delete Police Officer</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/app.css" rel="stylesheet">
</head>
<body>
<div class="wrapper">
    <!-- Sidebar -->
    <nav id="sidebar" class="sidebar js-sidebar">
        <div class="sidebar-content js-simplebar">
            <a class="sidebar-brand" href="Page_No_2_Admin_Dashboard.html">
                <span class="align-middle">Admin Dashboard</span>
            </a>
            <ul class="sidebar-nav">
                <li class="sidebar-header">Admin</li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="Page_No_2_Add_Police_Officers.html">
                        <i class="align-middle" data-feather="user-plus"></i>
                        <span class="align-middle">Add Police Officer</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="Page_No_3_View_Police_Officers.jsp">
                        <i class="align-middle" data-feather="users"></i>
                        <span class="align-middle">View Police Officers</span>
                    </a>
                </li>
                <li class="sidebar-item active">
                    <a class="sidebar-link" href="#">
                        <i class="align-middle" data-feather="user-x"></i>
                        <span class="align-middle">Delete Police Officer</span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Main -->
    <div class="main">
        <main class="content">
            <div class="container-fluid p-0">
                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6">
                        <div class="card mt-5">
                            <div class="card-body text-center">
                                <h3 class="card-title mb-4">Delete Police Officer</h3>
                                <% if (i > 0) { %>
                                    <div class="alert alert-success">
                                        Police Officer deleted successfully.
                                    </div>
                                    <a href="Page_No_3_View_Police_Officers.jsp" class="btn btn-primary mt-3">Back to List</a>
                                <% } else { %>
                                    <div class="alert alert-danger">
                                        Failed to delete officer. Please try again.
                                    </div>
                                    <a href="Page_No_3_View_Police_Officers.jsp" class="btn btn-secondary mt-3">Back</a>
                                <% } %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <footer class="footer">
            <div class="container-fluid">
                <div class="row text-muted">
                    <div class="col-6 text-start">
                        <p class="mb-0">
                            <a class="text-muted" href="https://adminkit.io/" target="_blank"><strong>AdminKit</strong></a> &copy;
                        </p>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>

<script src="js/app.js"></script>
</body>
</html>
