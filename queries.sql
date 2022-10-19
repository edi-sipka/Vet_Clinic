/*Queries that provide answers to the questions from all projects.*/
SELECT name FROM animals WHERE name LIKE '%mon';
SELECT name,date_of_birth FROM animals WHERE date_of_birth BETWEEN '2016-01-01' and '2019-01-01';
SELECT name,neutered FROM animals WHERE neutered=TRUE AND escape_attempts < 3 ;
SELECT date_of_birth FROM animals WHERE name='Agumon' OR name='Pikachu' ;
SELECT name,escape_attempts FROM animals WHERE weight_kg > 10.5 ;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3 ;

--TRANSACTION--

-- Updating animals species--
BEGIN;
UPDATE animals 
SET species = 'unspecified';
ROLLBACK;

--Transaction updating animals name--
BEGIN;
UPDATE animals 
SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals 
SET species = 'pokemon' WHERE name NOT LIKE '%mon';
COMMIT;

-- Deleting all and rollback -- 
BEGIN;
DELETE FROM animals;
ROLLBACK; 

--Delete all animals born after Jan 1st, 2022.--
BEGIN; 
SAVEPOINT SAVEPOINT1;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
ROLLBACK TO SAVEPOINT1;
SAVEPOINT SAVEPOINT2;
UPDATE animals SET weight_kg=weight_kg* -1;
ROLLBACK TO SAVEPOINT2;
UPDATE animals SET weight_kg=weight_kg* -1;
COMMIT;

--How many animals are there?--
SELECT COUNT(*) AS total_number FROM animals;

--How many animals have never tried to escape?--
SELECT COUNT(*) AS never_escaped FROM animals WHERE escape_attempts=0;

--What is the average weight of animals?--
SELECT CAST(AVG(weight_kg) AS DECIMAL(5,2))  AS avg_weight FROM animals;

--Who escapes the most, neutered or not neutered animals?--
SELECT name, MAX(escape_attempts) AS escapes_attempts FROM animals WHERE neutered = true OR neutered=false GROUP BY name ORDER BY MAX(escape_attempts) DESC ;

--What is the minimum and maximum weight of each type of animal?--
SELECT MAX(weight_kg) AS max_weight, MIN(weight_kg) AS min_weight FROM animals; 

--What is the average number of escape attempts per animal type of those born between 1990 and 2000?--
SELECT CAST(AVG(escape_attempts) AS DECIMAL(5,2)) AS average_escapes FROM animals WHERE extract(YEAR FROM date_of_birth) BETWEEN 1990 AND 2000;