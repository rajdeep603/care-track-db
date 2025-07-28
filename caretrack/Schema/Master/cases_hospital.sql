CREATE TABLE master.cases_hospitals (
    record_id SERIAL PRIMARY KEY,
    case_id INTEGER,
    hospital_id INTEGER,
    is_active BOOLEAN DEFAULT TRUE,
    description TEXT,
    is_deleted BOOLEAN DEFAULT FALSE,
    inserted_by INTEGER,
    insert_date_time TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    updated_by INTEGER,
    update_date_time TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    comments TEXT
);

ALTER TABLE master.cases_hospitals
  ADD CONSTRAINT fk_case_id
  FOREIGN KEY (case_id)
  REFERENCES caretrack.cases(record_id);

ALTER TABLE master.cases_hospitals
  ADD CONSTRAINT fk_hospital_id
  FOREIGN KEY (hospital_id)
  REFERENCES master.hospitals(record_id);