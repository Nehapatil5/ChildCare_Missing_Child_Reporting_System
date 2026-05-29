<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import ="Project_ChildCare_Missing_Child_Reporting_System.*" %>
<%@ page import ="java.sql.*"%>
<%
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>View Report Status</title>

  <!-- AdminKit CSS -->
  <link href="css/app.css" rel="stylesheet">
</head>
<body>
<div class="wrapper">
  <!-- Sidebar -->
  <nav id="sidebar" class="sidebar js-sidebar">
  <div class="mt-3">
          <a href="Page_No_17_Citizen_Dashboard.html" class="btn btn-secondary">Back</a>
        </div>
    <div class="sidebar-content js-simplebar">
      <a class="sidebar-brand" href="Page_No_17_Citizen_Dashboard.html">
        <span class="align-middle">Citizen Dashboard</span>
      </a>
      <ul class="sidebar-nav">
        <li class="sidebar-header">Citizen</li>
        <li class="sidebar-item">
          <a class="sidebar-link" href="Page_No_14_Report_Missing_Child.html">
            <i class="align-middle" data-feather="alert-circle"></i>
            <span class="align-middle">Report Missing Child</span>
          </a>
        </li>
        <li class="sidebar-item active">
          <a class="sidebar-link" href="#">
            <i class="align-middle" data-feather="eye"></i>
            <span class="align-middle">View Status</span>
          </a>
        </li>
        <li class="sidebar-item">
          <a class="sidebar-link" href="Page_No_16_Citizen_Change_Password.html">
            <i class="align-middle" data-feather="lock"></i>
            <span class="align-middle">Change Password</span>
          </a>
        </li>
      </ul>
    </div>
  </nav>

  <!-- Main -->
  <div class="main">
    <main class="content">
      <div class="container-fluid p-0">
        <h1 class="h3 mb-3">Reported Missing Child Status</h1>

        <div class="card">
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-striped table-hover">
                <thead class="table-dark">
                  <tr>
                    <th>ID</th>
                    <th>Citizen ID</th>
                    <th>Child Name</th>
                    <th>Age</th>
                    <th>Last Seen Location</th>
                    <th>Image Path</th>
                    <th>Report Date</th>
                    <th>Status</th>
                    <th>Description</th>
                  </tr>
                </thead>
                <tbody>
                  <%
                    try {
                      con = DbConnection.connect();
                      pstmt = con.prepareStatement("SELECT * FROM child_report");
                      rs = pstmt.executeQuery();
                      while (rs.next()) {
                  %>
                  <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getInt("citizen_Id") %></td>
                    <td><%= rs.getString("child_Name") %></td>
                    <td><%= rs.getInt("age") %></td>
                    <td><%= rs.getString("lastSeen_Location") %></td>
                    <td><%= rs.getString("image_Path") %></td>
                    <td><%= rs.getString("report_Date") %></td>
                    <td><%= rs.getString("status") %></td>
                    <td><%= rs.getString("description") %></td>
                  </tr>
                  <% 
                      }
                    } catch(Exception e) {
                        out.println("<tr><td colspan='9'>Error: " + e.getMessage() + "</td></tr>");
                    } finally {
                      try { if (rs != null) rs.close(); } catch(Exception e) {}
                      try { if (pstmt != null) pstmt.close(); } catch(Exception e) {}
                      try { if (con != null) con.close(); } catch(Exception e) {}
                    }
                  %>
                </tbody>
              </table>
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
              <a class="text-muted" href="#"><strong>ChildCare System</strong></a> &copy;
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
