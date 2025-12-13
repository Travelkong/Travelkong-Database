create or replace function delete_post(in_post_id varchar(21))
returns table(deleted_count integer) language plpgsql as $$
declare
	rows_affected integer;
begin
	delete from posts p using post_contents pc where p.id = pc.post_id and p.id = $1;
	get diagnostics rows_affected = row_count;
	return query select rows_affected;
end;
$$;