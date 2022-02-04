create table schemas_library_type (
  id serial,
  name character varying (50),
  description character varying (500),
  constraint pk_schemaslibrarytype_name primary key (name)
);

create unique index cuidx_schemaslibrarytype_name on schemas_library_type (name);
cluster schemas_library_type using cuidx_schemaslibrarytype_name;

create unique index uidx_schemaslibrarytype_id on schemas_library_type (id);

insert into schemas_library_type(name, description)
values 
('LAL', 'Local authority library'),
('LAL-', 'Local authority library (unstaffed)'),
('CL', 'Commisioned library'),
('CRL', 'Community-run library'),
('ICL', 'Independent community library');
