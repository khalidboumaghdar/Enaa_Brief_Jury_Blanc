<!doctype html>
<html lang="en">
    <head>
        <title>ConstructionXpert</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

        <!-- CSS Files -->
        <style><%@include file="assets/css/style.css"%></style>
        <style><%@include file="assets/css/test.css"%></style>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />

        <style>
            body {
    background-color: #ffffff; /* Fond blanc */
    color: #000000; /* Texte noir */
}

.card-counter {
    background-color: #000000; /* Fond noir */
    color: #ffffff; /* Texte blanc */
    border: 2px solid #ffffff; /* Bordure blanche */
}

.card-counter i {
    color: #ffffff; /* Icônes en blanc */
}



            .navbar {
                background: linear-gradient(45deg, #fff, #007bff);
                box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.3);
               
                padding: 10px 20px;
                transform-style: preserve-3d;
                transition: all 0.3s ease-in-out;
            }

            .navbar:hover {
                transform: translateY(-3px) scale(1.02);
                box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.4);
            }

            .navbar-brand img {
                width: 120px;
                transition: transform 0.3s ease-in-out;
            }

            .navbar-brand img:hover {
                transform: rotateY(360deg) scale(1.1);
            }

            .navbar-nav .nav-link {
                font-weight: bold;
                color: white !important;
                position: relative;
                transition: color 0.3s ease-in-out;
            }

            .navbar-nav .nav-link::before {
                content: "";
                position: absolute;
                width: 100%;
                height: 3px;
                bottom: 0;
                left: 0;
                background: white;
                transform: scaleX(0);
                transition: transform 0.3s ease-in-out;
            }

            .navbar-nav .nav-link:hover::before {
                transform: scaleX(1);
            }

            /* CARD DESIGN */
            .card-counter {
                box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.2);
                padding: 20px;
                border-radius: 10px;
                text-align: center;
                color: white;
                perspective: 1000px;
                transform-style: preserve-3d;
                transition: transform 0.3s ease-in-out;
            }

            .primary { background: #007bff; }
            .danger { background: #dc3545; }
            .success { background: #28a745; }
            .info { background: #17a2b8; }

            .card-counter:hover {
                transform: rotateY(10deg) rotateX(10deg) scale(1.1);
            }

            .count-numbers {
                font-size: 2rem;
                font-weight: bold;
            }
            .count-name {
                font-size: 1.2rem;
            }
            .last-project {
            background: linear-gradient(135deg, #007bff 0%, #00c6ff 100%);
            color: white;
            padding: 50px 0;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            text-align: center;
        }

        .section-title {
            font-size: 2.5rem;
            font-weight: bold;
            position: relative;
            display: inline-block;
        }

        .section-title::after {
            content: '';
            display: block;
            width: 60px;
            height: 4px;
            background: white;
            margin: 5px auto;
        }

        .project-image-wrapper {
            position: relative;
            max-width: 100%;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
            transition: transform 0.3s ease-in-out;
        }

        .project-image-wrapper:hover {
            transform: scale(1.05);
        }

        .project-image {
            width: 100%;
            height: auto;
            border-radius: 10px;
        }
        </style>
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

        <main>
            <section>
                <div class="container pt-5">
                    <div class="row g-4">
                        <div class="col-md-3">
                            <div class="card-counter primary">
                                <i class="fa fa-code-fork fa-2x"></i>
                                <span class="count-numbers">12</span>
                                <span class="count-name">Flowz</span>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card-counter danger">
                                <i class="fa fa-ticket fa-2x"></i>
                                <span class="count-numbers">599</span>
                                <span class="count-name">Instances</span>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card-counter success">
                                <i class="fa fa-database fa-2x"></i>
                                <span class="count-numbers">6875</span>
                                <span class="count-name">Data</span>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card-counter info">
                                <i class="fa fa-users fa-2x"></i>
                                <span class="count-numbers">35</span>
                                <span class="count-name">Users</span>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="">
                <div class="container py-5">
                    <div class="row align-items-center">
                        <div class="col-lg-6 text-center text-lg-start">
                            <h3 class="section-title"> Dernier Projet</h3>
                            <p class="text-muted">
                                Découvrez notre dernier projet innovant, conçu avec les dernières technologies pour une performance optimale.
                            </p>
                            <a href="#" class="btn btn-light btn-lg mt-3">Voir le projet</a>
                        </div>
                        <div class="col-lg-6 text-center">
                            <div class="project-image-wrapper">
                                <img src="assets/images/lastproject.png" alt="Dernier projet" class="project-image">
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <footer>
            <hr>
            <div class="col-lg-12 text-center">
                <p>2025 © ConstructionXpert</p>
            </div>
        </footer>

        <!-- JS Files -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
    </body>
</html>
