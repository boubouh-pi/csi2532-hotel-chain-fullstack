--il faut qu'a chaque fois on fais une reservation n'aboutit pas à l'enregistrement elle devient un reservation sans enregistrement qu'on ajoute à archive:
create function archive_function() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
   AS
$$
BEGIN
    INSERT INTO archive(ID_archive, date_reservation, date_arrivee, date_depart, ID_hotel)
    SELECT NEW.ID_reservation, NEW.date_reservation, NEW.date_arrivee, NEW.date_depart, c.ID_hotel
    from ch_re as x inner join chambre as c on c.ID_chambre=x.ID_chambre
    where x.ID_reservation=NEW.ID_reservation;
END;
$$;

CREATE TRIGGER insert_into_archive
AFTER INSERT ON reservation_sans_enregistrement
FOR EACH ROW
execute function archive_function();

--a chaque fois qu'on ajoute un employee avec role gestionnaire il faut qu il s'enregistre dans la relation gestionnaire:
create function gestionnaire_function() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
   AS
$$
BEGIN
    IF NEW.poste='gestionnaire' THEN
    		INSERT INTO Gestionnaire(NAS_employee, nom, adresse, poste, ID_hotel)
    		VALUES(NEW.NAS_employee, NEW.nom, NEW.adresse, NEW.poste, NEW.ID_hotel);
    END IF;
END;
$$;

CREATE TRIGGER insert_into_gestionnaire
AFTER INSERT ON EMPLOYEE
FOR EACH ROW
execute function gestionnaire_function();