create or replace function post_from_id(in_post_id varchar(21))
returns jsonb
language plpgsql as $$
declare -- it used to work without the need of declaring a result variable, but removing it now somehow breaks this function.
	result jsonb;
begin
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
	)
	into result
	from posts p
	inner join post_contents pc on pc.post_id = p.id
	inner join post_tags pt on pt.post_id = p.id
	inner join tags t on t.id = pt.tag_id
	where p.id = $1
	group by -- must have since the tags is aggravated; just get everything that's not inside tags in select and you'll be set.
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
		pc.images;

	return result;
end;
$$;
