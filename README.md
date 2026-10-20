# e-Hotel: Hotel Booking Web App

Full-stack hotel booking application built for the CSI2532 database course at the University of Ottawa.

## Features

- Admin and user accounts with login
- Search for available rooms by country, budget and room type, using SQL queries on a PostgreSQL database
- Room reservations stored in a relational PostgreSQL database

## Tech stack

- **Front end:** React, React Router, react-date-range
- **Back end:** Node.js, Express
- **Database:** PostgreSQL (`pg`)

## Project structure

```
Client/client/   React front end
server/          Express API connected to PostgreSQL
```

## Running locally

```bash
# Back end
cd server
npm install
node index.js

# Front end
cd Client/client
npm install
npm start
```

The server needs a running PostgreSQL database. Update the connection settings in the server code before starting it.
