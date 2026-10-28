
CREATE DATABASE universe;
\c universe

CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    galaxy_type VARCHAR(50) NOT NULL,
    distance_from_earth NUMERIC(12,2),
    has_black_hole BOOLEAN NOT NULL,
    description TEXT
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
    temperature INT NOT NULL,
    is_spherical BOOLEAN NOT NULL,
    spectral_type VARCHAR(20)
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    star_id INT NOT NULL REFERENCES star(star_id),
    planet_type VARCHAR(50) NOT NULL,
    number_of_moons INT NOT NULL,
    has_life BOOLEAN NOT NULL,
    mass NUMERIC(12,4)
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    planet_id INT NOT NULL REFERENCES planet(planet_id),
    diameter INT NOT NULL,
    is_spherical BOOLEAN NOT NULL,
    composition TEXT
);

CREATE TABLE constellation (
    constellation_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    abbreviation VARCHAR(10) NOT NULL,
    number_of_stars INT NOT NULL,
    description TEXT
);

INSERT INTO galaxy
(name, galaxy_type, distance_from_earth, has_black_hole, description)
VALUES
('Milky Way', 'Spiral', 0, TRUE, 'Our home galaxy'),
('Andromeda', 'Spiral', 2.54, TRUE, 'Nearest major galaxy'),
('Triangulum', 'Spiral', 2.73, TRUE, 'A galaxy in the Local Group'),
('Whirlpool', 'Spiral', 23.16, TRUE, 'Also known as Messier 51'),
('Sombrero', 'Lenticular', 29.35, TRUE, 'Known for its bright central bulge'),
('Large Magellanic Cloud', 'Irregular', 0.163, TRUE, 'A satellite galaxy of the Milky Way');

INSERT INTO star
(name, galaxy_id, temperature, is_spherical, spectral_type)
VALUES
('Sun', 1, 5778, TRUE, 'G2V'),
('Sirius', 1, 9940, TRUE, 'A1V'),
('Proxima Centauri', 1, 3042, TRUE, 'M5.5Ve'),
('Alpha Centauri A', 1, 5790, TRUE, 'G2V'),
('Betelgeuse', 1, 3500, TRUE, 'M1-M2Ia'),
('Rigel', 1, 12100, TRUE, 'B8Ia');

INSERT INTO planet
(name, star_id, planet_type, number_of_moons, has_life, mass)
VALUES
('Mercury', 1, 'Terrestrial', 0, FALSE, 0.0553),
('Venus', 1, 'Terrestrial', 0, FALSE, 0.8150),
('Earth', 1, 'Terrestrial', 1, TRUE, 1.0000),
('Mars', 1, 'Terrestrial', 2, FALSE, 0.1070),
('Jupiter', 1, 'Gas Giant', 95, FALSE, 317.8000),
('Saturn', 1, 'Gas Giant', 274, FALSE, 95.1600),
('Uranus', 1, 'Ice Giant', 28, FALSE, 14.5400),
('Neptune', 1, 'Ice Giant', 16, FALSE, 17.1500),
('Proxima b', 3, 'Terrestrial', 0, FALSE, 1.2700),
('Alpha Centauri Bb', 4, 'Terrestrial', 0, FALSE, 1.1300),
('Sirius b Planet', 2, 'Unknown', 0, FALSE, NULL),
('Rigel b', 6, 'Unknown', 0, FALSE, NULL);

INSERT INTO moon
(name, planet_id, diameter, is_spherical, composition)
VALUES
('Moon', 3, 3475, TRUE, 'Rock and metal'),
('Phobos', 4, 22, FALSE, 'Rock'),
('Deimos', 4, 12, FALSE, 'Rock'),
('Io', 5, 3643, TRUE, 'Volcanic rock'),
('Europa', 5, 3122, TRUE, 'Ice and rock'),
('Ganymede', 5, 5268, TRUE, 'Ice and rock'),
('Callisto', 5, 4821, TRUE, 'Ice and rock'),
('Titan', 6, 5150, TRUE, 'Ice and rock'),
('Enceladus', 6, 504, TRUE, 'Ice and rock'),
('Rhea', 6, 1528, TRUE, 'Ice and rock'),
('Iapetus', 6, 1469, TRUE, 'Ice and rock'),
('Dione', 6, 1123, TRUE, 'Ice and rock'),
('Tethys', 6, 1062, TRUE, 'Ice and rock'),
('Mimas', 6, 396, TRUE, 'Ice and rock'),
('Miranda', 7, 472, TRUE, 'Ice and rock'),
('Ariel', 7, 1158, TRUE, 'Ice and rock'),
('Umbriel', 7, 1169, TRUE, 'Ice and rock'),
('Titania', 7, 1578, TRUE, 'Ice and rock'),
('Oberon', 7, 1523, TRUE, 'Ice and rock'),
('Triton', 8, 2707, TRUE, 'Ice and rock');

INSERT INTO constellation
(name, abbreviation, number_of_stars, description)
VALUES
('Orion', 'Ori', 7, 'A prominent constellation near the celestial equator'),
('Ursa Major', 'UMa', 7, 'A constellation in the northern sky'),
('Cassiopeia', 'Cas', 5, 'A northern constellation shaped like a W');