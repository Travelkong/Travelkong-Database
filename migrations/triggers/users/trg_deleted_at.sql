CREATE OR REPLACE TRIGGER trg_set_user_deleted_at BEFORE UPDATE ON users
FOR EACH ROW WHEN (OLD.deleted_at IS NULL) EXECUTE FUNCTION soft_delete_user();