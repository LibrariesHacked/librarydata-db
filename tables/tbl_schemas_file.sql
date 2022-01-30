create table schemas_files (
  id serial,
  definition_version_id integer,
  local_authority_code character (9),
  local_file boolean,
  file_path text
);