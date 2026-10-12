
--apres l'enregistrement d'un client on peut l'inserer dans la base de données grace à la requete suivante:
insert into client values('000-000-000','client1','0000 rue X, ville X, ON, X0X 0X0, CANADA','1900-01-01','AA');

--on peut ajouter des employés dans un hotel grace a la requete suivante:
insert into employee values('000-000-001','employee1','0000 rue X, ville X, ON, X0X 0X0, CANADA','receptioniste','AA');

--On peut suprimer une chalbre, mais faut avant s'assurer qu'il n'y a aucune resrvation pour cette derniere avant de pouvoir executer la requete suivante:
delete from chambre where ID_chambre='CEHF';

--on peut faire une mise a jour a la table location si le client change la date d'arrivée grace a la requete suivante 
UPDATE location SET date_arrivee='1900-01-01' where ID_location='L0';