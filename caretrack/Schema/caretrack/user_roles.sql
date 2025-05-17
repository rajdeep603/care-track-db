CREATE TABLE
    if not exists caretrack.user_roles (
        record_id SERIAL PRIMARY KEY,
        user_id INT NOT NULL REFERENCES caretrack.users (record_id),
        role_id INT NOT NULL REFERENCES master.roles (record_id),
        is_primary BOOLEAN DEFAULT false,
        is_deleted BOOLEAN DEFAULT false,
        inserted_by INT,
        insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_by INT,
        update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        comments TEXT,
        UNIQUE (user_id, role_id)
    );

    