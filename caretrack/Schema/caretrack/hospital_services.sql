CREATE TABLE
    if not exists caretrack.hospital_services (
        record_id SERIAL PRIMARY KEY,
        hospital_id INT REFERENCES master.hospitals (record_id),
        service_id INT REFERENCES master.picklist (record_id),
        description TEXT,
        is_active BOOLEAN DEFAULT true,
        inserted_by INT REFERENCES caretrack.users (record_id),
        insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_by INT,
        update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        comments TEXT
    );

