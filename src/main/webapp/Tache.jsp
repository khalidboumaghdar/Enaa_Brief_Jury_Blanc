<%@ page import="ConstructionXpert.Model.Project" %>
<%@ page import="java.util.List" %>
<%@ page import="ConstructionXpert.Model.Ressource" %>
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
    <title>ConstructionXpert - Gestion des Taches</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #F3F4F6;
            margin: 0;
            padding: 0;
            color: #111827;
        }
        .container-fluid {
            display: flex;
            padding: 0;
        }
        /* Sidebar */
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
        /* Main content */
        .main-content {
            flex: 1;
            margin-left: 250px;
            transition: all 0.3s ease;
            width: calc(100% - 250px);
        }
        /* Header */
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
        /* Task content */
        .task-content {
            padding: 30px;
        }
        .page-title {
            margin-bottom: 25px;
            font-size: 24px;
            font-weight: 600;
            color: #2563EB;
        }
        .card {
            border: none;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
        }
        .card-header {
            font-weight: 600;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        }
        .action-buttons {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }
        .btn-add {
            background-color: #10B981;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: all 0.3s;
        }
        .btn-add:hover {
            background-color: #059669;
            transform: translateY(-2px);
        }
        .table {
            margin-bottom: 0;
        }
        .table th {
            font-weight: 600;
            color: #6B7280;
        }
        .table td {
            vertical-align: middle;
        }
        .status-badge {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
        }
        .status-badge.active {
            background-color: rgba(16, 185, 129, 0.1);
            color: #10B981;
        }
        .status-badge.pending {
            background-color: rgba(245, 158, 11, 0.1);
            color: #F59E0B;
        }
        .status-badge.completed {
            background-color: rgba(37, 99, 235, 0.1);
            color: #2563EB;
        }
        .btn-action {
            padding: 6px 12px;
            font-size: 12px;
            border-radius: 4px;
            transition: all 0.2s;
        }
        .btn-action:hover {
            transform: translateY(-2px);
        }
        .btn-warning {
            background-color: #F59E0B;
            border-color: #F59E0B;
        }
        .btn-danger {
            background-color: #EF4444;
            border-color: #EF4444;
        }
        .btn-success {
            background-color: #10B981;
            border-color: #10B981;
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
        /* Modal customization */
        .modal-header {
            background-color: #2563EB;
            color: white;
        }
        .modal-title {
            font-weight: 600;
        }
        .form-label {
            font-weight: 500;
        }
        /* Responsive */
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
            .task-content {
                padding: 15px;
            }
        }
        @media (max-width: 576px) {
            .header {
                padding: 15px;
            }
            .search-bar {
                display: none;
            }
            .table-responsive {
                overflow-x: auto;
            }
        }
    </style>
