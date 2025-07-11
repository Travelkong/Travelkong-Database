CREATE TABLE
  public.users (
    pk BIGSERIAL PRIMARY KEY,
    id uuid UNIQUE NOT NULL,
    username character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password text NOT NULL,
    profile_picture text NULL,
    role character varying(10) NULL,
    address character varying(300) NULL,
    created_at timestamp with time zone NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp with time zone NULL DEFAULT CURRENT_TIMESTAMP
  );