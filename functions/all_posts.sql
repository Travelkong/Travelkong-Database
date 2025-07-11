create or replace function all_posts()
returns jsonb
language plpgsql as $$
declare
	result jsonb;
begin
	select jsonb_agg(row_data)
	into result
	from ( -- this is a cte but without a name
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
		from posts p
		inner join post_contents pc on pc.post_id = p.id
		inner join post_tags pt on pt.post_id = p.id
		inner join tags t on t.id = pt.tag_id
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
	);

	return result;
end;
$$;
