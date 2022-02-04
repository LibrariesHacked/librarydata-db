create table schemas_files (
  id serial,
  definition_version_id integer,
  local_authority_code character (9),
  local_file boolean,
  file_path text,
  constraint pk_schemasfiles_id primary key (id),
  constraint fk_schemasfiles_definitionversionid foreign key (definition_version_id) references schemas_definition_version (id),
  constraint fk_schemasfiles_localauthoritycode foreign key (local_authority_code) references schemas_local_authority (code)
);

create index cidx_schemasfiles_definitionversionid_localauthoritycode on schemas_files (definition_version_id, local_authority_code);
cluster schemas_files using cidx_schemasfiles_definitionversionid_localauthoritycode;

create unique index idx_schemasfiles_id on schemas_files (id);
