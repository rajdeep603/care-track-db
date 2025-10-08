CREATE TABLE IF NOT EXISTS caretrack.query_communications (
    record_id SERIAL PRIMARY KEY,
    message TEXT NOT NULL,
    image TEXT,
    employee_id INT REFERENCES caretrack.company_employees(record_id),
    query_id INT REFERENCES caretrack.queries(record_id),
    is_active BOOLEAN DEFAULT true,
    is_deleted BOOLEAN DEFAULT false,
    inserted_by INT,
    insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    comments TEXT
);

ALTER TABLE caretrack.query_communications
    ADD COLUMN IF NOT EXISTS query_communication_type_pl_id INT REFERENCES master.picklist(record_id);