createdb vet_clinic;
CREATE TABLE animals(id INT GENERATED ALWAYS AS IDENTITY, name TEXT, date_of_birth DATE, escape_attempts INT, neutered BOOLEAN, weight_kg DECIMAL);

ALTER TABLE animals ADD COLUMN species TEXT;

DROP TABLE IF EXISTS owners; 
CREATE TABLE owners(id INT GENERATED ALWAYS AS IDENTITY, full_name TEXT, age INT, PRIMARY KEY (id));

DROP TABLE IF EXISTS species;
CREATE TABLE species(id INT GENERATED ALWAYS AS IDENTITY, name TEXT, PRIMARY KEY(id));

ALTER TABLE animals ADD PRIMARY KEY (id);
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id);
ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id) ON DELETE CASCADE;
ALTER TABLE animals ADD COLUMN owners_id INT REFERENCES owners(id);
ALTER TABLE animals ADD CONSTRAINT fk_owners FOREIGN KEY (owners_id) REFERENCES owners(id) ON DELETE CASCADE;

CREATE TABLE vets(id INT GENERATED ALWAYS AS IDENTITY, name TEXT, age INT, date_of_graduation DATE ,PRIMARY kEY(id));

CREATE TABLE specializations (
    species_id INT NOT NULL, 
    vets_id INT NOT NULL, 
    PRIMARY KEY (species_id, vets_id), 
    FOREIGN KEY (species_id) REFERENCES species(id) ON DELETE CASCADE,
    FOREIGN KEY (vets_id) REFERENCES vets(id) ON DELETE CASCADE
);

CREATE TABLE visits (
    animals_id INT NOT NULL, 
    vets_id INT NOT NULL, 
    PRIMARY KEY (animals_id, vets_id), 
    FOREIGN KEY (animals_id) REFERENCES animals(id) ON DELETE CASCADE,
    FOREIGN KEY (vets_id) REFERENCES vets(id) ON DELETE CASCADE
);

