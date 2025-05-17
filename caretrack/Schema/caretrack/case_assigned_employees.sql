CREATE TABLE IF NOT EXISTS caretrack.case_assigned_employees (
    record_id SERIAL PRIMARY KEY,  
    case_id INT NOT NULL REFERENCES caretrack.cases (record_id),
    company_employee_id INT NOT NULL REFERENCES caretrack.company_employees (record_id),     
    is_current BOOLEAN DEFAULT true,                          
    is_active BOOLEAN DEFAULT true,
    is_deleted BOOLEAN DEFAULT false,                      
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


