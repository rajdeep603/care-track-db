CREATE TABLE IF NOT EXISTS caretrack.email_attachments (
  record_id SERIAL PRIMARY KEY,
  email_id INT NOT NULL,
  filename VARCHAR(255) NOT NULL,
  content_type VARCHAR(100),
  file_size BIGINT,
  
  -- Personal attachment fields
  file_path VARCHAR(500),                               -- Local file storage path for personal files
  
  -- Case document reference fields
  case_document_id INT,                                 -- Reference to cases_documents table
  case_id INT,                                          -- Reference to cases table (for filtering)
  
  -- Email-specific fields
  content_id VARCHAR(255),                             -- For inline attachments (images in email body)
  is_inline BOOLEAN DEFAULT FALSE,                     -- Inline vs attachment
  
  -- Metadata
  uploaded_by INT,                                      -- User who attached this file
  attached_at TIMESTAMP DEFAULT NOW(),
  description TEXT,                                     -- Optional description/notes
  
  -- Constraints and References
  FOREIGN KEY (email_id) REFERENCES caretrack.emails(record_id) ON DELETE CASCADE,
  FOREIGN KEY (case_document_id) REFERENCES caretrack.cases_documents(record_id) ON DELETE SET NULL,
  FOREIGN KEY (case_id) REFERENCES caretrack.cases(record_id) ON DELETE SET NULL,
  FOREIGN KEY (uploaded_by) REFERENCES caretrack.users(record_id) ON DELETE SET NULL

);