</head>
<body>
<div class="overlay" id="overlay"></div>
<div class="container-fluid">
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
                <a href="ResourceServelet" class="nav-link ">
                    <i class="bi bi-box-seam"></i> Ressources
                </a>
            </li>
            <li class="nav-item">
                <a href="TacheServelet" class="nav-link active">
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

    <!-- Main Content -->
    <div class="main-content" id="main-content">
        <!-- Header -->
        <header class="header">
            <div class="menu-toggle" id="menu-toggle"><i class="bi bi-list"></i></div>
            <div class="search-bar">
                <i class="bi bi-search"></i>
                <input type="text" placeholder="Rechercher une tâche...">
            </div>
            <div class="user-menu">
                <span><%=administrateur.getNom()%></span>
                <i class="bi bi-person-circle"></i>
            </div>
        </header>

        <!-- Task Content -->
        <div class="task-content">
            <h1 class="page-title">Gestion des Taches</h1>

            <div class="action-buttons">
                <button class="btn btn-add" data-bs-toggle="modal" data-bs-target="#addTaskModal">
                    <i class="bi bi-plus-circle"></i> Ajouter une tache
                </button>
            </div>

            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h5 class="card-title mb-0">Liste des Taches</h5>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Nom de la Project</th>
                                <th>Nom de la Tache</th>
                                <th>Date de debut</th>
                                <th>Date de fin</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="tache" items="${taches}">
                                <tr>
                                    <td>${tache.id}</td>
                                    <td>${tache.project.nom}</td>
                                    <td>${tache.description}</td>
                                    <td>${tache.dateDebut}</td>
                                    <td>${tache.dateFin}</td>
                                    <td>
                                        <div class="d-flex gap-2">
                                            <button class="btn btn-warning btn-action" data-bs-toggle="modal" data-bs-target="#editTaskModal"
                                                    data-id="${tache.id}"
                                                    data-projet_id="${tache.project.id}"
                                                    data-description="${tache.description}"
                                                    data-dateDebut="${tache.dateDebut}" data-dateFin="${tache.dateFin}">
                                                <i class="bi bi-pencil"></i>
                                            </button>
                                            <a href="TacheServelet?action=delete&id=${tache.id}" class="btn btn-danger btn-action" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette tâche ?')">
                                                <i class="bi bi-trash"></i>
                                            </a>
                                            <button class="btn btn-success btn-action" data-bs-toggle="modal" data-bs-target="#Addresourcetache"
                                                    data-id="${tache.id}"
                                                    data-projet_id="${tache.project.id}"
                                                    data-description="${tache.description}"
                                                    data-dateDebut="${tache.dateDebut}" data-dateFin="${tache.dateFin}">
                                                <i class="bi bi-person-plus"></i>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <a href="ResourceTache" class="btn btn-success">Resource Taches</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addTaskModal" tabindex="-1" aria-labelledby="addTaskModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addTaskModalLabel">Ajouter une tache</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="TacheServelet?action=add" method="POST">
                    <div class="mb-3">
                        <label for="projet_id" class="form-label">Projet</label>
                        <select class="form-select" id="projet_id" name="projet_id" required>
                            <%
                                List<Project> projectList = (List<Project>) request.getAttribute("projectList");
                                for(Project project : projectList){
                            %>
                            <option value="<%=project.getId()%>"><%=project.getNom()%></option>
                            <%}%>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Nom de la tache</label>
                        <input type="text" class="form-control" id="description" name="description" required>
                    </div>
                    <div class="mb-3">
                        <label for="dateDebut" class="form-label">Date de debut</label>
                        <input type="date" class="form-control" id="dateDebut" name="date_debut" required>
                    </div>
                    <div class="mb-3">
                        <label for="dateFin" class="form-label">Date de fin</label>
                        <input type="date" class="form-control" id="dateFin" name="date_fin" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Ajouter</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="editTaskModal" tabindex="-1" aria-labelledby="editTaskModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editTaskModalLabel">Modifier une tâche</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="TacheServelet?action=update" method="POST">
                    <input type="hidden" id="editTaskId" name="id">
                    <input type="hidden" id="editTaskprojet_id" name="projet_id">
                    <div class="mb-3">
                        <label for="editDescription" class="form-label">Nom de la tache</label>
                        <input type="text" class="form-control" id="editDescription" name="description" required>
                    </div>
                    <div class="mb-3">
                        <label for="editDateDebut" class="form-label">Date de debut</label>
                        <input type="date" class="form-control" id="editDateDebut" name="date_debut" required>
                    </div>
                    <div class="mb-3">
                        <label for="editDateFin" class="form-label">Date de fin</label>
                        <input type="date" class="form-control" id="editDateFin" name="date_fin" required>
                    </div>
                    <button type="submit" class="btn btn-success w-100">Mettre a jour</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="Addresourcetache" tabindex="-1" aria-labelledby="Addresourcetachelabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="Addresourcetachelabel">Assigner des ressources</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="AssignationServelet?action=add" method="POST">
                    <input type="hidden" id="AddresourceProject" name="project_id">
                    <input type="hidden" id="Addresourcetacheid" name="tache_id">
                    <div class="mb-3">
                        <label for="ressource_id" class="form-label">Selectionner une Ressource</label>
                        <select class="form-select" id="ressource_id" name="ressource_id" required>
                            <%
                                List<Ressource> ressourceList = (List<Ressource>) request.getAttribute("resources");
                                for(Ressource ressource : ressourceList){
                            %>
                            <option value="<%=ressource.getId()%>"><%=ressource.getNom()%></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="quantite_utilisee" class="form-label">Quantite Utilisee</label>
                        <input type="number" class="form-control" id="quantite_utilisee" name="quantite_utilisee" min="1" required>
                    </div>
                    <button type="submit" class="btn btn-success w-100">Assigner</button>
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

        var editTaskModal = document.getElementById('editTaskModal');
        editTaskModal.addEventListener('show.bs.modal', function(event) {
            var button = event.relatedTarget;
            var taskId = button.getAttribute('data-id');
            var taskDescription = button.getAttribute('data-description');
            var taskDateDebut = button.getAttribute('data-dateDebut');
            var taskDateFin = button.getAttribute('data-dateFin');
            var teskprojet_id = button.getAttribute('data-projet_id');

            document.getElementById('editTaskId').value = taskId;
            document.getElementById('editDescription').value = taskDescription;
            document.getElementById('editDateDebut').value = taskDateDebut;
            document.getElementById('editDateFin').value = taskDateFin;
            document.getElementById('editTaskprojet_id').value = teskprojet_id;
        });

        var assignModal = document.getElementById('Addresourcetache');
        assignModal.addEventListener('show.bs.modal', function (event) {
            var button = event.relatedTarget;
            var taskId = button.getAttribute('data-id');
            var Resourceprojet_id = button.getAttribute('data-projet_id');
            document.getElementById('Addresourcetacheid').value = taskId;
            document.getElementById('AddresourceProject').value = Resourceprojet_id;
        });
    });

</script>
</body>
</html>