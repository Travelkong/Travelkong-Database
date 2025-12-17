create function remove_post_tags(in_tag_id varchar(21), in_post_id varchar(21))
returns table(deleted_count integer)
language plpgsql as $$
declare
	rows_affected integer;
begin
	delete from post_tags pt where pt.tag_id = $1 and pt.post_id = $2;
	get diagnostics rows_affected = row_count;
	return query select rows_affected;
end;
$$;
