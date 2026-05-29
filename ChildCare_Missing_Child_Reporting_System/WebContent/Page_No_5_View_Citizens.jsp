<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import ="Project_ChildCare_Missing_Child_Reporting_System.*" %>
<%@ page import ="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>View Citizens</title>

  <!-- AdminKit CSS -->
  <link href="css/app.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>
<div class="wrapper">
  <!-- Sidebar -->
  <nav id="sidebar" class="sidebar js-sidebar">
    <div class="d-flex justify-content-start mb-3">
   <a href="Page_No_2_Admin_Dashboard.html" class="btn btn-secondary">Back</a>
    </div>
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
            <i class="align-middle" data-feather="user"></i>
            <span class="align-middle">View Citizens</span>
          </a>
        </li>
      </ul>
    </div>
  </nav>

  <!-- Main -->
  <div class="main">
    <main class="content">
      <div class="container-fluid p-0">
        <h1 class="h3 mb-3">Registered Citizens</h1>

        <div class="card">
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-striped table-hover">
                <thead class="table-dark">
                  <tr>
                    <th>Citizen ID</th>
                    <th>Name</th>
                    <th>Contact</th>
                    <th>Address</th>
                    <th>Email</th>
                  </tr>
                </thead>
                <tbody>
                  <%
                    Connection con = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;
                    try {
                      con = DbConnection.connect();
                      pstmt = con.prepareStatement("SELECT * FROM citizen");
                      rs = pstmt.executeQuery();
                      while (rs.next()) {
                  %>
                  <tr>
                    <td><%= rs.getInt("c_id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("contact") %></td>
                    <td><%= rs.getString("address") %></td>
                    <td><%= rs.getString("email") %></td>
                  </tr>
                  <%
                      }
                    } catch (Exception e) {
                      out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
                    } finally {
                      try { if (rs != null) rs.close(); } catch (Exception e) {}
                      try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
                      try { if (con != null) con.close(); } catch (Exception e) {}
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
              <a class="text-muted" href="#"><strong>Admini Dashboard</strong></a> &copy;
            </p>
          </div>
        </div>
      </div>
    </footer>
  </div>
</div>

<!-- AdminKit JS -->
<script src="js/app.js"></script>
</body>
</html>
