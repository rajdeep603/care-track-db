
CREATE TABLE IF NOT EXISTS caretrack.user_permissions (
    record_id SERIAL PRIMARY KEY,
    user_id INTEGER,
    permission_id INTEGER,
    description TEXT,
    is_deleted BOOLEAN DEFAULT FALSE,
    inserted_by INTEGER,
    insert_date_time TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    updated_by INTEGER,
    update_date_time TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),

    CONSTRAINT user_permissions_user_id_fkey
        FOREIGN KEY (user_id)
        REFERENCES caretrack.users(record_id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,

    CONSTRAINT user_permissions_permission_id_fkey
        FOREIGN KEY (permission_id)
        REFERENCES master.permissions(record_id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);
