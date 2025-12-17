CREATE OR REPLACE FUNCTION set_user_updated_at()
RETURNS TRIGGER AS $updated_at$
BEGIN
  NEW.updated_at = CURRENT_TIMESTAMP;
  RETURN NEW;
END;
$updated_at$ LANGUAGE plpgsql;