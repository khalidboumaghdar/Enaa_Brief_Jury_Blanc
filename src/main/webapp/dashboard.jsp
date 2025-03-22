<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConstructionXpert - Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
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
        .container {
            display: flex;
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
        /* Dashboard content */
        .dashboard {
            padding: 30px;
        }
        .dashboard-title {
            margin-bottom: 25px;
            font-size: 24px;
            font-weight: 600;
        }
        .dashboard-stats {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 30px;
        }
        .stat-card {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }
        .stat-card-title {
            color: #6B7280;
            font-size: 14px;
            margin-bottom: 10px;
        }
        .stat-card-value {
            font-size: 28px;
            font-weight: 600;
            color: #111827;
        }
        .stat-card-icon {
            float: right;
            background-color: rgba(37, 99, 235, 0.1);
            width: 40px;
            height: 40px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #2563EB;
            font-size: 18px;
        }
        .dashboard-charts {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 20px;
            margin-bottom: 30px;
        }
        .chart-card {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }
        .chart-card-title {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 20px;
            color: #374151;
        }
        .chart-placeholder {
            height: 300px;
            background-color: #F9FAFB;
            border-radius: 4px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #9CA3AF;
        }
        .recent-projects {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }
        .recent-title {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 20px;
            color: #374151;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .view-all {
            color: #2563EB;
            font-size: 14px;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .view-all:hover {
            color: #1E40AF;
            text-decoration: underline;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th {
            text-align: left;
            padding: 12px 15px;
            border-bottom: 1px solid #E5E7EB;
            color: #6B7280;
            font-weight: 500;
        }
        td {
            padding: 12px 15px;
            border-bottom: 1px solid #E5E7EB;
        }
        tr:hover {
            background-color: #F9FAFB;
        }
        .status {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
        }
        .status.active {
            background-color: rgba(16, 185, 129, 0.1);
            color: #10B981;
        }
        .status.pending {
            background-color: rgba(245, 158, 11, 0.1);
            color: #F59E0B;
        }
        .status.completed {
            background-color: rgba(37, 99, 235, 0.1);
            color: #2563EB;
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
        /* Action buttons */
        .action-btn {
            padding: 8px 12px;
            background-color: #2563EB;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 12px;
            transition: background-color 0.3s ease;
        }
        .action-btn:hover {
            background-color: #1E40AF;
        }
        /* Responsive */
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
            .dashboard-stats {
                grid-template-columns: 1fr;
            }
            .header {
                padding: 15px;
            }
            .dashboard {
                padding: 15px;
            }
            .search-bar {
                display: none;
            }
            .chart-placeholder {
                height: 200px;
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
<div class="container">
    <!-- Sidebar -->
    <aside class="sidebar" id="sidebar">
        <div class="sidebar-header">
            <img src="assets/images/logosport.png" alt="ConstructionXpert Logo">
        </div>
        <ul class="nav-menu">
            <li class="nav-item">
                <a href="#" class="nav-link active">
                    Dashboard
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">
                    Projets
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">
                   Tâches
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">
                    Ressources
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">
                    Fournisseurs
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">
                     Paramètres
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">
                    Déconnexion
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
                <span>Admin</span>
                <img src="/api/placeholder/40/40" alt="User">
            </div>
        </header>

        <!-- Dashboard Content -->
        <div class="dashboard">
            <h1 class="dashboard-title">Tableau de bord</h1>

            <!-- Stats Cards -->
            <div class="dashboard-stats">
                <div class="stat-card">
                    <div class="stat-card-icon"><i class="bi bi-stopwatch"></i></div>
                    <div class="stat-card-title">Projets en cours</div>
                    <div class="stat-card-value">12</div>
                </div>
                <div class="stat-card">
                    <div class="stat-card-icon"><i class="bi bi-calendar-check"></i></div>
                    <div class="stat-card-title">Taches a completer</div>
                    <div class="stat-card-value">48</div>
                </div>
                <div class="stat-card">
                    <div class="stat-card-icon"><i class="bi bi-box-seam"></i></div>
                    <div class="stat-card-title">Ressources</div>
                    <div class="stat-card-value">320</div>
                </div>
                <div class="stat-card">
                    <div class="stat-card-icon"><i class="bi bi-person-fill"></i></div>
                    <div class="stat-card-title">Fournisseurs</div>
                    <div class="stat-card-value">24</div>
                </div>
            </div>


            <!-- Recent Projects -->
            <div class="recent-projects">
                <div class="recent-title">
                    <span>Projets </span>
                    <a href="#" class="view-all">Voir tout</a>
                </div>
                <div class="table-responsive">
                    <table>
                        <thead>
                        <tr>
                            <th>Nom du projet</th>
                            <th>Date début</th>
                            <th>Date fin</th>
                            <th>Budget</th>
                            <th>Statut</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>Résidence Les Cedres</td>
                            <td>01/02/2025</td>
                            <td>15/08/2025</td>
                            <td>2 500 000 DH</td>
                            <td><span class="status active">En cours</span></td>
                            <td>
                                <button class="action-btn">Détails</button>
                            </td>
                        </tr>
                        <tr>
                            <td>Centre Commercial Médina</td>
                            <td>15/01/2025</td>
                            <td>30/10/2025</td>
                            <td>8 200 000 DH</td>
                            <td><span class="status active">En cours</span></td>
                            <td>
                                <button class="action-btn">Détails</button>
                            </td>
                        </tr>
                        <tr>
                            <td>Tour Atlantique</td>
                            <td>10/11/2024</td>
                            <td>22/05/2025</td>
                            <td>4 800 000 DH</td>
                            <td><span class="status completed">Terminé</span></td>
                            <td>
                                <button class="action-btn">Détails</button>
                            </td>
                        </tr>
                        <tr>
                            <td>Hôtel Marina Bay</td>
                            <td>01/04/2025</td>
                            <td>30/12/2025</td>
                            <td>12 500 000 DH</td>
                            <td><span class="status pending">Planifié</span></td>
                            <td>
                                <button class="action-btn">Détails</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript pour la navigation responsive -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const menuToggle = document.getElementById('menu-toggle');
        const sidebar = document.getElementById('sidebar');
        const mainContent = document.getElementById('main-content');
        const overlay = document.getElementById('overlay');

        // Fonction pour gérer l'état du menu
        function toggleMenu() {
            sidebar.classList.toggle('active');
            overlay.classList.toggle('active');
        }

        // Event listeners
        menuToggle.addEventListener('click', toggleMenu);
        overlay.addEventListener('click', toggleMenu);

        // Gestion des clics sur les liens de navigation
        const navLinks = document.querySelectorAll('.nav-link');
        navLinks.forEach(link => {
            link.addEventListener('click', function() {
                // Supprimer la classe active de tous les liens
                navLinks.forEach(l => l.classList.remove('active'));

                // Ajouter la classe active au lien cliqué
                this.classList.add('active');

                // Fermer le menu si sur mobile
                if (window.innerWidth <= 768) {
                    toggleMenu();
                }
            });
        });

        // Gestion du redimensionnement de la fenêtre
        window.addEventListener('resize', function() {
            if (window.innerWidth > 768) {
                sidebar.classList.remove('active');
                overlay.classList.remove('active');
            }
        });
    });
</script>
</body>
</html>