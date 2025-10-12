CREATE TABLE IF NOT EXISTS caretrack.nylas_email_configuration (
    record_id SERIAL PRIMARY KEY,
    grant_id VARCHAR(250) NOT NULL,
    email_address VARCHAR(250),
    company_id INT REFERENCES caretrack.companies(record_id),
    search_condition TEXT,
    description TEXT,
    is_active BOOLEAN DEFAULT true,
    is_deleted BOOLEAN DEFAULT false,
    inserted_by INT,
    insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

