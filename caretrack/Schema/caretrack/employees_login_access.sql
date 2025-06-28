CREATE TABLE
    if not exists caretrack.employees_login_access (
        record_id SERIAL PRIMARY KEY,
        employee_id INT NOT NULL REFERENCES caretrack.company_employees (record_id),
        login_start_time TIMESTAMP  ,
        login_end_time TIMESTAMP,
        description TEXT,
        is_active BOOLEAN DEFAULT true,
        is_deleted BOOLEAN DEFAULT false,
        inserted_by INT,
        insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_by INT,
        update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        comments TEXT
    );
