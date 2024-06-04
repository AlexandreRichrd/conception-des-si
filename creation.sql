DROP TABLE Coordonne CASCADE CONSTRAINTS;
DROP TABLE Reglage CASCADE CONSTRAINTS;
DROP TABLE Notification CASCADE CONSTRAINTS;
DROP TABLE Rappel CASCADE CONSTRAINTS;
DROP TABLE Evenement CASCADE CONSTRAINTS;
DROP TABLE Document CASCADE CONSTRAINTS;
DROP TABLE Document_note CASCADE CONSTRAINTS;
DROP TABLE Echeance CASCADE CONSTRAINTS;
DROP TABLE Document_evaluation CASCADE CONSTRAINTS;
DROP TABLE Soutenance CASCADE CONSTRAINTS;
DROP TABLE Entretien CASCADE CONSTRAINTS;
DROP TABLE Date_entretien CASCADE CONSTRAINTS;
DROP TABLE Type_document CASCADE CONSTRAINTS;
DROP TABLE Semestre CASCADE CONSTRAINTS;
DROP TABLE Statut_document CASCADE CONSTRAINTS;
DROP TABLE Statut_echeance CASCADE CONSTRAINTS;
DROP TABLE Statut_date_entretien CASCADE CONSTRAINTS;
DROP TABLE Tuteur_pedagogique CASCADE CONSTRAINTS;
DROP TABLE Apprenti CASCADE CONSTRAINTS;
DROP TABLE Maitre_apprentissage CASCADE CONSTRAINTS;
DROP TABLE Professeur CASCADE CONSTRAINTS;
DROP TABLE Responsable_cursus CASCADE CONSTRAINTS;
DROP TABLE Coordinateur_apprentissage CASCADE CONSTRAINTS;
DROP TABLE Admin CASCADE CONSTRAINTS;
DROP TABLE Jury CASCADE CONSTRAINTS;
DROP TABLE Equipe_tutorale CASCADE CONSTRAINTS;
DROP TABLE Pro_invite CASCADE CONSTRAINTS;
DROP TABLE Acteur CASCADE CONSTRAINTS;
DROP TABLE Centre_formation CASCADE CONSTRAINTS;
DROP TABLE Entreprise CASCADE CONSTRAINTS;
DROP TABLE Promo CASCADE CONSTRAINTS;

-- Create tables without foreign key constraints
CREATE TABLE Acteur (
    id_acteur NUMBER PRIMARY KEY,
    nom VARCHAR2(100),
    prenom VARCHAR2(100),
    date_naissance DATE,
    genre VARCHAR2(10),
    mail VARCHAR2(100),
    password VARCHAR2(100),
    telephone VARCHAR2(15),
    actif NUMBER(1)
);

CREATE TABLE Tuteur_pedagogique (
    id_tuteur NUMBER PRIMARY KEY,
    acteur_key NUMBER
);

CREATE TABLE Apprenti (
    id_apprenti NUMBER PRIMARY KEY,
    acteur_key NUMBER,
    entreprise_actuelle_key NUMBER,
    spécialité VARCHAR2(100)
);

CREATE TABLE Maitre_apprentissage (
    id_maitre NUMBER PRIMARY KEY,
    acteur_key NUMBER,
    entreprise_actuelle_key NUMBER,
    poste VARCHAR2(100)
);

CREATE TABLE Professeur (
    id_prof NUMBER PRIMARY KEY,
    acteur_key NUMBER,
    centre_formation_key NUMBER,
    specialite VARCHAR2(100),
    isEnseignantChercheur NUMBER(1),
    date_debut DATE,
    date_fin DATE
);

CREATE TABLE Responsable_cursus (
    id_responsable NUMBER PRIMARY KEY,
    acteur_key NUMBER,
    centre_formation_key NUMBER,
    date_debut DATE,
    date_fin DATE
);

CREATE TABLE Coordinateur_apprentissage (
    id_coordinateur NUMBER PRIMARY KEY,
    acteur_key NUMBER,
    centre_formation_key NUMBER,
    date_debut DATE,
    date_fin DATE
);

CREATE TABLE Admin (
    id_admin NUMBER PRIMARY KEY,
    acteur_key NUMBER
);

CREATE TABLE Jury (
    id_jury NUMBER PRIMARY KEY,
    president_key NUMBER
);

CREATE TABLE Coordonne (
    promo_key NUMBER,
    coordinateur_apprentissage_key NUMBER,
    PRIMARY KEY (promo_key, coordinateur_apprentissage_key)
);

