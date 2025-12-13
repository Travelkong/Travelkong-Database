create or replace function logout (user_id uuid)
returns int
language plpgsql as $$
declare rows_deleted int;
begin
	delete from refresh_tokens rt where rt.user_id = $1;
get diagnostics rows_deleted = ROW_COUNT;
return rows_deleted;
end;
$$;