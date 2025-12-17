CREATE OR REPLACE TRIGGER trg_set_user_updated_at BEFORE UPDATE ON users
FOR EACH ROW EXECUTE FUNCTION set_user_updated_at();
