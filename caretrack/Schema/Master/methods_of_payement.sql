CREATE TABLE master.hospitals_method_of_payments (
    record_id SERIAL PRIMARY KEY,
    hospital_id INTEGER,
    method_of_payment_pl_id INTEGER,
    is_active BOOLEAN DEFAULT TRUE,
    description TEXT,
    is_deleted BOOLEAN DEFAULT FALSE,
    inserted_by INTEGER,
    insert_date_time TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    updated_by INTEGER,
    update_date_time TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    comments TEXT
);