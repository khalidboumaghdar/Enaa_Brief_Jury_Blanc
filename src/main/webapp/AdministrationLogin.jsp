<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConstructionXpert - Connexion</title>
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
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-container {
            width: 100%;
            max-width: 400px;
            padding: 40px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .login-header img {
            height: 50px;
            margin-bottom: 15px;
        }
        .login-header h1 {
            font-size: 24px;
            font-weight: 600;
            color: #111827;
            margin-bottom: 10px;
        }
        .login-header p {
            color: #6B7280;
            font-size: 14px;
        }
        .login-form .form-group {
            margin-bottom: 20px;
        }
        .login-form label {
            display: block;
            margin-bottom: 5px;
            font-size: 14px;
            font-weight: 500;
            color: #374151;
        }
        .login-form .input-wrapper {
            position: relative;
        }
        .login-form .input-wrapper i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #9CA3AF;
        }
        .login-form input {
            width: 100%;
            padding: 12px 15px 12px 45px;
            border: 1px solid #D1D5DB;
            border-radius: 6px;
            font-size: 14px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }
        .login-form input:focus {
            outline: none;
            border-color: #2563EB;
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
        }
        .login-form .forgot-password {
            display: block;
            text-align: right;
            font-size: 13px;
            color: #2563EB;
            text-decoration: none;
            margin-top: 5px;
            margin-bottom: 20px;
        }
        .login-form .forgot-password:hover {
            text-decoration: underline;
        }
        .login-form .remember-me {
            display: flex;
            align-items: center;
            font-size: 14px;
            color: #374151;
            margin-bottom: 20px;
        }
        .login-form .remember-me input {
            width: auto;
            margin-right: 10px;
            padding: 0;
        }
        .login-form button {
            width: 100%;
            padding: 12px;
            background-color: #2563EB;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .login-form button:hover {
            background-color: #1E40AF;
        }
        .login-footer {
            text-align: center;
            margin-top: 30px;
            font-size: 14px;
            color: #6B7280;
        }
        .login-footer a {
            color: #2563EB;
            text-decoration: none;
        }
        .login-footer a:hover {
            text-decoration: underline;
        }
        /* Responsive */
        @media (max-width: 576px) {
            .login-container {
                max-width: 90%;
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
<div class="login-container">
    <div class="login-header">
        <img src="assets/images/logosport.png" alt="ConstructionXpert Logo">
        <h1>Connexion à votre compte</h1>
        <p>Entrez vos identifiants pour accéder au tableau de bord</p>
    </div>

    <form class="login-form" action="LoginServlet" method="post">
        <% if (request.getAttribute("error") != null) { %>
        <p style="color:red;"><%= request.getAttribute("error") %></p>
        <% } %>
        <div class="form-group">
            <label for="email">Email</label>
            <div class="input-wrapper">
                <i class="bi bi-envelope"></i>
                <input type="email" id="email" name="email" placeholder="Votre adresse email" required>
            </div>
        </div>

        <div class="form-group">
            <label for="password">Mot de passe</label>
            <div class="input-wrapper">
                <i class="bi bi-lock"></i>
                <input type="password" id="password" name="password" placeholder="Votre mot de passe" required>
            </div>
        </div>



        <button type="submit">Se connecter</button>
    </form>


</div>
</body>
</html>
