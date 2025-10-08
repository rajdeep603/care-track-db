CREATE TABLE IF NOT EXISTS master.picklist (
    record_id SERIAL PRIMARY KEY,
    picklist_type_id INT REFERENCES master.picklist_type (record_id),
    pvalue VARCHAR(250) NOT NULL,
    parent_id INT,
    order_num INT,
    search_condition TEXT,
    description TEXT,
    image_url TEXT,
    is_active BOOLEAN DEFAULT true,
    is_deleted BOOLEAN DEFAULT false,
    inserted_by INT,
    insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    display_value VARCHAR(255),
    is_translation BOOLEAN DEFAULT false,
    CONSTRAINT fk_picklist_type FOREIGN KEY (picklist_type_id) REFERENCES master.picklist_type (record_id),
    CONSTRAINT fk_parent_id FOREIGN KEY (parent_id) REFERENCES master.picklist (record_id)
);


    Alter table master.picklist
        add column if not exists isDefault BOOLEAN DEFAULT true;

    Alter table master.picklist
        add column if not exists company_id INT REFERENCES caretrack.companies(record_id);
