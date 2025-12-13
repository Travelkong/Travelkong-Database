create or replace function update_refresh_token(token_id text, user_id uuid, "token" text)
returns int
language plpgsql as $$
declare rows_updated int;
begin
	update refresh_tokens set id = $1, "token" = $3 where refresh_tokens.user_id = $2;
	get diagnostics rows_updated = ROW_COUNT;
	return rows_updated;
end;
$$;
