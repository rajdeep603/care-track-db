CREATE TABLE IF NOT EXISTS caretrack.user_permissions (
    record_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES caretrack.users (record_id),
    permission_id INT REFERENCES master.permissions (record_id),
    description TEXT,
    is_deleted BOOLEAN DEFAULT FALSE,
    inserted_by INT,
    insert_date_time TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    updated_by INT,
    update_date_time TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6)
);

