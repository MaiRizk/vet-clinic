/*Queries that provide answers to the questions from all projects.*/

/* Complete the queries requested in (Milestone 1) */
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name FROM animals WHERE neutered = 'true' AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ( 'Agumon', 'Pikachu' ); 
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = 'true';
SELECT * FROM animals WHERE name NOT LIKE 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

/* Complete the transactions and quesries requested in (Milestone 2) */

/* Update species column transaction and rollback */
BEGIN; --start transaction

UPDATE animals SET species = 'unspecified'; --update species column
SELECT species from animals; -- verify that change was made

ROLLBACK;

SELECT species from animals; -- verify that change was undone

/* Update scpecies column completed transaction */
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;

SELECT species FROM animals; --verify the change has been made

/* Delete all records from animals table and rollback */
BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals; --verify all records have been restored

/* Transaction with savepoint */
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg*1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg*-1 WHERE weight_kg < 0;
COMMIT;

/* Queries to answer given questions */

/* How many animals are there? */
SELECT COUNT(*) FROM animals;

/* How many animals have never tried to escape? */
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

/* What is the average weight of animals? */
SELECT AVG(weight_kg) FROM animals;

/* Who escapes the most? */
SELECT name FROM animals WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);

/* Who neutered from animals? */
SELECT name FROM animals WHERE neutered = true;

/* Who not neutered from animals? */
SELECT name FROM animals WHERE neutered = false;

/* What is the minimum and maximum weight of each type of animal? */
SELECT MIN(weight_kg) FROM animals GROUP BY species;
SELECT MAX(weight_kg) FROM animals GROUP BY species;

/* What is the average number of escape attempts per animal type of those born between 1990 and 2000? */
SELECT AVG(escape_attempts) FROM animals GROUP BY species, date_of_birth HAVING (date_of_birth) BETWEEN '1990-01-01' AND '2000-01-01';

/* Milestone 3 */
SELECT name FROM animals INNER JOIN owners ON animals.owners_id = owners_id WHERE owners.full_name = 'Melody Pond';  --What animals belong to Melody Pond?
SELECT animals.name FROM animals INNER JOIN species ON animals.species_id = species_id WHERE species.name = 'Pokemon';
SELECT owners.full_name, animals.name FROM owners LEFT JOIN animals ON owners.id = animals.owners_id;
SELECT COUNT(*), species.name FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;
SELECT animals.name FROM animals INNER JOIN owners ON animals.owners_id = owners.id WHERE owners.full_name = 'Jennifer Orwell'; AND animals.species_id = (SELECT id FROM species WHERE species.name = 'Digimon');
SELECT animals.name FROM animals INNER JOIN owners ON animals.owners_id = owners.id WHERE owners.full_name = 'Dean Winchester ' AND animals.escape_attempts = 0;
SELECT owners.full_name, COUNT(animals) FROM owners INNER JOIN animals ON owners.id = animals.owners_id GROUP BY owners.full_name;