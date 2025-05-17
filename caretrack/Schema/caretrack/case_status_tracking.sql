CREATE TABLE IF NOT EXISTS caretrack.case_status_tracking (
    record_id SERIAL PRIMARY KEY,
    case_id INT REFERENCES caretrack.cases (record_id),
    case_status_id INT NOT NULL REFERENCES master.case_statuses (record_id),
    is_active BOOLEAN DEFAULT true,
    is_deleted BOOLEAN DEFAULT false,
    insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    comments TEXT
);
