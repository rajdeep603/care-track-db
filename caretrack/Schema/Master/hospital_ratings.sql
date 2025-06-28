CREATE TABLE IF NOT EXISTS master.hospital_ratings (
    record_id SERIAL PRIMARY KEY,
    hospital_id INT NOT NULL REFERENCES master.hospitals (record_id),
    case_id INT NOT NULL REFERENCES caretrack.cases (record_id),
    employee_id INT NOT NULL REFERENCES caretrack.company_employees (record_id),
    rating INT ,
    review TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    description TEXT,
    is_deleted BOOLEAN DEFAULT FALSE,
    inserted_by INT,
    insert_date_time TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    updated_by INT,
    update_date_time TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    comments TEXT
);

alter table master.hospital_ratings
add column if not exists price_starting_from DECIMAL(10, 2);

alter table master.hospital_ratings
add column if not exists price_ending_at DECIMAL(10, 2);

