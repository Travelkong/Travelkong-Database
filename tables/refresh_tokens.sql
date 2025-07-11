create table public.refresh_tokens(
	pk bigserial primary key,
	id text not null,
	user_id uuid not null references users(id) on delete cascade,
	token text not null,
	created_at timestamptz DEFAULT CURRENT_TIMESTAMP,
  	expires_at timestamptz,
  	user_agent text null,
  	ip text null
);
