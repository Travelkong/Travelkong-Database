create or replace function verify_refresh_token(refresh_token_id varchar, user_id uuid)
returns boolean
language plpgsql as $$
begin
	return exists(select 1 from refresh_tokens rt where rt.id = $1 and rt.user_id = $2);
end;
$$;
