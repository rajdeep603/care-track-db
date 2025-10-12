CREATE TABLE IF NOT EXISTS caretrack.email_thread_participants (
    record_id SERIAL PRIMARY KEY,
    thread_id VARCHAR(255) NOT NULL,
    email_address VARCHAR(255) NOT NULL,
    participant_type VARCHAR(10) NOT NULL, -- 'from', 'to', 'cc', 'bcc'
    first_seen TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    last_seen TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    email_count INTEGER DEFAULT 1,
    is_active BOOLEAN DEFAULT TRUE,
    inserted_by INTEGER,
    insert_date_time TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6),
    updated_by INTEGER,
    update_date_time TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP(6)
);

-- Add unique constraint
ALTER TABLE caretrack.email_thread_participants 
ADD CONSTRAINT uk_thread_participants_unique 
UNIQUE (thread_id, email_address, participant_type);

-- Create indexes
CREATE INDEX IF NOT EXISTS idx_thread_participants_thread_id ON caretrack.email_thread_participants(thread_id);
CREATE INDEX IF NOT EXISTS idx_thread_participants_email ON caretrack.email_thread_participants(email_address);
CREATE INDEX IF NOT EXISTS idx_thread_participants_type ON caretrack.email_thread_participants(participant_type);


ALTER TABLE caretrack.email_thread_participants
ADD COLUMN IF NOT EXISTS reply_to_message_id INT REFERENCES caretrack.emails(record_id);


ALTER TABLE caretrack.email_thread_participants
ADD COLUMN IF NOT EXISTS root_message_id INT REFERENCES caretrack.emails(record_id);

