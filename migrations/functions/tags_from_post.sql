create function tags_from_post(in_post_id varchar(21))
returns table(tag_id varchar(21))
language plpgsql as $$
begin
	return query (
		select t.name
		from tags t
		inner join post_tags pt on t.id = pt.tag_id
		where pt.post_id = $1
	);
end;
$$;
