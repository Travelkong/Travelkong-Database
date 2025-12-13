create or replace function update_created_at()
returns trigger as $$
begin
	NEW.created_at := now();
    return NEW;
end;
$$ language plpgsql;