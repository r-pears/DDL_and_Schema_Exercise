-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER REFERENCES passenger ON DELETE CASCADE,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER REFERENCES airline ON DELETE CASCADE,
  departure_id INTEGER REFERENCES country ON DELETE CASCADE,
  arrival_id INTEGER REFERENCES country ON DELETE CASCADE
);

CREATE TABLE passenger
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE airline
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE country
(
  id SERIAL PRIMARY KEY,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL
);


INSERT INTO country
  (to_city, to_country)
VALUES
  ('Seattle', 'United States'),
  ('London', 'United Kingdom'),
  ('Las Vegas', 'United States'),
  ('Mexico City', 'Mexico'),
  ('Casablanca', 'Morocco'),
  ('Beijing', 'China'),
  ('Charlotte', 'United States'),
  ('Chicago', 'United States'),
  ('New Orleans', 'United States'),
  ('Santiago', 'Chile');
  ('Washington DC', 'United States'),
  ('Tokyo', 'Japan'),
  ('Los Angeles', 'United States'),
  ('Paris', 'France'),
  ('Dubai', 'UAE'),
  ('New York', 'United States'),
  ('Cedar Rapids', 'United States'),
  ('Sao Paolo', 'Brazil');

  INSERT INTO airline
  (name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

  INSERT INTO passenger
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');

INSERT INTO tickets
  (passenger_id, seat, departure, arrival, airline_id, departure_id, arrival_id)
VALUES
  (1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 11, 1),
  (2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 12, 2),
  (3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 13, 3),
  (1, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 1, 4),
  (4, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 14, 5),
  (2, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 15, 6),
  (5, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1 16, 7),
  (6, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 17, 8),
  (5, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 7, 9),
  (7, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 18, 10);