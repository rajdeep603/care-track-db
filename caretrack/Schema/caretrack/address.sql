CREATE TABLE IF NOT EXISTS caretrack.address (
    record_id SERIAL PRIMARY KEY,                                 
    address_line_1 VARCHAR(255) NOT NULL,
    address_line_2 VARCHAR(255),          
    -- city_pl_id INT NOT NULL REFERENCES master.picklist(record_id),           
    -- state_pl_id INT NOT NULL REFERENCES master.picklist(record_id),          
    -- pincode_pl_id INT NOT NULL REFERENCES master.picklist(record_id),     
    country_pl_id INT NOT NULL REFERENCES master.picklist(record_id),  
    village_pl_id INT REFERENCES master.picklist(record_id),    
    latitude DECIMAL(10, 8),             
    longitude DECIMAL(11, 8), 
    is_active BOOLEAN DEFAULT true,
    is_deleted BOOLEAN DEFAULT false,          
    address_type_id INT NOT NULL REFERENCES master.picklist(record_id),             
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id INT REFERENCES caretrack.users (record_id),
    is_primary BOOLEAN DEFAULT false
);


alter table caretrack.address
    drop column if exists state_pl_id;

alter table caretrack.address
    drop column if exists pincode_pl_id;

alter table caretrack.address
    drop column if exists city_pl_id;

alter table caretrack.address
    add column if not exists state Text;
alter table caretrack.address
    add column if not exists pincode Text;
 alter table caretrack.address
    add column if not exists city Text;  

alter table caretrack.address
    drop column if exists latitude;       

alter table caretrack.address
    drop column if exists longitude;      

alter table caretrack.address
  add column if not exists latitude Text;    

alter table caretrack.address
    add column if not exists longitude Text;
