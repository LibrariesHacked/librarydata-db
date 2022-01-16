create table schemas_definition_version (
  id serial,
  version_name character varying (50) not null,
  definition_id integer not null,
  table_schema_path text not null
);