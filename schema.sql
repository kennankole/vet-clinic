/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
    id   INT GENERATED ALWAYS AS IDENTITY, 
    name VARCHAR(250),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg FLOAT,
    PRIMARY KEY(id)
);

ALTER TABLE animals 
ADD COLUMN species VARCHAR(150);


CREATE TABLE owners(
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(256) NOT NULL,
    age INT NOT NULL
);

CREATE TABLE species(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) 
);


BEGIN;
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owner_id INT REFERENCES owners(id);




