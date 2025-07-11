CREATE TABLE IF NOT EXISTS
  public.post_contents (
    pk BIGSERIAL PRIMARY KEY,
    id VARCHAR(21) UNIQUE NOT NULL,
    post_id VARCHAR(21) UNIQUE NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
    title VARCHAR(200) NOT NULL,
    cover_image_url TEXT NULL,
    body TEXT NOT NULL,
    images JSONB
  );