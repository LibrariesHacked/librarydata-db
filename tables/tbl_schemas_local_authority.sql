create table schemas_local_authority (
  code character (9),
  name character varying (100),
  nice_name character varying (100),
  nation character varying (100),
  region character varying (100),
  constraint pk_schemaslocalauthority_code primary key (code)
);

create unique index uidx_schemaslocalauthority_code on schemas_local_authority (code);
cluster schemas_local_authority using uidx_schemaslocalauthority_code;
