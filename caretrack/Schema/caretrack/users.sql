CREATE TABLE
    if not exists caretrack.users (
        record_id SERIAL PRIMARY KEY,
        first_name VARCHAR(250) NOT NULL,
        last_name VARCHAR(250) NOT NULL,
        mobile_number VARCHAR(250) NOT NULL,
        email VARCHAR(250) NOT NULL,
        password VARCHAR(250) NOT NULL,
        is_active BOOLEAN DEFAULT true,
        description TEXT,
        user_image TEXT,
        is_deleted BOOLEAN DEFAULT false,
        inserted_by INT,
        insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_by INT,
        update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        comments TEXT
    );