CREATE TABLE Centre_formation (
    id_centre_formation NUMBER PRIMARY KEY,
    nom VARCHAR2(100),
    adresse VARCHAR2(200),
    ville VARCHAR2(100),
    pays VARCHAR2(100),
    annee_fondation NUMBER,
    nombre_etudiant NUMBER,
    description VARCHAR2(500),
    domaine VARCHAR2(100)
);

CREATE TABLE Entreprise (
    id_entreprise NUMBER PRIMARY KEY,
    nom VARCHAR2(100),
    adresse VARCHAR2(200),
    ville VARCHAR2(100),
    pays VARCHAR2(100),
    annee_collaboration NUMBER,
    domaine VARCHAR2(100),
    description VARCHAR2(500),
    nombre_apprenti NUMBER
);

CREATE TABLE Promo (
    id_promo NUMBER PRIMARY KEY,
    nom VARCHAR2(100),
    nombre_apprenti NUMBER,
    date_debut DATE,
    date_fin DATE
);

CREATE TABLE Equipe_tutorale (
    id_equipe_tutorale NUMBER PRIMARY KEY,
    apprenti_key NUMBER,
    maitre_apprentissage_key NUMBER,
    tuteur_key NUMBER,
    date_debut DATE,
    date_fin DATE
);

CREATE TABLE Pro_invite (
    id_pro_invite NUMBER PRIMARY KEY,
    entreprise_key NUMBER,
    nombre_jury NUMBER
);

CREATE TABLE Notification (
    id_notification NUMBER PRIMARY KEY,
    acteur_key NUMBER,
    type VARCHAR2(100),
    isActive NUMBER(1),
    notification_date DATE
);

CREATE TABLE Reglage (
    id_reglagle NUMBER PRIMARY KEY,
    is_notification_active NUMBER(1),
    is_rappel_active NUMBER(1),
    acteur_key NUMBER
);

CREATE TABLE Rappel (
    id_rappel NUMBER PRIMARY KEY,
    nom VARCHAR2(100),
    delay NUMBER
);

CREATE TABLE Evenement (
    id_evenement NUMBER PRIMARY KEY,
    nom VARCHAR2(100),
    start_date DATE,
    end_date DATE,
    type VARCHAR2(100)
);

CREATE TABLE Document (
    id_document NUMBER PRIMARY KEY,
    nom VARCHAR2(100),
    type VARCHAR2(100),
    Semestre VARCHAR2(10),
    Statut VARCHAR2(20)
);

CREATE TABLE Document_note (
    id_document_note NUMBER PRIMARY KEY,
    note NUMBER,
    commentaire VARCHAR2(500)
);

CREATE TABLE Echeance (
    id_echeance NUMBER PRIMARY KEY,
    nom VARCHAR2(100),
    Semestre VARCHAR2(10),
    date_echeance DATE,
    Statut_echeance VARCHAR2(20)
);

CREATE TABLE Document_evaluation (
    id_document_eval NUMBER PRIMARY KEY,
    nom VARCHAR2(100),
    note NUMBER,
    commentaire VARCHAR2(500)
);

CREATE TABLE Soutenance (
    id_soutenance NUMBER PRIMARY KEY,
    jury_key NUMBER,
    soutenance_date DATE,
    soutenance_heure VARCHAR2(8)
);

CREATE TABLE Entretien (
    id_entretien NUMBER PRIMARY KEY,
    date_entretien_key NUMBER,
    Semestre VARCHAR2(10)
);

CREATE TABLE Date_entretien (
    id_date_entretien NUMBER PRIMARY KEY,
    entretien_date DATE,
    accept_MA NUMBER(1),
    accept_tuteur NUMBER(1),
    accept_apprenti NUMBER(1),
    Statut_date_entretien VARCHAR2(20)
);

-- Enums are typically implemented as lookup tables in SQL databases

CREATE TABLE Type_document (
    type_document VARCHAR2(100) PRIMARY KEY
);

INSERT INTO Type_document (type_document) VALUES ('fiche de synthèse');
INSERT INTO Type_document (type_document) VALUES ('Rapport');
INSERT INTO Type_document (type_document) VALUES ('note_de_periode');

CREATE TABLE Semestre (
    semestre VARCHAR2(10) PRIMARY KEY
);

INSERT INTO Semestre (semestre) VALUES ('S5');
INSERT INTO Semestre (semestre) VALUES ('S6');
INSERT INTO Semestre (semestre) VALUES ('S7');
INSERT INTO Semestre (semestre) VALUES ('S8');
INSERT INTO Semestre (semestre) VALUES ('S9');
INSERT INTO Semestre (semestre) VALUES ('S10');

CREATE TABLE Statut_document (
    statut_document VARCHAR2(20) PRIMARY KEY
);

