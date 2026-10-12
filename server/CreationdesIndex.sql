
--index 1: on veut s'assurer qu'une chambre est disponible donc il faut un index dans table chambre:
create index index_table_chambre on chambre(ID_chambre,disponibilite);


--index 2: on vent savoir la date de depart d'un reservation:
create index index_table_reservation on reservation(ID_reservation,date_depart);

-- index 3: on veut acceder à l'id de l hotel, ou une reservation ou loction a été effectuée, dans archive:
create index index_table_archive on archive(ID_archive,ID_hotel);