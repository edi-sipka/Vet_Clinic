/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
	id SERIAL PRIMARY KEY,
	name VARCHAR ( 50 ) UNIQUE NOT NULL,
	date_of_birth DATE NOT NULL,
	escape_attempts NUMERIC UNIQUE NOT NULL,
	neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
);