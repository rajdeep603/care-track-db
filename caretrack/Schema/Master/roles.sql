CREATE TABLE
    if not exists master.roles (
        record_id SERIAL PRIMARY KEY,
        name VARCHAR(250) UNIQUE NOT NULL,
        description TEXT,
        is_active BOOLEAN DEFAULT true,
        is_deleted BOOLEAN DEFAULT false,
        inserted_by INT,
        insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_by INT,
        update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        comments TEXT
    );