CREATE TABLE IF NOT EXISTS caretrack.case_addresses (
    record_id SERIAL PRIMARY KEY,    
    case_id INT NOT NULL REFERENCES caretrack.cases (record_id), 
    -- address_type_pl_id INT NOT NULL REFERENCES master.picklist(record_id),     
    present_street VARCHAR(255),
    present_building VARCHAR(255),
    present_city VARCHAR(255),
    present_state_pl_id INT REFERENCES master.picklist(record_id),
    present_country_pl_id INT REFERENCES master.picklist(record_id),
    present_postal_code VARCHAR(20),
    prsent_full_address TEXT,
    permanent_street VARCHAR(255),
    permanent_building VARCHAR(255),
    permanent_city VARCHAR(255),
    permanent_state_pl_id INT REFERENCES master.picklist(record_id),
    permanent_country_pl_id INT REFERENCES master.picklist(record_id),
    permanent_postal_code VARCHAR(20),
    permanent_full_address TEXT,
    is_active BOOLEAN DEFAULT true,
    is_deleted BOOLEAN DEFAULT false,                     
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_primary BOOLEAN DEFAULT false
);


