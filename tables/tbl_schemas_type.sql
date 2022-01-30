create table schemas_type (
  id serial,
  system_name character varying (50) not null,
  display_name character varying (50) not null,
  constraint pk_schemastype_id primary key (id)
);

create unique index idx_schemastype_id on schemas_type (system_name);
cluster schemas_type using idx_schemastype_id;
