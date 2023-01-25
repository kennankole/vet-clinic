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

ALTER TABLE invoices
ADD CONSTRAINT fk_medical_history_id
FOREIGN KEY (medical_history__id) REFERENCES medical_histories(id);

/* many-many relation */
CREATE TABLE medical_histories_treatments (medical_history_id INT REFERENCES medical_histories(id),
                                           treatments_id INT REFERENCES treatments(id), 
                                           CONSTRAINT medical_treatments PRIMARY KEY (medical_history_id, treatments_id));



/* Indexes on Foreign Keys */
CREATE INDEX idx_medical_history ON medical_histories(patient_id DESC);
CREATE INDEX idx_treatment_id ON invoice_items(treatment_id DESC);
CREATE INDEX idx_invoice_id ON invoice_items(invoice_id DESC);
CREATE INDEX idx_medical_history ON invoices(medical_history__id DESC);
CREATE INDEX idx_medical_history_id ON invoices(medical_history__id DESC);
CREATE INDEX idx_medical_histories_treatments ON medical_histories_treatments(medical_history_id DESC);
 
