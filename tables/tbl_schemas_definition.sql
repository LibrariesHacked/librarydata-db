create table schemas_definition (
  id serial unique,
  name character varying (50) not null,
  description character varying (50) not null,
  url text not null,
  type_id integer not null,
  constraint pk_schemasdefinition_name primary key (name),
  constraint fk_schemasdefinition_typeid foreign key (type_id) references schemas_type (id)
);

create unique index cuidx_schemasdefinition_name on schemas_definition (name);
cluster schemas_definition using cuidx_schemasdefinition_name;

create unique index uidx_schemasdefinition_id on schemas_definition (id);
