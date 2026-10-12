const Pool = require("pg").Pool;
const pool= new Pool({

    user : "postgres",
    password: "Progamer12@@",
    host: "localhost",
    port : 5435,
    database:"chaine_hotel"
});
module.exports= pool;