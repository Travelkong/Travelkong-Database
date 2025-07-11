create or replace function user_role(user_id uuid)
returns text
language plpgsql as $$
declare
	result text;
begin
	select role into result from users where id = user_id;
	return result;
end;
$$;
