/* Database schema to keep the structure of entire database. */

/* Create database and animals table (Milestone 1) */
createdb vet_clinic;
CREATE TABLE animals(id INT GENERATED ALWAYS AS IDENTITY, name TEXT, date_of_birth DATE, escape_attempts INT, neutered BOOLEAN, weight_kg DECIMAL);

/* Create species column (Milestone 2) */
ALTER TABLE animals ADD COLUMN species TEXT;

/* Milestone 3 */

/* Create table owners */
DROP TABLE IF EXISTS owners; 
CREATE TABLE owners(id INT GENERATED ALWAYS AS IDENTITY, full_name TEXT, age INT, PRIMARY KEY (id));

/* Create table species */
DROP TABLE IF EXISTS species;
CREATE TABLE species(id INT GENERATED ALWAYS AS IDENTITY, name TEXT, PRIMARY KEY(id));

/* Update animals table */
ALTER TABLE animals ADD PRIMARY KEY (id);
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id);
ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id) ON DELETE CASCADE;
ALTER TABLE animals ADD COLUMN owners_id INT REFERENCES owners(id);
ALTER TABLE animals ADD CONSTRAINT fk_owners FOREIGN KEY (owners_id) REFERENCES owners(id) ON DELETE CASCADE;
