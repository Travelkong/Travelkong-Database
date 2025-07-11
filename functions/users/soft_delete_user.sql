CREATE OR REPLACE FUNCTION soft_delete_user()
RETURNS TRIGGER AS $deleted_at$
BEGIN
  NEW.deleted_at = CURRENT_TIMESTAMP;
  RETURN NEW;
END;
$deleted_at$ LANGUAGE plpgsql;