CREATE TABLE IF NOT EXISTS caretrack.case_provider_charges(
    record_id SERIAL PRIMARY KEY,
    case_provider_id INT NOT NULL REFERENCES master.cases_hospitals(record_id),
    service TEXT,
    charge_amount DECIMAL(15,2) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    description TEXT,
    is_deleted BOOLEAN DEFAULT FALSE,
    inserted_by INT,
    insert_date_time TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    updated_by INT,
    update_date_time TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    comments TEXT
);
 