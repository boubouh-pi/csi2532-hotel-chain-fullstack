create DATABASE chaine_hotel;
create table chaine_hoteliere(
	ID_ch VARCHAR(20) NOT NULL,
	adresee_ch VARCHAR(255) NOT NULL,
	Nombre_hotel int NOT NULL,
	Email VARCHAR(100) NOT NULL,
	Telephone VARCHAR(20) NOT NULL,
	PRIMARY KEY (ID_ch)
);

create table hotel(
	ID_hotel VARCHAR(20) NOT NULL,
	gamme int NOT NULL,
	Nmbr_chambre int NOT NULL,
	zone int NOT NULL,
	Numero_tel VARCHAR(20) NOT NULL,
	Courriel VARCHAR(100) NOT NULL,
	ID_ch VARCHAR(20) NOT NULL,
	PRIMARY KEY (ID_hotel),
	FOREIGN KEY (ID_ch) references chaine_hoteliere(ID_ch)
);

create table client(
	NAS_client VARCHAR(20) NOT NULL,
	nom VARCHAR(20) NOT NULL,
	adresse VARCHAR(255) NOT NULL,
	date_enregistrement DATE check(date_enregistrement <= CURRENT_DATE),
	ID_hotel VARCHAR(20) NOT NULL,
	PRIMARY KEY (NAS_client),
	FOREIGN KEY (ID_hotel) references hotel(ID_hotel)
);

create table employee(
	NAS_employee VARCHAR(20) NOT NULL,
	nom VARCHAR(20) NOT NULL,
	adresse VARCHAR(255) NOT NULL,
	poste VARCHAR(20),
	ID_hotel VARCHAR(20) NOT NULL,
	PRIMARY KEY (NAS_employee),
	FOREIGN KEY (ID_hotel) references hotel(ID_hotel)
);

create table Gestionnaire(
	NAS_employee VARCHAR(20) NOT NULL,
	nom VARCHAR(20) NOT NULL,
	adresse VARCHAR(255) NOT NULL,
	poste VARCHAR(20) constraint post_const check(poste='gestionnaire'),
	ID_hotel VARCHAR(20) NOT NULL,
	PRIMARY KEY (NAS_employee),
	FOREIGN KEY (ID_hotel) references hotel(ID_hotel)
);

create table chambre(
	ID_chambre VARCHAR(20) NOT NULL,
	prix VARCHAR(20) NOT NULL,
	commodite VARCHAR(255) NOT NULL,
	capacite int NOT NULL,
	vue VARCHAR(255) NOT NULL,
	etandable int check(etandable in(0,1)),
	dommage VARCHAR(255) NOT NULL,
	disponibilite int check(disponibilite in(0,1)),
	ID_hotel VARCHAR(20) NOT NULL,
	PRIMARY KEY(ID_chambre),
	FOREIGN KEY(ID_hotel) references hotel(ID_hotel)
);

create table reservation(
	ID_reservation VARCHAR(20) NOT NULL,
	date_reservation date check(date_reservation<= CURRENT_DATE),
	date_arrivee date check(date_arrivee >= '1900-01-01'),
	date_depart date check(date_depart >= '1900-01-01'),
	num_chambre int check(num_chambre>=1),
	date_limite_enregistrement date check(date_limite_enregistrement<= CURRENT_DATE),
	NAS_client VARCHAR(20) NOT NULL,
	ID_chambre VARCHAR(20) NOT NULL,
	PRIMARY KEY(ID_reservation),
	FOREIGN KEY(NAS_client) references client(NAS_client),
	FOREIGN KEY(ID_chambre) references chambre(ID_chambre)
);

create table ch_re(
	ID_chambre VARCHAR(20) NOT NULL,
	ID_reservation VARCHAR(20) NOT NULL,
	FOREIGN KEY(ID_chambre) references chambre(ID_chambre),
	FOREIGN KEY(ID_reservation) references reservation(ID_reservation),
	PRIMARY KEY(ID_chambre,ID_reservation)
);

create table archive(
	ID_archive VARCHAR(30) NOT NULL,
	date_reservation date check(date_reservation >= '1900-01-01'),
	date_depart date check(date_depart >= '1900-01-01'),
	date_arrivee date check(date_depart >= '1900-01-01'),
	ID_hotel VARCHAR(20) NOT NULL,
	PRIMARY KEY(ID_archive),
	FOREIGN KEY(ID_hotel) references hotel(ID_hotel)
);

create table reservation_sans_enregistrement(
	ID_reservation VARCHAR(30) NOT NULL CHECK (ID_reservation ~ '^[LR].*$'),
	FOREIGN KEY(ID_reservation) references reservation(ID_reservation),
	date_reservation date check(date_reservation >= '1900-01-01'),
	date_arrivee date check(date_arrivee >= '1900-01-01'),
	date_depart date check(date_depart >= '1900-01-01'),
	num_chambre VARCHAR(20) NOT NULL,
	ID_archive VARCHAR(30) NOT NULL CHECK (ID_archive ~ '^[LR].*$'),
	PRIMARY KEY(ID_reservation),
	FOREIGN KEY(ID_archive) references archive(ID_archive)
);

create table res_se_cham(
	ID_reservation VARCHAR(20) NOT NULL,
	ID_chambre VARCHAR(20) NOT NULL,
	FOREIGN KEY(ID_reservation) references reservation_sans_enregistrement(ID_reservation),
	FOREIGN KEY(ID_chambre) references chambre(ID_chambre),
	PRIMARY KEY(ID_reservation,ID_chambre)
);

create table location(
	ID_location VARCHAR(30) NOT NULL CHECK (ID_location ~ '^[LR].*$'),
	date_arrivee date check(date_arrivee >= '1900-01-01'),
	date_depart date check(date_depart >= '1900-01-01'),
	prix VARCHAR(20) NOT NULL,
	methode VARCHAR(20) check(methode in('espece','CB','cheque')),
	adresse_facturation VARCHAR(255) NOT NULL,
	num_chambre VARCHAR(20) NOT NULL,
	ID_archive VARCHAR(30) NOT NULL CHECK (ID_archive ~ '^[LR].*$'),
	ID_reservation VARCHAR(20) NOT NULL,
	NAS_client VARCHAR(20) NOT NULL,
	NAS_employee VARCHAR(20) NOT NULL,
	PRIMARY KEY(ID_location),
	FOREIGN KEY(ID_reservation) references reservation(ID_reservation),
	FOREIGN KEY(ID_archive) references archive(ID_archive),
	FOREIGN KEY(NAS_client) references client(NAS_client),
	FOREIGN KEY(NAS_employee) references employee(NAS_employee)
);

create table loca_cham(
	ID_chambre VARCHAR(20) NOT NULL,
	ID_location VARCHAR(20) NOT NULL,
	FOREIGN KEY(ID_chambre) references chambre(ID_chambre),
	FOREIGN KEY(ID_location) references location(ID_location),
	PRIMARY KEY(ID_chambre,ID_location)
);