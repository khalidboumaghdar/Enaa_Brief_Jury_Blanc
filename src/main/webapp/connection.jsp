<!doctype html>
<html lang="en">
    <head>
        <title>ConstructionXpert-Connection</title>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
        />

        <style><%@include file="assets/css/style.css"%></style>
        <style><%@include file="assets/css/test.css"%></style>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous"
        />
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
                        <li class="nav-item pl-5"><a class="btn btn-light text-primary" href="connection.html">Connexion</a></li>
                    </ul>
                </div>
            </div>
        </nav>
            
            
        </header>
        <main>
            <section class="vh-30 pt-5" style="background-color: #6255E2;">
                <div class="container py-5 h-100">
                  <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-xl-10">
                      <div class="card" style="border-radius: 1rem;">
                        <div class="row g-0">
                          <div class="col-md-6 col-lg-5 d-none d-md-block">
                            <img src="assets/images/logistics.png" alt="">
                          </div>
                          <div class="col-md-6 col-lg-7 d-flex align-items-center">
                            <div class="card-body p-4 p-lg-5 text-black">
              
                              <form>
              
                                <div class="d-flex align-items-center mb-3 pb-1">
                                  <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                                </div>
              
                                <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Connectez-vous à votre compte                                </h5>
              
                                <div data-mdb-input-init class="form-outline mb-4">
                                  <input type="email" id="form2Example17" class="form-control form-control-lg" />
                                  <label class="form-label" for="form2Example17">Adresse e-mail</label>
                                </div>
              
                                <div data-mdb-input-init class="form-outline mb-4">
                                  <input type="password" id="form2Example27" class="form-control form-control-lg" />
                                  <label class="form-label" for="form2Example27">Mot de passe</label>
                                </div>
              
                                <div class="pt-1 mb-4">
                                  <button data-mdb-button-init data-mdb-ripple-init class="btn btn-dark btn-lg btn-block" type="button">Connexion</button>
                                </div>
                                <p class="mb-5 pb-lg-2" style="color: #393f81;">Vous n'avez pas de compte? <a href="S'inscrire.jsp"
                                    style="color: #393f81;">Inscrivez-vous ici</a></p>
                              </form>
              
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </section>

        </main>
        <footer>
            <hr>
            <div class="col-lg-12 text-center">
                <p>2025 ©Le développement de khalid boumaghdar</p>
            </div>
        </footer>
        <script>
            var video = document.getElementById("myVideo");
            var btn = document.getElementById("myBtn");
            
            function myFunction() {
              if (video.paused) {
                video.play();
                btn.innerHTML = "Pause";
              } else {
                video.pause();
                btn.innerHTML = "Play";
              }
            }
            </script>
                                        <script src="https://unpkg.com/@dotlottie/player-component@2.7.12/dist/dotlottie-player.mjs" type="module"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"
        ></script>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
            integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
