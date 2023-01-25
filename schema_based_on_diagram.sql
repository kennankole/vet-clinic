CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEY,
    admitted_at DATE,
    patient_id INT,
    status VARCHAR(255)
);

CREATE TABLE treatments(
    id SERIAL PRIMARY KEY,
    type VARCHAR(100),
    name VARCHAR(255)
);


CREATE TABLE patients(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE
);

CREATE TABLE invoices(
    id SERIAL PRIMARY KEY,
    total_amount FLOAT,
    genetate_at TIMESTAMP,
    played_at TIMESTAMP,
    medical_history__id INT
);

CREATE TABLE invoice_items(
    id SERIAL PRIMARY KEY,
    unit_price FLOAT,
    quantity INT,
    total_price FLOAT,
    invoice_id INT,
    treatment_id INT
);

ALTER TABLE medical_histories 
ADD CONSTRAINT fk_patient_id
FOREIGN KEY (patient_id) REFERENCES patients(id);

ALTER TABLE invoice_items 
ADD CONSTRAINT fk_invoice_id
FOREIGN KEY (invoice_id) REFERENCES invoices(id);


ALTER TABLE invoice_items
ADD CONSTRAINT fk_treatment_id
FOREIGN KEY (treatment_id) REFERENCES treatments(id);





