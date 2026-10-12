const express = require("express");
const cors = require("cors");
const pool = require("./db"); 

const app = express();
app.use(cors());
app.use(express.json());

// CRUD for chaine_hoteliere
app.post("/api/chaine_hoteliere", async (req, res) => {
    const { ID_ch, adresee_ch, Nombre_hotel, Email, Telephone } = req.body;
    try {
        const newChain = await pool.query(
            "INSERT INTO chaine_hoteliere (ID_ch, adresee_ch, Nombre_hotel, Email, Telephone) VALUES ($1, $2, $3, $4, $5) RETURNING *",
            [ID_ch, adresee_ch, Nombre_hotel, Email, Telephone]
        );
        res.json(newChain.rows[0]);
    } catch (err) {
        console.error(err.message);
        res.status(500).send("Server Error");
    }
});

// Add GET, PUT, DELETE for chaine_hoteliere .
app.get("/api/chaine_hoteliere", async (req, res) => {
    try {
        const allChains = await pool.query("SELECT * FROM chaine_hoteliere");
        res.json(allChains.rows);
    } catch (err) {
        console.error(err.message);
        res.status(500).send("Server Error");
    }
});
app.get("/api/chaine_hoteliere/:id", async (req, res) => {
    const { id } = req.params;
    try {
        const chain = await pool.query("SELECT * FROM chaine_hoteliere WHERE ID_ch = $1", [id]);
        if (chain.rows.length === 0) {
            return res.status(404).json({ message: "Hotel chain not found" });
        }
        res.json(chain.rows[0]);
    } catch (err) {
        console.error(err.message);
        res.status(500).send("Server Error");
    }
});
app.put("/api/chaine_hoteliere/:id", async (req, res) => {
    const { id } = req.params;
    const { adresee_ch, Nombre_hotel, Email, Telephone } = req.body;
    try {
        const updateChain = await pool.query(
            "UPDATE chaine_hoteliere SET adresee_ch = $1, Nombre_hotel = $2, Email = $3, Telephone = $4 WHERE ID_ch = $5 RETURNING *",
            [adresee_ch, Nombre_hotel, Email, Telephone, id]
        );
        if (updateChain.rows.length === 0) {
            return res.status(404).json({ message: "Hotel chain not found" });
        }
        res.json(updateChain.rows[0]);
    } catch (err) {
        console.error(err.message);
        res.status(500).send("Server Error");
    }
});
app.delete("/api/chaine_hoteliere/:id", async (req, res) => {
    const { id } = req.params;
    try {
        const deleteChain = await pool.query("DELETE FROM chaine_hoteliere WHERE ID_ch = $1 RETURNING *", [id]);
        if (deleteChain.rows.length === 0) {
            return res.status(404).json({ message: "Hotel chain not found" });
        }
        res.json({ message: "Hotel chain successfully deleted" });
    } catch (err) {
        console.error(err.message);
        res.status(500).send("Server Error");
    }
});


// CRUD for hotel
app.post("/api/hotel", async (req, res) => {
    const { ID_hotel, gamme, Nmbr_chambre, zone, Numero_tel, Courriel, ID_ch } = req.body;
    try {
        const newHotel = await pool.query(
            "INSERT INTO hotel (ID_hotel, gamme, Nmbr_chambre, zone, Numero_tel, Courriel, ID_ch) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *",
            [ID_hotel, gamme, Nmbr_chambre, zone, Numero_tel, Courriel, ID_ch]
        );
        res.json(newHotel.rows[0]);
    } catch (err) {
        console.error(err.message);
        res.status(500).send("Server Error");
    }
});

