/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', 'February 3, 2020', 0, TRUE, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', 'November 15, 2018', 2, TRUE, 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', 'January 7, 2021', 1, FALSE, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', 'May 12, 2017', 5, TRUE, 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', 'February 8, 2020', 0, FALSE, -11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', 'November 15, 2020', 2, TRUE, -5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', 'April 2, 1993', 3, FALSE, -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', 'June 12, 2005', 7, TRUE, -45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', 'June 7, 2005', 7, TRUE, 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', 'October 13, 1998', 3, TRUE, 17);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', 'May 14, 2022', 4, TRUE, 22);

BEGIN;
INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');

UPDATE animals SET species_id = (CASE WHEN name LIKE '%mon' THEN 1 ELSE 2 END);

UPDATE animals 
SET owner_id = (
    SELECT id
    FROM owners
    WHERE full_name = (
        CASE
            WHEN animals.name = 'Agumon' THEN 'Sam Smith'
            WHEN animals.name = 'Gabumon' THEN 'Jennifer Orwell'
            WHEN animals.name = 'Pikachu' THEN 'Jennifer Orwell'
            WHEN animals.name = 'Devimon' THEN 'Bob'
            WHEN animals.name = 'Plantmon' THEN 'Bob'
            WHEN animals.name = 'Charmander' THEN 'Melody Pond'
            WHEN animals.name = 'Squirtle' THEN 'Melody Pond'
            WHEN animals.name = 'Blossom' THEN 'Melody Pond'
            WHEN animals.name = 'Angemon' THEN 'Dean Winchester'
            WHEN animals.name = 'Boarmon' THEN 'Dean Winchester'
        END
    )
);


