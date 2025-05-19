CREATE TABLE
    if not exists caretrack.invoices (
        record_id SERIAL PRIMARY KEY,
        case_id INT NOT NULL REFERENCES caretrack.cases (record_id),
        qty INT NOT NULL,
        unit_price DECIMAL(10, 2) NOT NULL,
        total_price DECIMAL(10, 2) NOT NULL,
        invoice_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,        
        is_active BOOLEAN DEFAULT true,
        description TEXT,
        is_deleted BOOLEAN DEFAULT false,
        inserted_by INT,
        insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_by INT,
        update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        comments TEXT
    );