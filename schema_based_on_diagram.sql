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

CREATE TABLE invoices (
	id  SERIAL PRIMARY KEY,
	total_amount DECIMAL,
	generated_at TIMESTAMP,
	payed_at TIMESTAMP,
	FOREIGN KEY medical_history__id INT REFERENCES medical_histories(id),
);

CREATE TABLE invoice_items (
	id  SERIAL PRIMARY KEY,
	unit_price DECIMAL,
	quantity INT,
	total_price DECIMAL,
	FOREIGN KEY invoice_id INT REFERENCES invoices(id),
	FOREIGN KEY treatment_id INT REFERENCES treatments(id),
);

----- Performance------

CREATE INDEX patients_index ON medical_histories(patient_id)
CREATE INDEX medical_histories_index ON invoices(medical_history__id)
CREATE INDEX invoice_index ON invoice_items(invoice_id)
CREATE INDEX treatments_index ON invoice_items(treatment_id)
CREATE INDEX medical_treatments_index ON medical_treatments(medical_histories_id)
CREATE INDEX treatments_index_ ON medical_treatments(treatment_id)
