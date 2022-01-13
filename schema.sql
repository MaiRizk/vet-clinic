/* Database schema to keep the structure of entire database. */

/* Create database and animals table (Milestone 1) */
createdb vet_clinic;
CREATE TABLE animals(id INT GENERATED ALWAYS AS IDENTITY, name TEXT, date_of_birth DATE, escape_attempts INT, neutered BOOLEAN, weight_kg DECIMAL);

/* Create species column (Milestone 2) */
ALTER TABLE animals ADD COLUMN species TEXT;
