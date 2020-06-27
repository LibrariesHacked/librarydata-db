create table schema_local_authority (
  id serial,
  name character varying (50),
  constraint pk_schemalocalauthority_id primary key (id)
);

create unique index idx_schemalocalauthority_id on schema_local_authority (id);
cluster schema_local_authority using idx_schemalocalauthority_id;
