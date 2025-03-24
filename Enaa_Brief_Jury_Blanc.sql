create database db_ConstructionXpert;
use db_ConstructionXpert;
drop database db_ConstructionXpert;
create table project(
id int auto_increment primary key,
nom varchar(200),
description Text,
date_de_debut date,
date_de_fin date,
budget float
);

CREATE TABLE Taches (
    id INT PRIMARY KEY AUTO_INCREMENT,
    projet_id INT NOT NULL,
    description TEXT NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL,
    FOREIGN KEY (projet_id) REFERENCES project(id) ON DELETE CASCADE
);
CREATE TABLE ressources (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    type VARCHAR(100) NOT NULL,
    quantite INT NOT NULL,
    fournisseur VARCHAR(255) NOT NULL
);

select * from Project;
select * from ressources;
select * from Taches;
select * from tache_ressources;
SELECT * FROM project ORDER BY id DESC LIMIT 1;


SELECT 
    tache_ressources.tache_id AS id_tache_ressource,
    Taches.id AS id_tache,
    Taches.nom AS nom_tache,
    ressources.id AS id_ressource,
    ressources.nom AS nom_ressource,
    tache_ressources.quantite_utilisee
FROM 
    tache_ressources
INNER JOIN Taches ON tache_ressources.tache_id = Taches.id
INNER JOIN ressources ON tache_ressources.ressource_id = ressources.id;





CREATE TABLE tache_ressources (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tache_id INT NOT NULL,
    ressource_id INT NOT NULL,
    quantite_utilisee INT NOT NULL,
    FOREIGN KEY (tache_id) REFERENCES Taches(id) ON DELETE CASCADE,
    FOREIGN KEY (ressource_id) REFERENCES ressources(id) ON DELETE CASCADE
);

INSERT INTO Project (id, nom, description, date_de_debut, date_de_fin, budget) 
VALUES (1, 'test', 'test', '2025-01-12', '2025-01-15', 12.4);

UPDATE project
SET 
    nom = "project5", 
    description = "project5", 
    date_de_debut = '2025-01-12', 
    date_de_fin = '2025-01-15', 
    budget = 23.6
WHERE id = 2;


UPDATE tache_ressources tr
INNER JOIN ressources r ON tr.ressource_id = r.id
SET tr.quantite_utilisee = tr.quantite_utilisee - r.quantite;



SELECT 
  * FROM 
    tache_ressources
INNER JOIN Taches ON tache_ressources.tache_id = Taches.id
INNER JOIN ressources ON tache_ressources.ressource_id = ressources.id;


CREATE TABLE administrateur (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

select * from administrateur;
INSERT INTO administrateur (nom, prenom, email, mot_de_passe) 
VALUES ('Boumaghdar', 'Khalid', 'khalid@gmail.com', 'khalid2002');

