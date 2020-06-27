create table schema_library_type (
  id serial,
  name character varying (50),
  constraint pk_schemalibrarytype_id primary key (id)
);

create unique index idx_schemalibrarytype_id on schema_library_type (id);
cluster schema_library_type using idx_schemalibrarytype_id;
