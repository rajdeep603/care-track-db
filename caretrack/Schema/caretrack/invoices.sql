ALTER TABLE caretrack.invoices
    ADD COLUMN IF NOT EXISTS currency_symbol VARCHAR(10);