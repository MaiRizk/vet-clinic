CREATE TABLE patients(
    id INT PRIMARY KEY, 
    name VARCHAR(20), 
    date_of_birth DATE
);

CREATE TABLE medical_histories(
    id INT PRIMARY KEY, 
    admitted_at TIMESTAMP,
    status VARCHAR, 
    patient_id INT,
    CONSTRAINT fk_patient_id 
    FOREIGN KEY(patient_id) REFERENCES patients(id)
);

CREATE TABLE invoices(
    id INT PRIMARY KEY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    CONSTRAINT fk_medical-medical_history_id
    FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE treatments(
    id INT PRIMARY KEY,
    type VARCHAR,
    name VARCHAR
);

CREATE TABLE invoice_items(
    id INT PRIMARY KEY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    CONSTRAINT fk_invoice_id
    FOREIGN KEY(invoice_id) REFERENCES invoices(id)
    treatment_id INT,
    CONSTRAINT fk_treatment_id
    FOREIGN KEY(treatment_id) REFERENCES treatments(id)
);