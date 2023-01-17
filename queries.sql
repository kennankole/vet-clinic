/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_part('year', date_of_birth) BETWEEN 2016 AND 2019;
SELECT name FROM animals WHERE neutered IS TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Augmon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered IS TRUE;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;



BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals;

UPDATE animals 
SET species = 'digimon'
WHERE name LIKE '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;


BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT young_stars;

UPDATE animals 
SET weight_kg = weight_kg * - 1;

ROLLBACK TO young_stars;

UPDATE animals 
SET weight_kg = weight_kg * - 1
WHERE weight_kg <= 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts > 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, COUNT(*) as count

SELECT neutered, COUNT(*) as count
FROM animals
GROUP BY neutered;

SELECT species, MIN(weight_kg) as min_wgt, MAX(weight_kg) as max_wgt
FROM animals
GROUP BY species;


SELECT species, AVG(escape_attempts) as avg_esc_attempts
FROM animals
WHERE date_of_birth >= '1990-01-01' AND date_of_birth < '2000-01-01'
GROUP BY species;
