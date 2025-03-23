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
                    <h1 class="dashboard-title">Gestion des Ressources</h1>

                    <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addResourceModal">
                        <i class="bi bi-plus-circle me-2"></i> Ajouter une ressource
                    </button>
                </div>

                <div class="card shadow">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="text-white mb-0"><i class="bi bi-list-ul me-2"></i>Liste des Ressources</h5>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th width="5%">#</th>
                                    <th width="25%">Nom de la Ressource</th>
                                    <th width="15%">Type</th>
                                    <th width="15%">Quantite</th>
                                    <th width="20%">Fournisseur</th>
                                    <th width="20%">Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="resource" items="${resources}">
                                    <tr>
                                        <td>${resource.id}</td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <i class="bi bi-box me-2 text-primary"></i>
                                                <div>${resource.nom}</div>
                                            </div>
                                        </td>
                                        <td><span class="badge bg-info text-dark">${resource.type}</span></td>
                                        <td>${resource.quantity}</td>
                                        <td>${resource.forniseur}</td>
                                        <td>
                                            <button class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#editResourceModal"
                                                    data-id="${resource.id}" data-nom="${resource.nom}"
                                                    data-type="${resource.type}" data-quantity="${resource.quantity}"
                                                    data-forniseur="${resource.forniseur}">
                                                <i class="bi bi-pencil me-1"></i> Modifier
                                            </button>
                                            <a href="ResourceServelet?action=delete&id=${resource.id}" class="btn btn-danger btn-sm" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette ressource ?')">
                                                <i class="bi bi-trash me-1"></i> Supprimer
                                            </a>
                                        </td>
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


<div class="modal fade" id="addResourceModal" tabindex="-1" aria-labelledby="addResourceModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addResourceModalLabel"><i class="bi bi-plus-circle-fill me-2 text-success"></i>Ajouter une ressource</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="ResourceServelet?action=add" method="POST">
                    <div class="mb-3">
                        <label for="description" class="form-label">Nom de la ressource</label>
                        <input type="text" class="form-control" id="description" name="nom" required>
                    </div>
                    <div class="mb-3">
                        <label for="type" class="form-label">Type</label>
                        <select class="form-select" id="type" name="type" required>
                            <option value="" selected disabled>Selectionner un type</option>
                            <option value="Matériel">Materiel</option>
                            <option value="Outil">Outil</option>
                            <option value="Matériau">Materiau</option>
                            <option value="Autre">Autre</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="quantity" class="form-label">Quantite</label>
                        <input type="number" class="form-control" id="quantity" name="quantity" required>
                    </div>
                    <div class="mb-3">
                        <label for="forniseur" class="form-label">Fournisseur</label>
                        <input type="text" class="form-control" id="forniseur" name="forniseur" required>
                    </div>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary">
                            <i class="bi bi-save me-2"></i>Ajouter
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="editResourceModal" tabindex="-1" aria-labelledby="editResourceModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editResourceModalLabel"><i class="bi bi-pencil-fill me-2 text-warning"></i>Modifier une ressource</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="ResourceServelet?action=update" method="POST">
                    <input type="hidden" id="editResourceId" name="id">

                    <div class="mb-3">
                        <label for="editnom" class="form-label">Nom de la ressource</label>
                        <input type="text" class="form-control" id="editnom" name="nom" required>
                    </div>
                    <div class="mb-3">
                        <label for="editType" class="form-label">Type</label>
                        <select class="form-select" id="editType" name="type" required>
                            <option value="Matériel">Materiel</option>
                            <option value="Outil">Outil</option>
                            <option value="Matériau">Materiau</option>
                            <option value="Autre">Autre</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="editQuantity" class="form-label">Quantité</label>
                        <input type="number" class="form-control" id="editQuantity" name="quantity" required>
                    </div>
                    <div class="mb-3">
                        <label for="editForniseur" class="form-label">Fournisseur</label>
                        <input type="text" class="form-control" id="editForniseur" name="forniseur" required>
                    </div>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-success">
                            <i class="bi bi-check-circle me-2"></i>Mettre à jour
                        </button>
                    </div>
                </form>
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

        const navLinks = document.querySelectorAll('.nav-link');
        navLinks.forEach(link => {
            link.addEventListener('click', function() {
                navLinks.forEach(l => l.classList.remove('active'));

                this.classList.add('active');

                if (window.innerWidth <= 768) {
                    toggleMenu();
                }
            });
        });

        window.addEventListener('resize', function() {
            if (window.innerWidth > 768) {
                sidebar.classList.remove('active');
                overlay.classList.remove('active');
            }
        });
    });

    var editResourceModal = document.getElementById('editResourceModal');
    editResourceModal.addEventListener('show.bs.modal', function(event) {
        var button = event.relatedTarget;
        var resourceId = button.getAttribute('data-id');
        var resourceDescription = button.getAttribute('data-nom');
        var resourceType = button.getAttribute('data-type');
        var resourceQuantity = button.getAttribute('data-quantity');
        var resourceForniseur = button.getAttribute('data-forniseur');

        document.getElementById('editResourceId').value = resourceId;
        document.getElementById('editnom').value = resourceDescription;
        document.getElementById('editType').value = resourceType;
        document.getElementById('editQuantity').value = resourceQuantity;
        document.getElementById('editForniseur').value = resourceForniseur;
    });
</script>
</body>
</html>