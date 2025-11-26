CREATE TABLE IF NOT EXISTS caretrack.cases_to_do_list(
    record_id SERIAL PRIMARY KEY,
    case_provider_id INT NOT NULL REFERENCES master.cases_hospitals(record_id),
    service TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    description TEXT,
    is_deleted BOOLEAN DEFAULT FALSE,
    inserted_by INT,
    insert_date_time TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    updated_by INT,
    update_date_time TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    comments TEXT
);
 