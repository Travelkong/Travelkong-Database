create or replace function set_expires_at()
returns trigger as $$
begin
	NEW.expires_at := NEW.created_at + interval '7 days';
    return new;
end;
$$ language plpgsql;
