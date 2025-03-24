# ConstructionXpert Services : Application de Gestion de Projets de Construction

## Description

**ConstructionXpert Services** est une application web conçue pour faciliter la gestion des projets de construction. Elle permet aux équipes de construction de créer et gérer des projets, d'assigner des tâches aux membres de l'équipe, de gérer les ressources nécessaires et de suivre les détails des projets et des tâches. L'application offre une interface conviviale permettant de visualiser, mettre à jour et supprimer des projets. Chaque projet peut comporter plusieurs tâches, et chaque tâche est assignée à des ressources spécifiques.

### Fonctionnalités principales :
- **Gestion des Projets** :
  - Créer, afficher, mettre à jour et supprimer des projets de construction.
  - Suivre les détails du projet tels que le nom, la description, la date de début, la date de fin et le budget.
  
- **Gestion des Tâches** :
  - Créer, afficher, mettre à jour et supprimer des tâches pour chaque projet.
  - Gérer les détails des tâches, y compris la description, la date de début, la date de fin et les ressources nécessaires.
  
- **Gestion des Ressources** :
  - Ajouter, afficher, mettre à jour et supprimer des ressources.
  - Suivre les détails des ressources, telles que le nom, le type, la quantité et les informations du fournisseur.
  - Mettre à jour la quantité de ressources après chaque assignation à une tâche.
  
- **Authentification** :
  - Fonctionnalité de connexion/déconnexion pour les administrateurs.
  - Protéger les pages afin que l'accès ne soit accordé qu'après la connexion de l'administrateur.

- **Gestion des Fournisseurs** :
  - L'administrateur peut gérer les fournisseurs associés aux ressources.

## Technologies utilisées

- **Langage de Programmation** : Java
- **Framework Web** : Java EE (Servlets, JSP)
- **Base de Données** : MySQL/PostgreSQL
- **JDBC API** : Pour la communication entre l'application Java et la base de données.
- **Serveur d'application** : Apache Tomcat
- **Front-End** : HTML, CSS (Bootstrap/Tailwind), JavaScript
- **Outils de Design UI** : Figma/Adobe XD
- **Gestion de version** : Git

## Diagrammes UML

Les diagrammes UML suivants illustrent la structure et le flux de l'application :

### 1. **Diagramme de Classes**  
<img width="599" alt="image" src="https://github.com/user-attachments/assets/f6fe1bd7-06af-49d9-b899-9a88a5006336" />

### 2. **Diagramme de Cas d'Utilisation**  
<img width="528" alt="image" src="https://github.com/user-attachments/assets/e2b7704c-af59-44eb-b3f8-d63633dc53f5" />

### 3. **Diagramme de Séquence**  
<img width="504" alt="image" src="https://github.com/user-attachments/assets/5d881ea4-8142-4c07-9074-49357f946879" />

## Structure du projet

Ce projet suit l'architecture **Model-View-Controller (MVC)** et le modèle **Data Access Object (DAO)** pour une meilleure séparation des préoccupations. La structure du projet est organisée comme suit :
src/ ├── com/ │ └── constructionxpert/ │ ├── controller/ │ ├── dao/ │ ├── model/ │ ├── service/ │ ├── view/ │ └── util/ └── webapp/ ├── WEB-INF/ └── resources/ ├── css/ ├── js/ └── images/

## Installation

Pour démarrer avec le projet, suivez ces étapes :

1. Clonez le repository :
   ```bash
   git clone https://github.com/khalidboumaghdar/Enaa_Brief_Jury_Blanc.git


