CREATE TABLE IF NOT EXISTS caretrack.queries (
    record_id SERIAL PRIMARY KEY,
    title VARCHAR(250) NOT NULL,
    description TEXT,
    image TEXT,
    company_id INT REFERENCES caretrack.companies(record_id),
    employee_id INT REFERENCES caretrack.company_employees(record_id),
    query_status_pl_id INT REFERENCES master.picklist(record_id),
    is_active BOOLEAN DEFAULT true,
    is_deleted BOOLEAN DEFAULT false,
    inserted_by INT,
    insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    comments TEXT
);
