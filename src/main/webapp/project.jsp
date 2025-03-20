<%@ page import="ConstructionXpert.Model.Project" %>
<%@ page import="java.util.List" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>ConstructionXpert-project</title>

    <!-- CSS Files -->
    <style><%@include file="assets/css/style.css"%></style>
    <style><%@include file="assets/css/test.css"%></style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />

 
</head>

<body>

    <header>
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp">
                    <img src="assets/images/logosport.png" alt="Logo" class="img-fluid img" />
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="index.jsp">Dashboard</a></li>
                        <li class="nav-item"><a class="nav-link" href="index.jsp">Project</a></li>
                        <li class="nav-item"><a class="nav-link" href="index.jsp">Resource</a></li>
                        <li class="nav-item"><a class="nav-link" href="index.jsp">Taches</a></li>
                        <li class="nav-item pl-5"><a class="btn btn-light text-primary" href="connection.jsp">Connexion</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <main>
        <section class="projects py-5">
            <div class="container pt-5">
                <div class="row">
                    <div class="col-md-10">
                        <h2 class=" mb-5"> Nos Projets</h2>
                    </div>
                    <div class="col-md-2">
                        <div class="btn-group">
                        <button data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fas fa-plus"></i> Add</button>
                        </div>
                    </div>
                </div>
                <div class="row g-4">
                    <%
                        List<Project> projectList = (List<Project>) request.getAttribute("projectList");
                        for(Project project : projectList){


                    %>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title"><%=project.getNom()%></h5>
                                <p class="card-text">A brief description of Project 1. This could include the technology used
                                    and the problem it solves.</p>
                            </div>
                            <div class="card-footer">
                                <div class="btn-group mr-2">
                                    <a class="btn btn-primary edit-btn" data-id="<%= project.getId() %>"
                                       data-nom="<%= project.getNom() %>"
                                       data-description="<%= project.getDescription() %>"
                                       data-date_de_debut="<%= project.getDate_de_debut() %>"
                                       data-date_de_fin="<%= project.getDate_de_fin() %>"
                                       data-budget="<%= project.getBudget() %>">
                                        <i class="fas fa-edit"></i> Edit
                                    </a>


                                </div>
                                <div class="btn-group mr-2">
                                    <a class="btn btn-primary mr-2" href="delete?id=<%= project.getId() %>" onclick="return confirm('Etes-vous sur de vouloir supprimer ce project ?');"><i class="fas fa-trash-alt"></i> Delete</a>

                                </div>
                            </div>
                        </div>
                    </div>
                    <%}%>

                </div>
            </div>
        </section>

        <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="editModalLabel">Edit Project</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="edit" method="post" id="editProject">
                            <input type="hidden" name="idpr" id="editProjectId">
                            <div class="mb-3">
                                <label for="editProjectName" class="form-label">Project Name</label>
                                <input type="text" name="nompr" class="form-control" id="editProjectName" required>
                            </div>
                            <div class="mb-3">
                                <label for="editProjectDescription" class="form-label">Description</label>
                                <textarea class="form-control" name="descriptionpr" id="editProjectDescription" rows="3" required></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="editStartDate" class="form-label">Start Date</label>
                                <input type="date" name="date_debutpr"  class="form-control" id="editStartDate" required>
                            </div>
                            <div class="mb-3">
                                <label for="editEndDate" class="form-label">End Date</label>
                                <input type="date"  name="date_finpr"  class="form-control" id="editEndDate" required>
                            </div>
                            <div class="mb-3">
                                <label for="editBudget" class="form-label">Budget</label>
                                <input type="number" name="budgetpr" class="form-control" id="editBudget" step="0.01" required>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary"
                                >Save changes</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </main>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Add New Project</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="AddProject" method="post">
                        <div class="mb-3">
                            <label for="projectName" class="form-label">Project Name</label>
                            <input type="text" name="nom" class="form-control" id="projectName" required>
                        </div>
                        <div class="mb-3">
                            <label for="projectDescription" class="form-label">Description</label>
                            <textarea class="form-control" name="description" id="projectDescription" rows="3" required></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="startDate" class="form-label">Start Date</label>
                            <input type="date" name="date_debut" class="form-control" id="startDate" required>
                        </div>
                        <div class="mb-3">
                            <label for="endDate" class="form-label">End Date</label>
                            <input type="date" name="date_fin" class="form-control" id="endDate" required>
                        </div>
                        <div class="mb-3">
                            <label for="budget" class="form-label">Budget</label>
                            <input type="number" name="budget" class="form-control" id="budget" step="100" required>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary" >Save changes</button>
                        </div>
                    </form>
                </div>


            </div>
        </div>
    </div>
    <footer>
        <hr>
        <div class="col-lg-12 text-center">
            <p>2025 © ConstructionXpert</p>
        </div>
    </footer>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Listen for clicks on edit buttons
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


            document.getElementById('saveEditButton').addEventListener('click', function () {
                const form = document.getElementById('editProjectForm');
                form.submit();
            });
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>

</html>
