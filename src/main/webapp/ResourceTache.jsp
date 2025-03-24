<%@ page import="java.util.List" %>
<%@ page import="ConstructionXpert.Model.Administrateur" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    HttpSession sessionObj = request.getSession(false);
    Administrateur administrateur = (sessionObj != null) ? (Administrateur) sessionObj.getAttribute("admin") : null;
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Ressources - ConstructionXpert</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #F3F4F6;
            color: #2D3748;
        }

        .container-fluid {
            padding: 0;
        }

        .main-wrapper {
            display: flex;
        }

        .sidebar {
            width: 250px;
            background-color: #000;
            color: white;
            height: 100vh;
            position: fixed;
            transition: all 0.3s ease;
            z-index: 100;
            overflow-y: auto;
        }

        .sidebar-header {
            padding: 20px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .sidebar-header img {
            height: 40px;
        }

        .nav-menu {
            list-style: none;
            padding: 0;
            margin: 20px 0;
        }

        .nav-item {
            margin-bottom: 5px;
        }

        .nav-link {
            display: flex;
            align-items: center;
            padding: 12px 20px;
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            transition: all 0.3s;
            border-left: 4px solid transparent;
        }

        .nav-link:hover, .nav-link.active {
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
            border-left: 4px solid #F59E0B;
        }

        .nav-link i {
            margin-right: 10px;
            width: 24px;
            text-align: center;
            font-size: 18px;
        }

        .main-content {
            flex: 1;
            margin-left: 250px;
            transition: all 0.3s ease;
            width: calc(100% - 250px);
        }

        .header {
            background-color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
            position: sticky;
            top: 0;
            z-index: 99;
        }

        .search-bar {
            flex: 1;
            max-width: 400px;
            position: relative;
        }

        .search-bar input {
            width: 100%;
            padding: 10px 15px 10px 40px;
            border: 1px solid #D1D5DB;
            border-radius: 4px;
            font-size: 14px;
        }

        .search-bar i {
            position: absolute;
            left: 15px;
            top: 12px;
            color: #9CA3AF;
        }

        .user-menu {
            display: flex;
            align-items: center;
        }

        .user-menu img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-left: 15px;
            cursor: pointer;
        }

        .menu-toggle {
            display: none;
            cursor: pointer;
            font-size: 24px;
            z-index: 101;
        }

        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 99;
        }

        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.05);
            overflow: hidden;
            margin-bottom: 30px;
        }

        .card-header {
            background: linear-gradient(to right, #1a237e, #3949ab);
            padding: 15px 20px;
            border-bottom: none;
        }

        .card-header h5 {
            font-weight: 600;
        }

        .dashboard {
            padding: 30px;
        }

        .dashboard-title {
            margin-bottom: 25px;
            font-size: 24px;
            font-weight: 600;
            color: #1a237e;
            position: relative;
            display: inline-block;
        }

        .dashboard-title:after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 60px;
            height: 4px;
            background-color: #FFC107;
            border-radius: 2px;
        }

        .table {
            margin-bottom: 0;
        }

        .table th {
            background-color: #f1f5f9;
            font-weight: 600;
            color: #4a5568;
            padding: 15px;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .table td {
            padding: 15px;
            vertical-align: middle;
            color: #2d3748;
            border-color: #edf2f7;
        }

        .table tr:hover {
            background-color: #f8fafc;
        }

        .btn-success {
            background-color: #38a169;
            border: none;
            font-weight: 500;
            padding: 10px 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .btn-success:hover {
            background-color: #2f855a;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        }

        .btn-warning {
            background-color: #f6ad55;
            border: none;
            color: white;
            font-weight: 500;
            transition: all 0.3s;
        }

        .btn-warning:hover {
            background-color: #ed8936;
            color: white;
        }

        .btn-danger {
            background-color: #f56565;
            border: none;
            font-weight: 500;
            transition: all 0.3s;
        }

        .btn-danger:hover {
            background-color: #e53e3e;
        }

        .modal-content {
            border: none;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        .modal-header {
            background-color: #f8fafc;
            border-bottom: 1px solid #edf2f7;
            padding: 15px 20px;
        }

        .modal-title {
            font-weight: 600;
            color: #2d3748;
        }

        .modal-body {
            padding: 20px;
        }

        .form-label {
            font-weight: 500;
            color: #4a5568;
            margin-bottom: 8px;
        }

        .form-control {
            padding: 12px 15px;
            border: 1px solid #e2e8f0;
            border-radius: 5px;
            transition: all 0.3s;
        }

        .form-control:focus {
            border-color: #4299e1;
            box-shadow: 0 0 0 3px rgba(66, 153, 225, 0.15);
        }

        @media (max-width: 1024px) {
            .dashboard-stats {
                grid-template-columns: repeat(2, 1fr);
            }
            .dashboard-charts {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            .menu-toggle {
                display: block;
            }
            .sidebar {
                transform: translateX(-250px);
            }
            .sidebar.active {
                transform: translateX(0);
            }
            .main-content {
                margin-left: 0;
                width: 100%;
            }
            .search-bar {
                max-width: 200px;
            }
            .overlay.active {
                display: block;
            }
        }

        @media (max-width: 576px) {
            .header {
                padding: 15px;
            }
            .dashboard {
                padding: 15px;
            }
            .search-bar {
                display: none;
            }
            .table-responsive {
                overflow-x: auto;
            }
            table {
                min-width: 600px;
            }
        }
    </style>
</head>
<body>
<div class="overlay" id="overlay"></div>
<div class="container-fluid">
    <div class="main-wrapper">
        <!-- Sidebar -->
        <aside class="sidebar" id="sidebar">
            <div class="sidebar-header">
                <img src="assets/images/logosport.png" alt="ConstructionXpert Logo">
            </div>
            <ul class="nav-menu">
                <li class="nav-item">
                    <a href="dashboard" class="nav-link ">
                        <i class="bi bi-speedometer2"></i> Dashboard
                    </a>
                </li>
                <li class="nav-item">
                    <a href="project" class="nav-link">
                        <i class="bi bi-kanban"></i> Projets
                    </a>
                </li>
                <li class="nav-item">
                    <a href="ResourceServelet" class="nav-link active">
                        <i class="bi bi-box-seam"></i> Ressources
                    </a>
                </li>
                <li class="nav-item">
                    <a href="TacheServelet" class="nav-link">
                        <i class="bi bi-list-task"></i> Taches
                    </a>
                </li>

                <li class="nav-item">
                    <a href="LogoutServlet" class="nav-link">
                        <i class="bi bi-box-arrow-right"></i> Deconnexion
                    </a>
                </li>
            </ul>

        </aside>

        <div class="main-content" id="main-content">
            <header class="header">
                <div class="menu-toggle" id="menu-toggle"><i class="bi bi-list"></i></div>
                <div class="search-bar">
                    <i class="bi bi-search"></i>
                    <input type="text" placeholder="Rechercher...">
                </div>
                <div class="user-menu">
                    <span><%=administrateur.getNom()%></span>
                    <i class="bi bi-person-circle"></i>
                </div>
            </header>

            <div class="dashboard">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h1 class="dashboard-title">Gestion des Ressources Taches</h1>


                </div>

                <div class="card shadow">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="text-white mb-0"><i class="bi bi-list-ul me-2"></i>Liste des Ressources taches</h5>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th width="5%">#</th>
                                    <th width="15%">Quantite utilise</th>
                                    <th width="15%">Nom Resource</th>
                                    <th width="20%">Description Tache</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="resourcetache" items="${resourceTaches}">
                                    <tr>
                                        <td>${resourcetache.id}</td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <i class="bi bi-box me-2 text-primary"></i>
                                                <div>${resourcetache.quantity}</div>
                                            </div>
                                        </td>
                                        <td><span class="badge bg-info text-dark">${resourcetache.ressource.nom}</span></td>
                                        <td><span class="badge bg-info text-dark">${resourcetache.taches.description}</span></td>

                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const menuToggle = document.getElementById('menu-toggle');
        const sidebar = document.getElementById('sidebar');
        const mainContent = document.getElementById('main-content');
        const overlay = document.getElementById('overlay');

        function toggleMenu() {
            sidebar.classList.toggle('active');
            overlay.classList.toggle('active');
        }

        menuToggle.addEventListener('click', toggleMenu);
        overlay.addEventListener('click', toggleMenu);
    });

</script>
</body>
</html>