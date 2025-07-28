CREATE TABLE IF NOT EXISTS master.document_templates (
    record_id SERIAL PRIMARY KEY,
    template_url TEXT,
    template_type_pl_id INT REFERENCES master.picklist(record_id),
    is_active BOOLEAN DEFAULT TRUE,
    description TEXT,
    is_deleted BOOLEAN DEFAULT FALSE,
    inserted_by INT,
    insert_date_time TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    updated_by INT,
    update_date_time TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    comments TEXT
);

