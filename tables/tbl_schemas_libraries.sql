create table schemas_libraries (
  id serial not null,
  local_authority_code character (9),
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
  email_address text,
  constraint pk_schemaslibraries_authority_name primary key (local_authority_code, name),
  constraint fk_schemaslibraries_localauthoritycode foreign key (local_authority_code) references schemas_local_authority (code),
  constraint fk_schemaslibraries_librarytypeid foreign key (library_type_id) references schemas_library_type (id)
);

create unique index idx_schemaslibraries_id on schemas_libraries (id);
cluster schemas_libraries using idx_schemaslibraries_id;

create index idx_schemaslibraries_local_authority_code on schemas_libraries (local_authority_code);
