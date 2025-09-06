CREATE TABLE IF NOT EXISTS caretrack.cases (
    record_id SERIAL PRIMARY KEY,
    company_id INT REFERENCES caretrack.companies (record_id),
    benificiary_salutation_pl_id INT REFERENCES master.picklist(record_id),
    benificiary_first_name VARCHAR(250) NOT NULL,
    hospital_id INT REFERENCES master.hospitals (record_id),
    case_file_type_pl_id INT REFERENCES master.picklist(record_id),
    case_status_pl_id INT REFERENCES master.picklist(record_id),
    country_code_pl_id INT REFERENCES master.picklist(record_id),
    state_pl_id INT REFERENCES master.picklist(record_id),
    country_pl_id INT REFERENCES master.picklist(record_id),
    severity_pl_id INT REFERENCES master.picklist(record_id),
    service_pl_id INT REFERENCES master.picklist(record_id),
    benificiary_last_name VARCHAR(250) NOT NULL,
    benificiary_maiden_name VARCHAR(250),
    benificiary_contact_title VARCHAR(250),
    benificiary_date_of_birth DATE,
    benificiary_ssn VARCHAR(250),
    benificiary_health_care_number VARCHAR(250),
    benificiary_email VARCHAR(250),
    benificiary_contact_number VARCHAR(250),
    benificiary_alternate_contact_number VARCHAR(250),
    benificairy_fax VARCHAR(250),
    principal_id INT NOT NULL REFERENCES caretrack.principals (record_id),
    principal_branch_id INT NOT NULL REFERENCES caretrack.principal_branches (record_id),
    principal_ref VARCHAR(250) NOT NULL,
    principal_salutation_pl_id INT REFERENCES master.picklist(record_id),
    principal_first_name VARCHAR(250),
    principal_last_name VARCHAR(250),
    principal_email VARCHAR(250),
    principal_contact_number VARCHAR(250),
    principal_alternate_contact_number VARCHAR(250),
    principal_fax VARCHAR(250),
    principal_contact_title VARCHAR(250),
    method_of_transportation_pl_id INT REFERENCES master.picklist(record_id),
    carrier_number VARCHAR(250),
    flght_time TIMESTAMP,
    resa_number VARCHAR(250),
    case_state_pl_id INT NOT NULL REFERENCES master.picklist(record_id),
    issue_description TEXT NOT NULL,
    is_active BOOLEAN DEFAULT true,
    description TEXT,
    is_deleted BOOLEAN DEFAULT false,
    inserted_by INT,
    insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    comments TEXT
);

alter table caretrack.cases
    add column if not exists zone_pl_id int REFERENCES master.picklist(record_id);


alter table caretrack.cases
 drop column if exists hospital_id;    