// Add GET, PUT, DELETE for hotel...
app.get("/api/hotels", async (req, res) => {
    try {
        const allHotels = await pool.query("SELECT * FROM hotel");
        res.json(allHotels.rows);
    } catch (err) {
        console.error(err.message);
        res.status(500).send("Server Error");
    }
});
app.get("/api/hotels/:id", async (req, res) => {
    const { id } = req.params;
    try {
        const hotel = await pool.query("SELECT * FROM hotel WHERE ID_hotel = $1", [id]);
        if (hotel.rows.length === 0) {
            return res.status(404).json({ message: "Hotel not found" });
        }
        res.json(hotel.rows[0]);
    } catch (err) {
        console.error(err.message);
        res.status(500).send("Server Error");
    }
});
app.put("/api/hotels/:id", async (req, res) => {
    const { id } = req.params;
    const { gamme, Nmbr_chambre, zone, Numero_tel, Courriel, ID_ch } = req.body;
    try {
        const updateHotel = await pool.query(
            "UPDATE hotel SET gamme = $1, Nmbr_chambre = $2, zone = $3, Numero_tel = $4, Courriel = $5, ID_ch = $6 WHERE ID_hotel = $7 RETURNING *",
            [gamme, Nmbr_chambre, zone, Numero_tel, Courriel, ID_ch, id]
        );
        if (updateHotel.rows.length === 0) {
            return res.status(404).json({ message: "Hotel not found" });
        }
        res.json(updateHotel.rows[0]);
    } catch (err) {
        console.error(err.message);
        res.status(500).send("Server Error");
    }
});
app.delete("/api/hotels/:id", async (req, res) => {
    const { id } = req.params;
    try {
        const deleteHotel = await pool.query("DELETE FROM hotel WHERE ID_hotel = $1 RETURNING *", [id]);
        if (deleteHotel.rows.length === 0) {
            return res.status(404).json({ message: "Hotel not found" });
        }
        res.json({ message: "Hotel successfully deleted" });
    } catch (err) {
        console.error(err.message);
        res.status(500).send("Server Error");
    }
});





// CRUD for client
app.post("/api/client", async (req, res) => {
    const { NAS_client, nom, adresse, date_enregistrement, ID_hotel } = req.body;
    try {
        const newClient = await pool.query(
            "INSERT INTO client (NAS_client, nom, adresse, date_enregistrement, ID_hotel) VALUES ($1, $2, $3, $4, $5) RETURNING *",
            [NAS_client, nom, adresse, date_enregistrement, ID_hotel]
        );
        res.json(newClient.rows[0]);
    } catch (err) {
        console.error(err.message);
        res.status(500).send("Server Error");
    }
});

// Add GET, PUT, DELETE for client...
app.get("/api/clients", async (req, res) => {
    try {
        const allClients = await pool.query("SELECT * FROM client");
        res.json(allClients.rows);
    } catch (err) {
        console.error(err.message);
        res.status(500).send("Server Error");
    }
});
app.get("/api/clients/:nas", async (req, res) => {
    const { nas } = req.params;
    try {
        const client = await pool.query("SELECT * FROM client WHERE NAS_client = $1", [nas]);
        if (client.rows.length === 0) {
            return res.status(404).json({ message: "Client not found" });
        }
        res.json(client.rows[0]);
    } catch (err) {
        console.error(err.message);
        res.status(500).send("Server Error");
    }
});
app.put("/api/clients/:nas", async (req, res) => {
    const { nas } = req.params;
    const { nom, adresse, date_enregistrement, ID_hotel } = req.body;
    try {
        const updateClient = await pool.query(
            "UPDATE client SET nom = $1, adresse = $2, date_enregistrement = $3, ID_hotel = $4 WHERE NAS_client = $5 RETURNING *",
            [nom, adresse, date_enregistrement, ID_hotel, nas]
        );
        if (updateClient.rows.length === 0) {
            return res.status(404).json({ message: "Client not found" });
        }
        res.json(updateClient.rows[0]);
    } catch (err) {
        console.error(err.message);
        res.status(500).send("Server Error");
    }
});
app.delete("/api/clients/:nas", async (req, res) => {
    const { nas } = req.params;
    try {
        const deleteClient = await pool.query("DELETE FROM client WHERE NAS_client = $1 RETURNING *", [nas]);
        if (deleteClient.rows.length === 0) {
            return res.status(404).json({ message: "Client not found" });
        }
        res.json({ message: "Client successfully deleted" });
    } catch (err) {
        console.error(err.message);
        res.status(500).send("Server Error");
    }
});




app.listen(5000, () => {
    console.log("Server has started on port 5000");
});
