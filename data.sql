/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03' , 0, TRUE, 10.23 );
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15' , 2, TRUE, 8 );
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-7', 1, FALSE, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, TRUE, 11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '2020-02-08', 0, false, 11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '2021-11-15', 2, true, 5.2);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '1993-04-02', 3, false, 12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '2005-06-12', 1, true, 45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '2005-06-07', 7, true, 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '1998-10-13', 3, true, 17);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', '2022-05-14', 4, true, 22);

-- Insert data in owners table --
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', '34'),('Jennifer Orwell', '19'),
	('Bob', '45'),
	('Melody Pond', '77'),
	('Dean Winchester', '14'),
	('Jodie Whittaker', '38');

	-- Insert email data to owners table -- 
	ALTER TABLE owners ADD COLUMN email VARCHAR(120); 

-- Insert data into species table -- 
INSERT INTO species(name)VALUES('Pokemon','Digimon');

--Modify animals species_id--
BEGIN; 
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

-- Modify animals owner_id--
BEGIN; 
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon'); 
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom'); 
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon'); 

-- Insert the following data for vets -- 

INSERT INTO vets(name,age,date_of_graduation)
VALUES('William Tatcher', 45, '2000-04-23') 
,('Vet Maisy Smith', '26',  date '2019-01-17'),
('Vet Stephanie Mendez', '64',  date '1981-05-04'),
('Vet Jack Harkness', '38',  date '2008-06-08');

-- Insert the data for specialties: 
INSERT INTO specializations(vets_id,species_id) VALUES ('1', '1'),('3', '1'),('3', '2'),('4', '2');

-- Insert the following data for visits:

INSERT INTO visits(animals_id, vets_id, date_of_visit)
VALUES
	('1', '1', date '2020-05-24'),
	('1', '3', date '2020-07-22'),
	('2', '4', date '2021-02-02'),
	('3', '2', date '2020-01-05'),
	('3', '2', date '2020-03-08'),
	('3', '2', date '2020-05-14'),
	('4', '3', date '2021-05-04'),
	('5', '4', date '2021-02-24'),
	('6', '2', date '2019-12-21'),
	('6', '1', date '2020-08-10'),
	('6', '2', date '2021-04-07'),
	('7', '3', date '2019-09-29'),
	('8', '4', date '2020-10-03'),
	('8', '4', date '2020-11-04'),
	('9', '2', date '2019-01-24'),
	('9', '2', date '2019-05-15'),
	('9', '2', date '2020-02-27'),
	('9', '2', date '2020-08-03'),
	('10', '3', date '2020-05-24'),
	('10', '1', date '2021-01-11');	


-- Insert new visits and data -- 
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- Insert new owners and emails-- 
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

ALTER TABLE owners ALTER COLUMN age INT NOT NULL;