<%@ page import="ConstructionXpert.Model.Project" %>
<%@ page import="java.util.List" %>
<%@ page import="ConstructionXpert.Model.Administrateur" %>
<%
    HttpSession sessionObj = request.getSession(false);
    Administrateur administrateur = (sessionObj != null) ? (Administrateur) sessionObj.getAttribute("admin") : null;
%>
<!doctype html>
<html lang="fr">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>ConstructionXpert - Projets</title>

    <!-- CSS Files -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />

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

        /* Project Section Styling */
        .projects {
            padding: 30px;
        }
        .projects h2 {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 25px;
        }
        .card {
            border: none;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            margin-bottom: 20px;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.12);
        }
        .card-title {
            font-weight: 600;
            color: #2563EB;
        }
        .card-text {
            color: #4B5563;
            margin-bottom: 8px;
        }
        .card-footer {
            background-color: white;
            border-top: 1px solid #E5E7EB;
            padding: 15px;
            display: flex;
            justify-content: space-between;
        }
        .btn-group {
            margin-right: 5px;
        }
        .btn-primary {
            background-color: #2563EB;
            border: none;
            padding: 8px 15px;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #1E40AF;
            transform: translateY(-2px);
        }
        .btn-secondary {
            background-color: #9CA3AF;
            border: none;
        }
        .btn-light {
            background-color: white;
            color: #2563EB;
            border: 1px solid #2563EB;
        }

        /* Add button styling */
        .add-btn {
            background-color: #2563EB;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 8px 15px;
            display: flex;
            align-items: center;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .add-btn i {
            margin-right: 5px;
        }
        .add-btn:hover {
            background-color: #1E40AF;
        }

        /* Modal styling */
        .modal-content {
            border-radius: 8px;
            border: none;
        }
        .modal-header {
            border-bottom: 1px solid #E5E7EB;
            background-color: #F9FAFB;
        }
        .modal-title {
            font-weight: 600;
        }
        .form-label {
            font-weight: 500;
            color: #4B5563;
        }

        /* Footer */
        footer {
            text-align: center;
            padding: 20px;
            color: #6B7280;
            background-color: white;
            margin-top: 20px;
            margin-left: 250px;
        }

        /* Menu toggle for responsive design */
        .menu-toggle {
            display: none;
            cursor: pointer;
            font-size: 24px;
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

        /* Responsive styling */
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
            footer {
                margin-left: 0;
            }
            .search-bar {
                max-width: 200px;
            }
            .overlay.active {
                display: block;
            }
        }

        @media (max-width: 576px) {
            .projects {
                padding: 15px;
            }
            .header {
                padding: 15px;
            }
            .search-bar {
                display: none;
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
                <a href="project" class="nav-link active">
                    <i class="bi bi-kanban"></i> Projets
                </a>
            </li>
            <li class="nav-item">
                <a href="ResourceServelet" class="nav-link ">
                    <i class="bi bi-box-seam"></i> Ressources
                </a>
            </li>
            <li class="nav-item">
                <a href="TacheServelet" class="nav-link">
                    <i class="bi bi-list-task"></i> Taches
                </a>
            </li>

            <li class="nav-item">
                <a href="LogoutServlet.jsp" class="nav-link">
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
                <input type="text" placeholder="Rechercher...">
            </div>
            <div class="user-menu">
                <span><%=administrateur.getNom()%></span>
                <i class="bi bi-person-circle"></i>
            </div>
        </header>

        <!-- Projects Section -->
        <section class="projects">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2>Nos Projets</h2>
                <button class="add-btn" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    <i class="fas fa-plus"></i> Ajouter un projet
                </button>
            </div>

            <div class="row">
                <%
                    List<Project> projectList = (List<Project>) request.getAttribute("projectList");
                    for(Project project : projectList){
                %>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"><%=project.getNom()%></h5>
                            <p class="card-text"><strong>Description:</strong> <%=project.getDescription()%></p>
                            <p class="card-text"><strong>Date début:</strong> <%=project.getDate_de_debut()%></p>
                            <p class="card-text"><strong>Date fin:</strong> <%=project.getDate_de_fin()%></p>
                            <p class="card-text"><strong>Budget:</strong> <%=project.getBudget()%> DH</p>
                        </div>
                        <div class="card-footer">
                            <button class="btn btn-primary edit-btn" data-id="<%= project.getId() %>"
                                    data-nom="<%= project.getNom() %>"
                                    data-description="<%= project.getDescription() %>"
                                    data-date_de_debut="<%= project.getDate_de_debut() %>"
                                    data-date_de_fin="<%= project.getDate_de_fin() %>"
                                    data-budget="<%= project.getBudget() %>">
                                <i class="fas fa-edit"></i> Modifier
                            </button>
                            <a class="btn btn-danger" href="delete?id=<%= project.getId() %>" onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce projet ?');">
                                <i class="fas fa-trash-alt"></i> Supprimer
                            </a>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
        </section>
    </div>
</div>

<!-- Edit Modal -->
<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="editModalLabel">Modifier le projet</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="edit" method="post" id="editProject">
                    <input type="hidden" name="idpr" id="editProjectId">
                    <div class="mb-3">
                        <label for="editProjectName" class="form-label">Nom du projet</label>
                        <input type="text" name="nompr" class="form-control" id="editProjectName" required>
                    </div>
                    <div class="mb-3">
                        <label for="editProjectDescription" class="form-label">Description</label>
                        <textarea class="form-control" name="descriptionpr" id="editProjectDescription" rows="3" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="editStartDate" class="form-label">Date de début</label>
                        <input type="date" name="date_debutpr" class="form-control" id="editStartDate" required>
                    </div>
                    <div class="mb-3">
                        <label for="editEndDate" class="form-label">Date de fin</label>
                        <input type="date" name="date_finpr" class="form-control" id="editEndDate" required>
                    </div>
                    <div class="mb-3">
                        <label for="editBudget" class="form-label">Budget (DH)</label>
                        <input type="number" name="budgetpr" class="form-control" id="editBudget" step="0.01" required>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                        <button type="submit" class="btn btn-primary">Enregistrer</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Add Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Ajouter un nouveau projet</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="AddProject" method="post">
                    <div class="mb-3">
                        <label for="projectName" class="form-label">Nom du projet</label>
                        <input type="text" name="nom" class="form-control" id="projectName" required>
                    </div>
                    <div class="mb-3">
                        <label for="projectDescription" class="form-label">Description</label>
                        <textarea class="form-control" name="description" id="projectDescription" rows="3" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="startDate" class="form-label">Date de début</label>
                        <input type="date" name="date_debut" class="form-control" id="startDate" required>
                    </div>
                    <div class="mb-3">
                        <label for="endDate" class="form-label">Date de fin</label>
                        <input type="date" name="date_fin" class="form-control" id="endDate" required>
                    </div>
                    <div class="mb-3">
                        <label for="budget" class="form-label">Budget (DH)</label>
                        <input type="number" name="budget" class="form-control" id="budget" step="100" required>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                        <button type="submit" class="btn btn-primary">Enregistrer</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<footer>
    <p>2025 © ConstructionXpert</p>
</footer>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Toggle sidebar
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

        // Handle edit buttons
        const editButtons = document.querySelectorAll('.edit-btn');
        editButtons.forEach(button => {
            button.addEventListener('click', function () {
                const projectId = this.getAttribute('data-id');
                const projectName = this.getAttribute('data-nom');
                const projectDescription = this.getAttribute('data-description');
                const projectStartDate = this.getAttribute('data-date_de_debut');
                const projectEndDate = this.getAttribute('data-date_de_fin');
                const projectBudget = this.getAttribute('data-budget');

                document.getElementById('editProjectId').value = projectId;
                document.getElementById('editProjectName').value = projectName;
                document.getElementById('editProjectDescription').value = projectDescription;
                document.getElementById('editStartDate').value = projectStartDate;
                document.getElementById('editEndDate').value = projectEndDate;
                document.getElementById('editBudget').value = projectBudget;

                new bootstrap.Modal(document.getElementById('editModal')).show();
            });
        });

        // Handle nav links
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

        // Handle window resize
        window.addEventListener('resize', function() {
            if (window.innerWidth > 768) {
                sidebar.classList.remove('active');
                overlay.classList.remove('active');
            }
        });
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>

</html>