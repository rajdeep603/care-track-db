CREATE TABLE IF NOT EXISTS master.hospitals (
    record_id SERIAL PRIMARY KEY,
    business_name VARCHAR(250) NOT NULL,
    email VARCHAR(250),
    alternate_contact_name VARCHAR(250),
    alternate_contact_number VARCHAR(250),
    business_image VARCHAR(255),
    signature_image VARCHAR(255),
    business_description TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    description TEXT,
    is_deleted BOOLEAN DEFAULT FALSE,
    inserted_by INT,
    insert_date_time TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    updated_by INT,
    update_date_time TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    comments TEXT
);


alter table master.hospitals
add column if not exists review TEXT;

alter table master.hospitals
add column if not exists price_starting_from DECIMAL(10, 2);

alter table master.hospitals
add column if not exists price_ending_at DECIMAL(10, 2);

alter table master.hospitals
    add column if not exists ratings INT;

    ALTER TABLE master.hospitals
ALTER COLUMN ratings TYPE DECIMAL(10, 2);

alter table master.hospitals
    add column if not exists hospital_type_pl_id int references master.picklist(record_id);



    Alter table master.hospitals
        add column if not exists company_id INT REFERENCES caretrack.companies(record_id);
