create or replace function find_user_refresh_token(user_id uuid, token text)
returns table(id uuid, email character varying, role character varying)
language plpgsql as $function$
begin
	return query select u.id, u.email, u.role from users u
	inner join refresh_tokens rf
	on u.id = rf.user_id
	where rf.user_id = $1 and rf.token = $2;
end;

$function$;