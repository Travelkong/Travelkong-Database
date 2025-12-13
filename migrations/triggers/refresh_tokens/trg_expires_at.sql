create trigger trg_set_expires_at
before update on refresh_tokens
for each row
execute function set_expires_at();