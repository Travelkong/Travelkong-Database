CREATE OR REPLACE TRIGGER trg_set_user_created_at BEFORE INSERT ON users
FOR EACH ROW EXECUTE FUNCTION set_user_created_at();