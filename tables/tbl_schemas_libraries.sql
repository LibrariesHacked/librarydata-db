create table schema_libraries (
  id serial not null,
  local_authority_id integer,
  name character varying (250),
  address_1 character varying (250),
  address_2 character varying (250),
  address_3 character varying (250),
  postcode character varying (9),
  statutory bit not null,
  library_type_id integer,
  year_opened numeric (4),
  year_closed numeric (4),
  monday_staffed_hours character varying (100),
  tuesday_staffed_hours character varying (100),
  wednesday_staffed_hours character varying (100),
  thursday_staffed_hours character varying (100),
  friday_staffed_hours character varying (100),
  saturday_staffed_hours character varying (100),
  sunday_staffed_hours character varying (100),
  monday_unstaffed_hours character varying (100),
  tuesday_unstaffed_hours character varying (100),
  wednesday_unstaffed_hours character varying (100),
  thursday_unstaffed_hours character varying (100),
  friday_unstaffed_hours character varying (100),
  saturday_unstaffed_hours character varying (100),
  sunday_unstaffed_hours character varying (100),
  special_hours text,
  colocated bit not null,
  colocated_with character varying (250),
  notes text,
  url text,
  constraint pk_schemalibraries_authority_name primary key (local_authority_id, name),
  constraint fk_schemalibraries_localauthorityid foreign key (local_authority_id) references schema_local_authority (id),
  constraint fk_schemalibraries_librarytypeid foreign key (library_type_id) references schema_library_type (id)
);

create unique index idx_schemalibraries_id on schema_libraries (id);
cluster schema_libraries using idx_schemalibraries_id;

create index idx_schemalibraries_local_authority_id on schema_libraries (local_authority_id);
