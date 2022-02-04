create table schemas_definition_version (
  id serial unique,
  definition_id integer not null,
  version_name character varying (50) not null,
  table_schema_url text not null,
  current_version boolean not null,
  constraint pk_schemasdefinitionversion_versionname_definitionid primary key (definition_id, version_name),
  constraint fk_schemasdefinitionversion_definitionid foreign key (definition_id) references schemas_definition (id)
);

create unique index cuidx_schemasdefinitionversion_definitionid_name on schemas_definition_version (definition_id, version_name);
cluster schemas_definition_version using cuidx_schemasdefinitionversion_definitionid_name;
