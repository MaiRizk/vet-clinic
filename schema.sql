/* Database schema to keep the structure of entire database. */

createdb vet_clinic;
CREATE TABLE animals(id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, name TEXT, date_of_birth DATE, escape_attempts INT, neutered BOOLEAN, weight_kg DECIMAL);
