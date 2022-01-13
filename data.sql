/* Populate database with sample data. */

/* Insert values to animals table (Milestone 1) */
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Agumon', '2020-02-03', 10.23, true, 0);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Gabumon', '2018-11-15', 8, true, 2);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Pikachu', '2021-01-07', 15.04, false, 1);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Devimon', '2017-05-12', 11, true, 5);

/* Insert new values to animals table (Milestone 2) */
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Charmander', '2020-02-08', '-11', false, 0);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Plantmon', '2022-11-15', '-5.7', true, 2);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Squirtle', '1993-04-02', '-12.13', false, 3);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Angemon', '2005-06-12', '-45', true, 1);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Boarmon', '2005-06-07', '20.4', true, 7);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Blossom', '1998-10-13', '17', true

/* New insertions (Milestone 3) */

/* Insert values into orders table */
INSERT INTO owners(full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners(full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners(full_name, age) VALUES ('Bob', 45);
INSERT INTO owners(full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners(full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners(full_name, age) VALUES ('Jodie Whittaker', 38);

/* Insert values into species table */
INSERT INTO species(name) VALUES ('Pokemon');
INSERT INTO species(name) VALUES ('Digimon');

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon';
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE species_id IS NULL;

UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name = 'Angemon' OR name = 'Boarmon';
