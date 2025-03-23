<%@ page isErrorPage="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>404 - Page Non Trouvée | ConstructionXpert</title>
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
      color: #111827;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }
    .error-container {
      flex: 1;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      text-align: center;
      padding: 2rem;
    }
    .error-code {
      font-size: 8rem;
      font-weight: 700;
      color: #2563EB;
      line-height: 1;
      margin-bottom: 1rem;
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
    }
    .error-title {
      font-size: 2rem;
      font-weight: 600;
      margin-bottom: 1.5rem;
      color: #1F2937;
    }
    .error-message {
      font-size: 1.1rem;
      color: #6B7280;
      max-width: 600px;
      margin-bottom: 2rem;
    }
    .error-icon {
      font-size: 5rem;
      color: #F59E0B;
      margin-bottom: 2rem;
    }
    .btn-primary {
      background-color: #2563EB;
      border-color: #2563EB;
      padding: 0.75rem 1.5rem;
      font-weight: 500;
      border-radius: 0.375rem;
      transition: all 0.3s ease;
    }
    .btn-primary:hover {
      background-color: #1D4ED8;
      border-color: #1D4ED8;
      transform: translateY(-2px);
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    .construction-element {
      position: absolute;
      z-index: -1;
      opacity: 0.15;
    }
    .helmet {
      bottom: 10%;
      left: 15%;
      font-size: 4rem;
      color: #F59E0B;
      transform: rotate(-15deg);
    }
    .crane {
      top: 20%;
      right: 15%;
      font-size: 4rem;
      color: #2563EB;
      transform: rotate(15deg);
    }
    .tools {
      bottom: 30%;
      right: 25%;
      font-size: 3rem;
      color: #6B7280;
    }
    footer {
      text-align: center;
      padding: 1.5rem;
      background-color: #1F2937;
      color: rgba(255, 255, 255, 0.8);
    }
    @media (max-width: 768px) {
      .error-code {
        font-size: 5rem;
      }
      .error-title {
        font-size: 1.5rem;
      }
      .construction-element {
        display: none;
      }
    }
  </style>
</head>
<body>
<div class="error-container">
  <!-- Background Elements -->
  <div class="construction-element helmet">
    <i class="bi bi-hard-hat"></i>
  </div>
  <div class="construction-element crane">
    <i class="bi bi-buildings"></i>
  </div>
  <div class="construction-element tools">
    <i class="bi bi-tools"></i>
  </div>

  <!-- Error Content -->
  <div class="error-icon">
    <i class="bi bi-exclamation-triangle"></i>
  </div>
  <h1 class="error-code">404</h1>
  <h2 class="error-title">Page Non Trouvée</h2>
  <p class="error-message">
    Désolé, la page que vous recherchez n'existe pas ou a été déplacée.
    Veuillez vérifier l'URL ou utiliser l'un des liens ci-dessous pour continuer votre navigation.
  </p>
  <div class="d-flex gap-3">
    <a href="./" class="btn btn-primary">
      <i class="bi bi-house me-2"></i>Retour à l'accueil
    </a>
    <a href="javascript:history.back()" class="btn btn-outline-secondary">
      <i class="bi bi-arrow-left me-2"></i>Page précédente
    </a>
  </div>
</div>

<footer>
  &copy; <%= java.time.Year.now().getValue() %> ConstructionXpert. Tous droits réservés.
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>