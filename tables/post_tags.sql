CREATE TABLE IF NOT EXISTS post_tags (
    post_id VARCHAR(21) REFERENCES posts(id) ON DELETE CASCADE,
    tag_id VARCHAR(21) REFERENCES tags(id) ON DELETE CASCADE,
    PRIMARY KEY (post_id, tag_id)
);
