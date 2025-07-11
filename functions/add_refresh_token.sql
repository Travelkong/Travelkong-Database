create or replace
function add_refresh_token(token_id text, user_id uuid, token text)
returns int
language plpgsql as $$
declare
row_count int;

begin
	insert into refresh_tokens (id, user_id, "token") values ($1, $2, $3);

get diagnostics row_count = ROW_COUNT;

return row_count;
end;

$$;