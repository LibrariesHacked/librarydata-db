create table schemas_type (
  id serial,
  name character varying (50) not null,
  description character varying (200) not null,
  constraint pk_schemastype_name primary key (name)
);

create unique index cuidx_schemastype_name on schemas_type (name);
cluster schemas_type using cuidx_schemastype_name;

create unique index uidx_schemastype_id on schemas_type (id);

insert into schemas_type(name, description)
values 
('Register', 'A permanent representation that should be updated as it changes'),
('Time-series', 'New data that occurs at regular intervals'),
('Snapshot', 'A point in time representation of the data in the system');
