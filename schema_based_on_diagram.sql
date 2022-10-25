-- Create new tables --

CREATE TABLE patients (
id SERIAL PRIMARY KEY,
name VARCHAR ( 50 ) UNIQUE NOT NULL,
date_of_birth DATE
);

CREATE TABLE medical_histories (
	id SERIAL PRIMARY KEY,
	admitted_at TIMESTAMP NOT NULL,
	status VARCHAR NOT NULL,
 FOREIGN KEY patients_id INT REFERENCES patients(id)
);

CREATE TABLE treatments (
	id  SERIAL PRIMARY KEY,
	type VARCHAR,
	name VARCHAR NOT NULL
);

CREATE TABLE medical_treatments(
  medical_histories_id INT REFERENCES medical_histories(id),
  treatments_id INT REFERENCES treatments(id)
)
