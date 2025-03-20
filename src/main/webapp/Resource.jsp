<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Ressources</title>
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
    <h2 class="text-primary fw-bold pt-5">Gestion des Ressources</h2>

    <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addResourceModal">
        <i class="bi bi-plus-circle"></i> Ajouter une ressource
    </button>

    <div class="card shadow-lg mt-4">
        <div class="card-header bg-primary text-white">
            <h5 class="mb-0">Liste des Ressources</h5>
        </div>
        <div class="card-body">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Nom de la Ressource</th>
                    <th>Type</th>
                    <th>Quantité</th>
                    <th>Fournisseur</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="resource" items="${resources}">
                    <tr>
                        <td>${resource.id}</td>
                        <td>${resource.nom}</td>
                        <td>${resource.type}</td>
                        <td>${resource.quantity}</td>
                        <td>${resource.forniseur}</td>
                        <td>
                            <button class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#editResourceModal"
                                    data-id="${resource.id}" data-nom="${resource.nom}"
                                    data-type="${resource.type}" data-quantity="${resource.quantity}"
                                    data-forniseur="${resource.forniseur}"
                            >
                                Modifier
                            </button>
                            <a href="ResourceServelet?action=delete&id=${resource.id}" class="btn btn-danger btn-sm" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette ressource ?')">
                                Supprimer
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="modal fade" id="addResourceModal" tabindex="-1" aria-labelledby="addResourceModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addResourceModalLabel">Ajouter une ressource</h5>
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
                        <input type="text" class="form-control" id="type" name="type" required>
                    </div>
                    <div class="mb-3">
                        <label for="quantity" class="form-label">Quantité</label>
                        <input type="number" class="form-control" id="quantity" name="quantity" required>
                    </div>
                    <div class="mb-3">
                        <label for="forniseur" class="form-label">Fournisseur</label>
                        <input type="text" class="form-control" id="forniseur" name="forniseur" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Ajouter</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="editResourceModal" tabindex="-1" aria-labelledby="editResourceModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editResourceModalLabel">Modifier une ressource</h5>
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
                        <input type="text" class="form-control" id="editType" name="type" required>
                    </div>
                    <div class="mb-3">
                        <label for="editQuantity" class="form-label">Quantité</label>
                        <input type="number" class="form-control" id="editQuantity" name="quantity" required>
                    </div>
                    <div class="mb-3">
                        <label for="editForniseur" class="form-label">Fournisseur</label>
                        <input type="text" class="form-control" id="editForniseur" name="forniseur" required>
                    </div>
                    <button type="submit" class="btn btn-success w-100">Mettre à jour</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
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
