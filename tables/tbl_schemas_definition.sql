create table schemas_definition (
  id serial,
  system_name character varying (50) not null,
  display_name character varying (50) not null,
  description_url text not null,
  current_definition_version_id integer,
  type_id integer not null
);