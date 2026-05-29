<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import ="Project_ChildCare_Missing_Child_Reporting_System.*" %>
<%@ page import ="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>All Child Reports</title>

  <!-- AdminKit CSS -->
  <link href="css/app.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
  <style>
    .thumb {
      width: 100px;
      height: 70px;
      object-fit: contain;
      border-radius: 5px;
      cursor: pointer;
      border: 2px solid #007bff;
      background-color: #f0f8ff;
      padding: 5px;
    }

    .popup-overlay {
      display: none;
      position: fixed;
      top: 0; left: 0;
      width: 100%; height: 100%;
      background-color: rgba(0,0,0,0.8);
      justify-content: center;
      align-items: center;
      z-index: 9999;
    }

    .popup-content {
      position: relative;
      background-color: #fff;
      padding: 15px;
      border-radius: 10px;
      max-width: 80vw;
      max-height: 80vh;
      text-align: center;
    }

    .full-image {
      max-width: 100%;
      max-height: 70vh;
    }

    .close-btn {
      position: absolute;
      top: 10px; right: 10px;
      background: red;
      color: white;
      border: none;
      border-radius: 50%;
      width: 30px;
      height: 30px;
      font-size: 18px;
      cursor: pointer;
    }
  </style>
</head>
  
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
        <li class="sidebar-item active">
          <a class="sidebar-link" href="#">
            <i class="align-middle" data-feather="alert-triangle"></i>
            <span class="align-middle">View Child Reports</span>
          </a>
        </li>
      </ul>
    </div>
  </nav>

  <!-- Main -->
  <div class="main">
    <main class="content">
      <div class="container-fluid p-0">
        <h1 class="h3 mb-3">All Reported Missing Children</h1>

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
                    <th>Report Date</th>
                    <th>Status</th>
                    <th>Description</th>
                    <th>Image</th>
                  </tr>
                </thead>
                <tbody>
                 <%
                  Connection con = null;
                  PreparedStatement pstmt = null;
                  ResultSet rs = null;
                  try {
                    con = DbConnection.connect();
                    pstmt = con.prepareStatement("SELECT * FROM child_report");
                    rs = pstmt.executeQuery();
                    while (rs.next()) {
                      String imgPath = rs.getString("image_Path");
                      String imagePath = "uploads/" + imgPath;
                %>
                  <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getInt("citizen_Id") %></td>
                    <td><%= rs.getString("child_Name") %></td>
                    <td><%= rs.getInt("age") %></td>
                    <td><%= rs.getString("lastSeen_Location") %></td>        
                    <td><%= rs.getString("report_Date") %></td>
                    <td><%= rs.getString("status") %></td>
                    <td><%= rs.getString("description") %></td>
                     <td>
                      <% if(imgPath != null && !imgPath.isEmpty()) { %>
                        <img src="<%= imagePath %>" class="thumb" onclick="showPopup('<%= imagePath %>')" alt="Child Image">
                      <% } else { %>
                        <span>No Image</span>
                      <% } %>
                    </td>
                  </tr>
                  <%
                      }
                    } catch(Exception e) {
                      out.println("<tr><td colspan='9'>Error: " + e.getMessage() + "</td></tr>");
                    } finally {
                      try { if(rs != null) rs.close(); } catch(Exception e) {}
                      try { if(pstmt != null) pstmt.close(); } catch(Exception e) {}
                      try { if(con != null) con.close(); } catch(Exception e) {}
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
              <a class="text-muted" href="#"><strong>Admin Dashboard</strong></a> &copy;
            </p>
          </div>
          <div class="col-6 text-end">
            <ul class="list-inline">
              <li class="list-inline-item"><a class="text-muted" href="#">Help</a></li>
              <li class="list-inline-item"><a class="text-muted" href="#">Privacy</a></li>
            </ul>
          </div>
        </div>
      </div>
    </footer>
  </div>
</div>
<div id="imagePopup" class="popup-overlay" onclick="hidePopup()">
  <div class="popup-content" onclick="event.stopPropagation()">
    <button class="close-btn" onclick="hidePopup()">×</button>
    <img id="popupImage" class="full-image" src="" alt="Image">
  </div>
</div>

<script>
  function showPopup(src) {
    document.getElementById('popupImage').src = src;
    document.getElementById('imagePopup').style.display = 'flex';
    document.body.style.overflow = 'hidden';
  }

  function hidePopup() {
    document.getElementById('imagePopup').style.display = 'none';
    document.body.style.overflow = '';
  }

  document.addEventListener('keydown', function (e) {
    if (e.key === 'Escape') hidePopup();
  });
</script>

<!-- AdminKit JS -->
<script src="js/app.js"></script>
</body>
</html>
