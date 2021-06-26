UPDATE gen_table_column
SET is_required=0
WHERE column_type = 'datetime';
