<%@ page import="ConstructionXpert.Model.Project" %>
<%@ page import="java.util.List" %>
<%@ page import="ConstructionXpert.Model.Ressource" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Taches</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
</head>
<body>
<header>
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.html">
                <img src="assets/images/logosport.png" alt="Logo" class="img-fluid img" />
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="index.html">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="project">Project</a></li>
                    <li class="nav-item"><a class="nav-link" href="index.html">Resource</a></li>
                    <li class="nav-item"><a class="nav-link" href="index.html">Taches</a></li>
                    <li class="nav-item pl-5"><a class="btn btn-light text-primary" href="connection.jsp">Connexion</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<div class="container pt-5">
    <h2 class="text-primary fw-bold pt-5">Gestion des Taches</h2>

    <!-- Button to Add New Task -->
    <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addTaskModal">
        <i class="bi bi-plus-circle"></i> Ajouter une tâche
    </button>

    <!-- Task List -->
    <div class="card shadow-lg mt-4">
        <div class="card-header bg-primary text-white">
            <h5 class="mb-0">Liste des Tâches</h5>
        </div>
        <div class="card-body">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Nom de la Tâche</th>
                    <th>Date de début</th>
                    <th>Date de fin</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <!-- Iterate through tasks and display them -->
                <c:forEach var="tache" items="${taches}">
                    <tr>
                        <td>${tache.id}</td>
                        <td>${tache.description}</td>
                        <td>${tache.dateDebut}</td>
                        <td>${tache.dateFin}</td>
                        <td>
                            <!-- Edit Button -->
                            <button class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#editTaskModal"
                                    data-id="${tache.id}"
                                    data-projet_id="${tache.project.id}"
                                    data-description="${tache.description}"
                                    data-dateDebut="${tache.dateDebut}" data-dateFin="${tache.dateFin}">
                                Modifier
                            </button>
                            <!-- Delete Button -->
                            <a href="TacheServelet?action=delete&id=${tache.id}" class="btn btn-danger btn-sm" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette tâche ?')">
                                Supprimer
                            </a>
                            <button data-bs-toggle="modal" data-bs-target="#Addresourcetache"
                               data-id="${tache.id}"
                               data-projet_id="${tache.project.id}"
                               data-description="${tache.description}"
                               data-dateDebut="${tache.dateDebut}" data-dateFin="${tache.dateFin}"  class="btn btn-success" > Assignation</button>

                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="modal fade" id="Addresourcetache" tabindex="-1" aria-labelledby="addTaskModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="Addresourcetachelabel">Ajouter une tâche</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="card-body ">
                    <form action="AssignationServelet?action=add" method="POST">
                        <input type="hidden" id="AddresourceProject" name="project_id">
                        <input type="hidden" id="Addresourcetacheid" name="tache_id">


                        <div class="mb-3">
                            <label for="ressource_id" class="form-label">Sélectionner une Ressource</label>
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
                            <label for="quantite_utilisee" class="form-label">Quantité Utilisée</label>
                            <input type="number" class="form-control" id="quantite_utilisee" name="quantite_utilisee" min="1" required>
                        </div>

                        <button type="submit" class="btn btn-success w-100">Ajouter</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addTaskModal" tabindex="-1" aria-labelledby="addTaskModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addTaskModalLabel">Ajouter une tâche</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="TacheServelet?action=add" method="POST">
                    <div class="mb-3">
                        <select class="form-select" name="projet_id" aria-label="Default select example">
                            <%
                                List<Project> projectList = (List<Project>) request.getAttribute("projectList");
                                for(Project project : projectList){


                            %>
                            <option value="<%=project.getId()%>"><%=project.getNom()%></option>
                            <%}%>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Nom de la tâche</label>
                        <input type="text" class="form-control" id="description" name="description" required>
                    </div>
                    <div class="mb-3">
                        <label for="dateDebut" class="form-label">Date de début</label>
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
                    <div class="mb-3">
                        <input type="hidden" id="editTaskprojet_id" name="projet_id">

                    </div>
                    <div class="mb-3">
                        <label for="editDescription" class="form-label">Nom de la tâche</label>
                        <input type="text" class="form-control" id="editDescription" name="description" required>
                    </div>
                    <div class="mb-3">
                        <label for="editDateDebut" class="form-label">Date de début</label>
                        <input type="date" class="form-control" id="editDateDebut" name="date_debut" required>
                    </div>
                    <div class="mb-3">
                        <label for="editDateFin" class="form-label">Date de fin</label>
                        <input type="date" class="form-control" id="editDateFin" name="date_fin" required>
                    </div>
                    <button type="submit" class="btn btn-success w-100">Mettre à jour</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
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
        document.getElementById('editTaskprojet_id').value =teskprojet_id;
    });

    document.addEventListener('DOMContentLoaded', function () {
        var assignModal = document.getElementById('Addresourcetache');
        assignModal.addEventListener('show.bs.modal', function (event) {
            var button = event.relatedTarget;
            var taskId = button.getAttribute('data-id');
            var Resourceprojet_id = button.getAttribute('data-projet_id');
            document.getElementById('Addresourcetacheid').value = taskId;
            document.getElementById('AddresourceProject').value=Resourceprojet_id;
        });
    });

</script>
</body>
</html>
