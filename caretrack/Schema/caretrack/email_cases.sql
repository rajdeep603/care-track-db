CREATE TABLE IF NOT EXISTS caretrack.email_cases (
    record_id SERIAL PRIMARY KEY,
    case_id INT NOT NULL REFERENCES caretrack.cases(record_id),
    email_id INT NOT NULL REFERENCES caretrack.emails(record_id),
    is_active BOOLEAN DEFAULT TRUE,
    description TEXT,
    is_deleted BOOLEAN DEFAULT FALSE,
    inserted_by INT,
    insert_date_time TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    updated_by INT,
    update_date_time TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    comments TEXT
);