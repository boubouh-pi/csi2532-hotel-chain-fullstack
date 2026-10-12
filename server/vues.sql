
-- Creating a view to calculate the total capacity of rooms for each hotel
CREATE VIEW capacite_chambres_hotel_specifique AS
SELECT h.ID_hotel, SUM(c.capacite) AS capacite_totale
FROM hotel as h JOIN chambre as c ON h.ID_hotel = c.ID_hotel
GROUP BY h.ID_hotel;
-- Creating a view to count the number of available rooms by zone
CREATE VIEW nombre_chambres_disponibles_par_zone AS
SELECT h.zone, COUNT(*) AS nombre_chambres_disponibles
FROM chambre as c inner join hotel as h on c.ID_hotel=h.ID_hotel
WHERE c.disponibilite=0
GROUP BY h.zone;