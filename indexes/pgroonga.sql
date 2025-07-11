create extension if not exists pgroonga;

create index pgroonga_title_index
on post_contents
using pgroonga (title pgroonga_varchar_full_text_search_ops_v2)
with (normalizers='NormalizerNFKC121');
drop index pgroonga_title_index;