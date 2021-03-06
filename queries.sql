SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name FROM animals WHERE neutered = 'true' AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ( 'Agumon', 'Pikachu' ); 
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = 'true';
SELECT * FROM animals WHERE name NOT LIKE 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN;

UPDATE animals SET species = 'unspecified'; 
SELECT species from animals; 

ROLLBACK;

SELECT species from animals; 

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;

SELECT species FROM animals; 

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals; 

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg*1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg*-1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT name FROM animals WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);

SELECT name FROM animals WHERE neutered = true;

SELECT name FROM animals WHERE neutered = false;

SELECT MIN(weight_kg) FROM animals GROUP BY species;
SELECT MAX(weight_kg) FROM animals GROUP BY species;

SELECT AVG(escape_attempts) FROM animals GROUP BY species, date_of_birth HAVING (date_of_birth) BETWEEN '1990-01-01' AND '2000-01-01';

SELECT name FROM animals INNER JOIN owners ON animals.owners_id = owners_id WHERE owners.full_name = 'Melody Pond';  
SELECT animals.name FROM animals INNER JOIN species ON animals.species_id = species_id WHERE species.name = 'Pokemon';
SELECT owners.full_name, animals.name FROM owners LEFT JOIN animals ON owners.id = animals.owners_id;
SELECT COUNT(*), species.name FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;
SELECT animals.name FROM animals INNER JOIN owners ON animals.owners_id = owners.id WHERE owners.full_name = 'Jennifer Orwell'; AND animals.species_id = (SELECT id FROM species WHERE species.name = 'Digimon');
SELECT animals.name FROM animals INNER JOIN owners ON animals.owners_id = owners.id WHERE owners.full_name = 'Dean Winchester ' AND animals.escape_attempts = 0;
SELECT owners.full_name, COUNT(animals) FROM owners INNER JOIN animals ON owners.id = animals.owners_id GROUP BY owners.full_name;

SELECT animals.name, visits.visit_date
FROM visits
LEFT JOIN animals ON animals.id = visits.animals_id
LEFT JOIN vets ON vets.id = visits.vets_id
WHERE vets.name = 'William Tatcher';

SELECT animals.name
FROM visits
JOIN animals ON animals.id = visits.animals_id
LEFT JOIN vets ON vets.id = visits.vets_id
WHERE vets.name = 'Stephanie Mendez';

SELECT vets.*,species.name
FROM vets
JOIN specializations ON vets.id = specializations.vets_id
JOIN species ON specializations.species_id = species.id;

SELECT visits.visit_date
FROM visits
JOIN animals ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id
WHERE vets.name = 'Stephanie Mendez'
AND visit_date BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.name, COUNT(animals.name)
FROM visits
LEFT JOIN animals ON animals.id = visits.animals_id
GROUP BY animals.name;

SELECT animals.name, visits.visit_date
FROM visits
LEFT JOIN animals ON animals.id = visits.animals_id
LEFT JOIN vets ON vets.id = visits.vets_id
WHERE vets.name = 'Maisy Smith';

SELECT animals.*, vets.*, visits.visit_date
FROM visits
LEFT JOIN animals ON animals.id = visits.animals_id
LEFT JOIN vets ON vets.id = visits.vets_id;


SELECT count(*)
FROM visits
LEFT JOIN animals ON animals.id = visits.animals_id
LEFT JOIN vets ON vets.id = visits.vets_id
WHERE animals.species_id NOT IN (SELECT species_id FROM specializations WHERE vets_id = vets.id);


SELECT species.name, count(*)
FROM visits
LEFT JOIN animals ON animals.id = visits.animals_id
LEFT JOIN species ON animals.species_id = species.id
LEFT JOIN vets ON vets.vets_id = visits.vets_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name