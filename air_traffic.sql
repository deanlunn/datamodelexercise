-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

-- CREATE TABLE tickets
-- (
--   id SERIAL PRIMARY KEY,
--   first_name TEXT NOT NULL,
--   last_name TEXT NOT NULL,
--   seat TEXT NOT NULL,
--   departure TIMESTAMP NOT NULL,
--   arrival TIMESTAMP NOT NULL,
--   airline TEXT NOT NULL,
--   from_city TEXT NOT NULL,
--   from_country TEXT NOT NULL,
--   to_city TEXT NOT NULL,
--   to_country TEXT NOT NULL
-- );

-- INSERT INTO tickets
--   (id, first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
-- VALUES
--   ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
--   ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
--   ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
--   ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
--   ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
--   ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
--   ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
--   ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
--   ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
--   ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');

CREATE TABLE passengers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL,
  departure_date DATE NOT NULL,
  departure_time TIME NOT NULL,
  arrival_date DATE NOT NULL,
  arrival_time TIME NOT NULL,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL
);

CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  ticket_number TEXT UNIQUE,
  flight_id INTEGER REFERENCES flights(id),
  passenger_id INTEGER REFERENCES passengers(id)
); 

CREATE TABLE seats (
  id SERIAL PRIMARY KEY,
  ticket_id INTEGER REFERENCES tickets(id),
  passenger_id INTEGER REFERENCES passengers(id),
  seat TEXT NOT NULL
);

INSERT INTO passengers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');

INSERT INTO flights
  (airline, departure_date, departure_time, arrival_date, arrival_time, from_city, from_country, to_city, to_country)
VALUES
  ('United', '2018-04-08', '09:00:00', '2018-04-08', '12:00:00', 'Washington DC', 'United States', 'Seattle', 'United States'),
  ('British Airways', '2018-12-19', '12:45:00', '2018-12-19', '16:15:00', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
  ('Delta', '2018-01-02', '07:00:00', '2018-01-02', '08:03:00', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
  ('Delta', '2018-04-15', '16:50:00', '2018-04-15', '21:00:00', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
  ('TUI Fly Belgium', '2018-08-01', '18:30:00', '2018-08-01', '21:50:00', 'Paris', 'France', 'Casablanca', 'Morocco'),
  ('Air China', '2018-10-31', '01:15:00', '2018-10-31', '12:55:00', 'Dubai', 'UAE', 'Beijing', 'China'),
  ('United', '2019-02-06', '06:00:00', '2019-02-06', '07:47:00', 'New York', 'United States', 'Charlotte', 'United States'),
  ('American Airlines', '2018-12-22', '14:42:00', '2018-12-22', '15:56:00', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
  ('American Airlines', '2019-02-06', '16:28:00', '2019-02-06', '19:18:00', 'Charlotte', 'United States', 'New Orleans', 'United States'),
  ('Avianca Brasil', '2019-01-20', '19:30:00', '2019-01-20', '22:45:00', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');

INSERT INTO tickets
  (ticket_number, flight_id, passenger_id)
VALUES
  (1, 1, 1),
  (2, 2, 2),
  (3, 3, 3),
  (4, 4, 1),
  (5, 5, 4),
  (6, 6, 2),
  (7, 7, 5),
  (8, 8, 6),
  (9, 9, 5),
  (10, 10, 7);

INSERT INTO seats
  (ticket_id, passenger_id, seat)
VALUES
  (1, 1, '33B'),
  (2, 2, '8A'),
  (3, 3, '12F'),
  (4, 1, '20A'),
  (5, 4, '23D'),
  (6, 2, '18C'),
  (7, 5, '9E'),
  (8, 6, '1A'),
  (9, 5, '32B'),
  (10, 7, '10D');