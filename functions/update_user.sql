create or replace function update_user(in_user_id varchar(21))
returns int language plpgsql as $$
declare updated_count int;
begin
	update posts p set p.user_id = $1;
	get diagnostics updated_count = ROW_COUNT;
	return updated_count;
end;
$$;