INSERT INTO Statut_document (statut_document) VALUES ('Déposé');
INSERT INTO Statut_document (statut_document) VALUES ('Brouillon');
INSERT INTO Statut_document (statut_document) VALUES ('Validé');
INSERT INTO Statut_document (statut_document) VALUES ('Refusé');

CREATE TABLE Statut_echeance (
    statut_echeance VARCHAR2(20) PRIMARY KEY
);

INSERT INTO Statut_echeance (statut_echeance) VALUES ('En_attente');
INSERT INTO Statut_echeance (statut_echeance) VALUES ('Déposé');
INSERT INTO Statut_echeance (statut_echeance) VALUES ('Validé');
INSERT INTO Statut_echeance (statut_echeance) VALUES ('Refusé');
INSERT INTO Statut_echeance (statut_echeance) VALUES ('En_Retard');

CREATE TABLE Statut_date_entretien (
    statut_date_entretien VARCHAR2(20) PRIMARY KEY
);

INSERT INTO Statut_date_entretien (statut_date_entretien) VALUES ('En_attente');
INSERT INTO Statut_date_entretien (statut_date_entretien) VALUES ('Refusé');
INSERT INTO Statut_date_entretien (statut_date_entretien) VALUES ('Validé');

-- Add foreign key constraints
ALTER TABLE Tuteur_pedagogique ADD CONSTRAINT fk_acteur_key FOREIGN KEY (acteur_key) REFERENCES Acteur(id_acteur);

ALTER TABLE Apprenti ADD CONSTRAINT fk_apprenti_acteur FOREIGN KEY (acteur_key) REFERENCES Acteur(id_acteur);
ALTER TABLE Apprenti ADD CONSTRAINT fk_apprenti_entreprise FOREIGN KEY (entreprise_actuelle_key) REFERENCES Entreprise(id_entreprise);

ALTER TABLE Maitre_apprentissage ADD CONSTRAINT fk_maitre_acteur FOREIGN KEY (acteur_key) REFERENCES Acteur(id_acteur);
ALTER TABLE Maitre_apprentissage ADD CONSTRAINT fk_maitre_entreprise FOREIGN KEY (entreprise_actuelle_key) REFERENCES Entreprise(id_entreprise);

ALTER TABLE Professeur ADD CONSTRAINT fk_prof_acteur FOREIGN KEY (acteur_key) REFERENCES Acteur(id_acteur);
ALTER TABLE Professeur ADD CONSTRAINT fk_prof_centre FOREIGN KEY (centre_formation_key) REFERENCES Centre_formation(id_centre_formation);

ALTER TABLE Responsable_cursus ADD CONSTRAINT fk_resp_acteur FOREIGN KEY (acteur_key) REFERENCES Acteur(id_acteur);
ALTER TABLE Responsable_cursus ADD CONSTRAINT fk_resp_centre FOREIGN KEY (centre_formation_key) REFERENCES Centre_formation(id_centre_formation);

ALTER TABLE Coordinateur_apprentissage ADD CONSTRAINT fk_coord_acteur FOREIGN KEY (acteur_key) REFERENCES Acteur(id_acteur);
ALTER TABLE Coordinateur_apprentissage ADD CONSTRAINT fk_coord_centre FOREIGN KEY (centre_formation_key) REFERENCES Centre_formation(id_centre_formation);

ALTER TABLE Admin ADD CONSTRAINT fk_admin_acteur FOREIGN KEY (acteur_key) REFERENCES Acteur(id_acteur);

ALTER TABLE Jury ADD CONSTRAINT fk_jury_president FOREIGN KEY (president_key) REFERENCES Professeur(id_prof);

ALTER TABLE Notification ADD CONSTRAINT fk_notification_acteur FOREIGN KEY (acteur_key) REFERENCES Acteur(id_acteur);

ALTER TABLE Coordonne ADD CONSTRAINT fk_coordonne_promo FOREIGN KEY (promo_key) REFERENCES Promo(id_promo);
ALTER TABLE Coordonne ADD CONSTRAINT fk_coordonne_coord FOREIGN KEY (coordinateur_apprentissage_key) REFERENCES Coordinateur_apprentissage(id_coordinateur);

ALTER TABLE Equipe_tutorale ADD CONSTRAINT fk_equipe_apprenti FOREIGN KEY (apprenti_key) REFERENCES Apprenti(id_apprenti);
ALTER TABLE Equipe_tutorale ADD CONSTRAINT fk_equipe_maitre FOREIGN KEY (maitre_apprentissage_key) REFERENCES Maitre_apprentissage(id_maitre);
ALTER TABLE Equipe_tutorale ADD CONSTRAINT fk_equipe_tuteur FOREIGN KEY (tuteur_key) REFERENCES Tuteur_pedagogique(id_tuteur);

