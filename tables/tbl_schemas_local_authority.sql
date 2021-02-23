create table schemas_local_authority (
  code character (9),
  name character varying (100),
  constraint pk_schemaslocalauthority_code primary key (code)
);

create unique index idx_schemaslocalauthority_code on schemas_local_authority (code);
cluster schemas_local_authority using idx_schemaslocalauthority_code;
