create trigger trg_update_created_at
before update on refresh_tokens
for each row
execute function update_created_at();