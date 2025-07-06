CREATE TABLE IF NOT EXISTS master.hospitals_method_of_payments (
    record_id SERIAL PRIMARY KEY,
    hospital_id INT  REFERENCES master.hospitals(record_id),
    method_of_payment_pl_id INT REFERENCES master.picklist(record_id),
    is_active BOOLEAN DEFAULT TRUE,
    description TEXT,
    is_deleted BOOLEAN DEFAULT FALSE,
    inserted_by INT,
    insert_date_time TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    updated_by INT,
    update_date_time TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    comments TEXT
);

