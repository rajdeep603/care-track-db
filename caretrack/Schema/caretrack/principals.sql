CREATE TABLE IF NOT EXISTS caretrack.principals (
    record_id SERIAL PRIMARY KEY,
    business_name VARCHAR(250) NOT NULL,
    email VARCHAR(250),
    alternate_contact_name VARCHAR(250),
    country_code_pl_id INT REFERENCES master.picklist(record_id),
    company_id INT NOT NULL REFERENCES caretrack.companies (record_id),
    alternate_contact_number VARCHAR(250),
    business_image TEXT,
    signature_image TEXT,
    business_description TEXT,
    is_active BOOLEAN DEFAULT true,
    description TEXT,
    is_deleted BOOLEAN DEFAULT false,
    inserted_by INT,
    insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    comments TEXT
);

alter table caretrack.principals
add column if not exists billing_email VARCHAR(250);

alter table caretrack.principals
add column if not exists network_manager_email VARCHAR(250);
