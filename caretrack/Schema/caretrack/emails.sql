CREATE TABLE IF NOT EXISTS caretrack.emails (
    record_id SERIAL PRIMARY KEY,
    from_email TEXT,
    to_email TEXT,
    title TEXT,
    body TEXT,
    email_status_pl_id INTEGER REFERENCES caretrack.master.picklist(record_id),
    is_deleted BOOLEAN DEFAULT FALSE,
    description TEXT,
    inserted_by INTEGER,
    insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INTEGER,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Add columns one by one to handle any existing data
ALTER TABLE caretrack.emails 
ADD COLUMN IF NOT EXISTS message_id VARCHAR(255),                    -- Original Message-ID header
ADD COLUMN IF NOT EXISTS in_reply_to VARCHAR(255),                   -- In-Reply-To header
ADD COLUMN IF NOT EXISTS "references" TEXT,                          -- References header (complete thread chain)
ADD COLUMN IF NOT EXISTS thread_id VARCHAR(255),                     -- Custom thread identifier
ADD COLUMN IF NOT EXISTS parent_email_id INT REFERENCES caretrack.emails(record_id), -- Parent email record ID
ADD COLUMN IF NOT EXISTS reply_level INT DEFAULT 0,                  -- Reply depth (0=original, 1=first reply, etc.)
ADD COLUMN IF NOT EXISTS conversation_subject VARCHAR(500),          -- Clean subject without Re: Fwd: prefixes
ADD COLUMN IF NOT EXISTS is_reply BOOLEAN DEFAULT FALSE,             -- Quick flag to identify replies
ADD COLUMN IF NOT EXISTS reply_type VARCHAR(20) DEFAULT 'new',       -- 'new', 'reply', 'forward'
ADD COLUMN IF NOT EXISTS original_date TIMESTAMP,                    -- Date of original email in thread
ADD COLUMN IF NOT EXISTS last_reply_date TIMESTAMP DEFAULT NOW(),    -- Last reply in this conversation
ADD COLUMN IF NOT EXISTS is_sent BOOLEAN DEFAULT FALSE,
ADD COLUMN IF NOT EXISTS cc_email TEXT,
ADD COLUMN IF NOT EXISTS bcc_email TEXT,
ADD COLUMN IF NOT EXISTS is_read TEXT DEFAULT 'false';         -- Read status (true/false);


-- Create indexes
CREATE INDEX IF NOT EXISTS idx_emails_message_id ON caretrack.emails(message_id);
CREATE INDEX IF NOT EXISTS idx_emails_thread_id ON caretrack.emails(thread_id);
CREATE INDEX IF NOT EXISTS idx_emails_parent_email_id ON caretrack.emails(parent_email_id);
CREATE INDEX IF NOT EXISTS idx_emails_conversation_subject ON caretrack.emails(conversation_subject);
CREATE INDEX IF NOT EXISTS idx_emails_reply_type ON caretrack.emails(reply_type);

ALTER TABLE caretrack.emails
ADD COLUMN IF NOT EXISTS nylas_email_configuration_id INT REFERENCES caretrack.nylas_email_configuration(record_id);

ALTER TABLE caretrack.emails
ADD COLUMN IF NOT EXISTS reply_to_message_id INT REFERENCES caretrack.emails(record_id);

-- Add foreign key constraint (remove IF NOT EXISTS)
-- ALTER TABLE caretrack.emails 
-- ADD CONSTRAINT IF NOT EXISTS fk_emails_parent FOREIGN KEY (parent_email_id) REFERENCES caretrack.emails(record_id);