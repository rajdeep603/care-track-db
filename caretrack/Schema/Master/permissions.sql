CREATE TABLE IF NOT EXISTS master.permissions (
    record_id SERIAL PRIMARY KEY,
    permission_name VARCHAR(100) NOT NULL,
    parent_permission_id INTEGER,
    description TEXT,
    is_deleted BOOLEAN DEFAULT FALSE,
    inserted_by INTEGER,
    insert_date_time TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    updated_by INTEGER,
    update_date_time TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    comments TEXT,
    
    CONSTRAINT permissions_parent_permission_id_fkey
        FOREIGN KEY (parent_permission_id)
        REFERENCES master.permissions(record_id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);