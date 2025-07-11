CREATE OR REPLACE FUNCTION set_created_at()
RETURNS TRIGGER AS $created_at$
BEGIN
    IF NEW.created_at IS NULL THEN
      NEW.created_at = CURRENT_TIMESTAMP;
  END IF;
  RETURN NEW;
END;
$created_at$ LANGUAGE plpgsql;