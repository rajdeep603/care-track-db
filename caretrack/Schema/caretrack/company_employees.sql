CREATE TABLE IF NOT EXISTS caretrack.company_employees (
    record_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES caretrack.users (record_id),
    company_id INT NOT NULL REFERENCES caretrack.companies (record_id), 
    is_primary BOOLEAN DEFAULT false,
    is_deleted BOOLEAN DEFAULT false,
    inserted_by INT,
    insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    comments TEXT,
    UNIQUE (user_id, company_id, is_primary) 
);

alter table caretrack.company_employees
    add column if not exists login_start_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
alter table caretrack.company_employees
    add column if not exists login_end_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP;    
