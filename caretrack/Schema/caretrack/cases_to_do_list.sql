CREATE TABLE IF NOT EXISTS caretrack.cases_to_do_list(
    record_id SERIAL PRIMARY KEY,
    case_id INT NOT NULL REFERENCES caretrack.cases(record_id),
    employee_id INT REFERENCES caretrack.company_employees(record_id),
    to_do_status_pl_id INT REFERENCES master.picklist(record_id),
    title TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    description TEXT,
    is_deleted BOOLEAN DEFAULT FALSE,
    inserted_by INT,
    insert_date_time TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    updated_by INT,
    update_date_time TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    comments TEXT
);

alter table caretrack.cases_to_do_list
    add column if not exists start_date TIMESTAMP(6);

alter table caretrack.cases_to_do_list
    add column if not exists end_date TIMESTAMP(6);    