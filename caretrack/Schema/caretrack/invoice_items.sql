CREATE TABLE IF NOT EXISTS caretrack.invoice_items (
    record_id INT serial PRIMARY KEY,
    invoice_id INT NOT NULL REFERENCES caretrack.invoices (record_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
    services TEXT,
    qty INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    is_deleted BOOLEAN DEFAULT false,
    inserted_by INT,
    insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    comments TEXT
);
