create table schemas_library_type (
  id serial,
  name character varying (50),
  constraint pk_schemaslibrarytype_id primary key (id)
);

create unique index idx_schemaslibrarytype_id on schemas_library_type (id);
cluster schemas_library_type using idx_schemaslibrarytype_id;
