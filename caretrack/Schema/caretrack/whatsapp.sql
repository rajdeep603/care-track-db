CREATE TABLE IF NOT EXISTS caretrack.whatsapp_configuration (
    record_id SERIAL PRIMARY KEY,
    company_id INTEGER REFERENCES caretrack.companies(record_id),
    twilio_account_sid TEXT,
    twilio_auth_token TEXT,
    twilio_whatsapp_number TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    is_deleted BOOLEAN DEFAULT FALSE,
    description TEXT,
    inserted_by INTEGER,
    insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INTEGER,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

