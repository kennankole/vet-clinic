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


INNER JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT animals.* FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';


SELECT owners.*, animals.* FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;


SELECT species.name, COUNT(animals.id) as animal_count FROM animals
JOIN species ON animals.species_id = species.id
GROUP BY species.name;

SELECT animals.* FROM animals
JOIN species ON animals.species_id = species.id
JOIN owners ON animals.owner_id = owners.id
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

SELECT animals.* FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts <= 0;


SELECT owners.full_name, COUNT(animals.id) as animal_count FROM animals
JOIN owners ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY animal_count DESC
LIMIT 1;

SELECT a.name FROM animals a 
JOIN visits vs ON a.id = vs.animals_id
JOIN vets ve ON vs.vet_id = ve.id
WHERE ve.name = 'William Tatcher'
ORDER BY vs.visit_date DESC
LIMIT 1;

SELECT COUNT(vs.animals_id)
FROM visits vs
JOIN vets ve ON vs.vet_id = ve.id
WHERE ve.name = 'Stephanie Mendez';


SELECT ve.name, sp.name
FROM vets ve
LEFT JOIN specializations sps ON ve.id = sps.vet_id
LEFT JOIN species sp ON sp.id = sps.species_id
ORDER BY ve.name;

SELECT a.name
FROM animals a
JOIN visits vs ON a.id = vs.animals_id
JOIN vets ve ON vs.vet_id = ve.id
WHERE ve.name = 'Stephanie Mendez' AND vs.visit_date BETWEEN '2020-04-01' AND '2020-08-30'
ORDER BY vs.visit_date;

SELECT a.name as animal_name, COUNT(a.id) as visit_count
FROM animals a
JOIN visits vs ON a.id = vs.animals_id
GROUP BY a.name 
ORDER BY visit_count DESC
LIMIT 1;

SELECT a.name as animal_name
FROM animals a 
JOIN visits v ON v.animals_id = a.id
JOIN vets ve ON v.vet_id = ve.id
WHERE ve.name = 'Maisy Smith'
ORDER BY v.visit_date
LIMIT 1;

SELECT a.name as animal_name, ve.name as vet_name, v.visit_date
FROM animals a 
JOIN visits v ON a.id = v.animals_id
JOIN vets ve ON v.vet_id = ve.id 
ORDER BY v.visit_date DESC
LIMIT 1;

SELECT COUNT(*) as count_of_visits
FROM visits v
LEFT JOIN specializations sp ON v.vet_id = sp.vet_id AND v.vet_id = sp.species_id
WHERE sp.vet_id IS NULL;

SELECT s.name as species_name, COUNT(a.id) as count_of_species
FROM animals a
JOIN visits v ON a.id = v.animals_id
JOIN species s ON a.species_id = s.id
JOIN vets ve ON ve.id = v.vet_id
WHERE ve.name = 'Maisy Smith'
GROUP BY s.name
ORDER BY count_of_species DESC
LIMIT 1;


SELECT COUNT(*) FROM visits WHERE animals_id = 4;
CREATE INDEX ON visits (animals_id);
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits WHERE animals_id = 4;

EXPLAIN ANALYZE SELECT *  FROM owners WHERE email = 'owner_18327@mail.com';
EXPLAIN ANALYZE SELECT full_name FROM owners WHERE email = 'owner_18327@mail.com';