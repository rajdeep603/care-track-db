CREATE TABLE
    if not exists caretrack.cases_documents (
        record_id SERIAL PRIMARY KEY,
        case_id INT NOT NULL REFERENCES caretrack.cases (record_id),
        document_pl_id INT REFERENCES master.picklist (record_id),
        others TEXT ,
        document_url TEXT,
        is_active BOOLEAN DEFAULT true,
        is_deleted BOOLEAN DEFAULT false,
        inserted_by INT,
        insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_by INT,
        update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        comments TEXT
    );

