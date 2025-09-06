CREATE TABLE IF NOT EXISTS master.permissions (
    record_id SERIAL PRIMARY KEY,
    permission_name VARCHAR(100) NOT NULL,
    parent_permission_id INT REFERENCES master.permissions (record_id),
    description TEXT,
    is_deleted BOOLEAN DEFAULT FALSE,
    inserted_by INT,
    insert_date_time TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    updated_by INT,
    update_date_time TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    comments TEXT
);

