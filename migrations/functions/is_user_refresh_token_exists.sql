create or replace function is_user_refresh_token_exists(user_id uuid)
returns boolean
language plpgsql as $$
begin
	return exists(select 1 from refresh_tokens where refresh_tokens.user_id = $1);
end;
$$;