ALTER TABLE Pro_invite ADD CONSTRAINT fk_pro_entreprise FOREIGN KEY (entreprise_key) REFERENCES Entreprise(id_entreprise);

ALTER TABLE Reglage ADD CONSTRAINT fk_reglage_acteur FOREIGN KEY (acteur_key) REFERENCES Acteur(id_acteur);

ALTER TABLE Soutenance ADD CONSTRAINT fk_soutenance_jury FOREIGN KEY (jury_key) REFERENCES Jury(id_jury);

ALTER TABLE Entretien ADD CONSTRAINT fk_entretien_date FOREIGN KEY (date_entretien_key) REFERENCES Date_entretien(id_date_entretien);



CREATE SEQUENCE seq_notification
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE OR REPLACE TRIGGER trg_alert_echeance_proche
BEFORE UPDATE ON Echeance
FOR EACH ROW
DECLARE
  v_days_remaining NUMBER;
BEGIN
  -- Calculer le nombre de jours restants avant l'échéance
  SELECT (:NEW.date_echeance - SYSDATE) INTO v_days_remaining FROM DUAL;
  
  -- Si l'échéance est dans moins de 3 jours
  IF v_days_remaining <= 3 THEN
    INSERT INTO Notification (id_notification, type, isActive, notification_date)
    VALUES (seq_notification.NEXTVAL, 'Rappel: Echéance Approche', 1, SYSDATE);
  END IF;
END;
/

CREATE VIEW v_apprentis_entreprises AS
SELECT 
    a.id_apprenti,
    ac.nom AS nom_apprenti,
    ac.prenom AS prenom_apprenti,
    e.nom AS entreprise_actuelle,
    a.spécialité
FROM Apprenti a
JOIN Acteur ac ON a.acteur_key = ac.id_acteur
JOIN Entreprise e ON a.entreprise_actuelle_key = e.id_entreprise;

CREATE VIEW v_professeurs_centres AS
SELECT 
    p.id_prof,
    ac.nom AS nom_professeur,
    ac.prenom AS prenom_professeur,
    cf.nom AS centre_formation,
    p.specialite,
    p.isEnseignantChercheur,
    p.date_debut,
    p.date_fin
FROM Professeur p
JOIN Acteur ac ON p.acteur_key = ac.id_acteur
JOIN Centre_formation cf ON p.centre_formation_key = cf.id_centre_formation;

CREATE VIEW v_echeances_statuts AS
SELECT 
    e.id_echeance,
    e.nom,
    e.date_echeance,
    s.statut_echeance
FROM Echeance e
JOIN Statut_echeance s ON e.Statut_echeance = s.statut_echeance;

CREATE OR REPLACE PROCEDURE update_document_status (
    p_id_document NUMBER,
    p_new_status VARCHAR2
) AS
BEGIN
    UPDATE Document
    SET statut = p_new_status
    WHERE id_document = p_id_document;
END;

CREATE OR REPLACE PROCEDURE notify_promo_alternants (
    p_id_promo NUMBER,
    p_notification_type VARCHAR2,
    p_message VARCHAR2
) AS
BEGIN
    FOR apprenant IN (SELECT a.id_apprenti, a.acteur_key
                      FROM Apprenti a
                      JOIN Promo p ON a.id_apprenti = p.id_promo
                      WHERE p.id_promo = p_id_promo) LOOP
        INSERT INTO Notification (id_notification, acteur_key, type, isActive, notification_date)
        VALUES (seq_notification.NEXTVAL, apprenant.acteur_key, p_notification_type, 1, SYSDATE);
    END LOOP;
END;


CREATE OR REPLACE PROCEDURE list_pending_documents IS
    CURSOR c_pending_documents IS
        SELECT id_document, nom, type, semestre
        FROM Document
        WHERE statut = 'En_attente';
BEGIN
    FOR doc IN c_pending_documents LOOP
        DBMS_OUTPUT.PUT_LINE('Document ID: ' || doc.id_document || ' Nom: ' || doc.nom || ' Type: ' || doc.type || ' Semestre: ' || doc.semestre);
    END LOOP;
END;

CREATE OR REPLACE PROCEDURE list_overdue_echeances IS
    CURSOR c_overdue_echeances IS
        SELECT id_echeance, nom, semestre, date_echeance
        FROM Echeance
        WHERE date_echeance < SYSDATE AND Statut_echeance = 'En_Retard';
BEGIN
    FOR ech IN c_overdue_echeances LOOP
        DBMS_OUTPUT.PUT_LINE('Echeance ID: ' || ech.id_echeance || ' Nom: ' || ech.nom || ' Semestre: ' || ech.semestre || ' Date: ' || ech.date_echeance);
    END LOOP;
END;
