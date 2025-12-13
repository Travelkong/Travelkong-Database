create or replace function search_post_and_count(query text, in_limit int, in_offset int)
returns table (result jsonb, count int)
language plpgsql as $$
declare
	result jsonb;
	post_count int default 0;
begin
	select jsonb_agg(row_data)
	into result
	from (
		select jsonb_build_object(
			'post_id', p.id,
			'user_id', p.user_id,
			'likes_count', p.likes_count,
			'comments_count', p.comments_count,
			'views_count', p.views_count,
			'created_at', p.created_at,
			'updated_at', p.updated_at,
			'title', pc.title,
			'cover_image_url', pc.cover_image_url,
			'body', pc.body,
			'images', pc.images::jsonb,
			'tags', jsonb_agg(
				jsonb_build_object(
					'tag_id', t.id,
					'tag_name', t.name
				)
			)
		) as row_data
		from post_contents pc
		inner join posts p on pc.post_id = p.id
		inner join post_tags pt on pt.post_id = p.id
		inner join tags t on t.id = pt.tag_id
		where pc.title &@~ $1
		group by
			p.id,
			p.user_id,
			p.likes_count,
			p.comments_count,
			p.views_count,
			p.created_at,
			p.updated_at,
			pc.title,
			pc.cover_image_url,
			pc.body,
			pc.images
		order by p.created_at desc
		limit $2 offset $3
	);

	select COUNT(*) into post_count from post_contents where title &@~ $1;
	return query select result, post_count;
end;
$$;
