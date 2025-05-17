CREATE TABLE IF NOT EXISTS caretrack.cases_communication (
    record_id SERIAL PRIMARY KEY,
    company_employee_id INT NOT NULL REFERENCES caretrack.company_employees (record_id),
    case_id INT NOT NULL REFERENCES caretrack.cases (record_id),
    is_active BOOLEAN DEFAULT true,
    description TEXT,
    is_deleted BOOLEAN DEFAULT false,
    inserted_by INT,
    insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    comments TEXT,
    title VARCHAR(250) ,
    communication_type_pl_id INT NOT NULL REFERENCES master.picklist (record_id)
);
--title , communication_type_pl_id(Email, communication), 





