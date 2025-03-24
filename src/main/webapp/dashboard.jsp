<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Inventory Dashboard</title>
  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- FontAwesome Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <!-- Custom CSS -->
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
  
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container-fluid">
  
  
      <button class="btn btn-dark me-2" id="sidebarCollapse">
        <i class="fas fa-bars"></i>
      </button>
      
      <!-- Brand/Title -->
      <a class="navbar-brand" href="#">
        <i class="fas fa-boxes me-2"></i>Inventory System
      </a>
      
    
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMenu">
        <span class="navbar-toggler-icon"></span>
      </button>
      
      <div class="collapse navbar-collapse" id="navbarMenu">
        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" href="dashboard.jsp">
              <i class="fas fa-home me-1"></i> Dashboard
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="addProduct.jsp">
              <i class="fas fa-plus-circle me-1"></i> Add Product
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="viewProducts.jsp">
              <i class="fas fa-boxes me-1"></i> View Products
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="recordSale.jsp">
              <i class="fas fa-shopping-cart me-1"></i> Record Sale
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="salesReport.jsp">
              <i class="fas fa-chart-line me-1"></i> Sales Report
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>



  <nav id="sidebar" class="bg-dark text-white">
    <div class="sidebar-header p-3">
      <h3>Inventory System</h3>
    </div>
    <ul class="list-unstyled components">
      <li class="active"><a href="dashboard.jsp"><i class="fas fa-home me-2"></i>Dashboard</a></li>
      <li><a href="addProduct.jsp"><i class="fas fa-plus-circle me-2"></i>Add Product</a></li>
      <li><a href="viewProducts.jsp"><i class="fas fa-boxes me-2"></i>View Products</a></li>
      <li><a href="recordSale.jsp"><i class="fas fa-shopping-cart me-2"></i>Record Sale</a></li>
      <li><a href="salesReport.jsp"><i class="fas fa-chart-line me-2"></i>Sales Report</a></li>
    </ul>
  </nav>

  
  <div id="content" class="p-4">
    <!-- Summary Cards -->
    <div class="row mt-4">
      <div class="col-md-3 mb-4">
        <div class="card bg-primary text-white">
          <div class="card-body">
            <h5 class="card-title">Total Products</h5>
            <h2 class="card-text">150</h2>
          </div>
        </div>
      </div>
      <div class="col-md-3 mb-4">
        <div class="card bg-warning text-white">
          <div class="card-body">
            <h5 class="card-title">Low Stock</h5>
            <h2 class="card-text">12</h2>
          </div>
        </div>
      </div>
      <div class="col-md-3 mb-4">
        <div class="card bg-success text-white">
          <div class="card-body">
            <h5 class="card-title">Today's Sales</h5>
            <h2 class="card-text">$1,250</h2>
          </div>
        </div>
      </div>
      <div class="col-md-3 mb-4">
        <div class="card bg-info text-white">
          <div class="card-body">
            <h5 class="card-title">Total Profit</h5>
            <h2 class="card-text">$3,500</h2>
          </div>
        </div>
      </div>
    </div>

    
    
    <div class="card mb-4">
      <div class="card-header bg-danger text-white">
        <i class="fas fa-exclamation-triangle me-2"></i> Low-Stock Alerts
      </div>
      <div class="card-body">
        <table class="table table-striped table-hover">
          <thead>
            <tr>
              <th>Product</th>
              <th>Current Stock</th>
              <th>Min Required</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Laptop HP Elite</td>
              <td>3</td>
              <td>10</td>
              <td><button class="btn btn-sm btn-warning">Restock</button></td>
            </tr>
            <!-- More rows from DB -->
          </tbody>
        </table>
      </div>
    </div>

    
    <div class="card">
      <div class="card-header bg-primary text-white">
        <i class="fas fa-history me-2"></i> Recent Sales
      </div>
      <div class="card-body">
        <table class="table table-striped table-hover">
          <thead>
            <tr>
              <th>Sale ID</th>
              <th>Product</th>
              <th>Qty Sold</th>
              <th>Date</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1001</td>
              <td>Wireless Mouse</td>
              <td>5</td>
              <td>2023-10-05</td>
            </tr>
            <!-- More rows from DB -->
          </tbody>
        </table>
      </div>
    </div>
  </div>



 <script>
document.addEventListener('DOMContentLoaded', function() {
    const sidebar = document.getElementById('sidebar');
    const toggleButton = document.getElementById('sidebarCollapse');
    
    // Toggle sidebar
    if (toggleButton) {
        toggleButton.addEventListener('click', function(e) {
            e.preventDefault();
            sidebar.classList.toggle('active');
        });
    }
    
    
    const navItems = document.querySelectorAll('#sidebar a');
    navItems.forEach(item => {
        item.addEventListener('click', function() {
            if (window.innerWidth <= 768) {
                sidebar.classList.remove('active');
            }
        });
    });
    
    // Close sidebar when clicking outside (for desktop)
    document.addEventListener('click', function(e) {
        if (window.innerWidth > 768 && 
            !sidebar.contains(e.target) && 
            e.target !== toggleButton && 
            !toggleButton.contains(e.target)) {
            sidebar.classList.remove('active');
        }
    });
});
</script>
</body>
</html>