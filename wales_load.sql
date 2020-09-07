create table schemas_staging_wales (
  code character (9),
  name text,
  address_1 character varying (250),
  address_2 character varying (250),
  address_3 character varying (250),
  postcode character varying (10),
  type character varying (50),
  statutory boolean,
  opened numeric (4),
  closed numeric (4),
  url text,
  email text
);

-- Wales Libraries dataset
\copy schemas_staging_wales from 'data/libraries_wales.csv' csv header force null address_1,address_2,address_3,postcode,opened,closed,url,email;

-- Use standard postcode
update schemas_staging_wales lu
set postcode = p.postcode
from geo_postcode_lookup p
where replace(p.postcode, ' ', '') =  replace(lu.postcode, ' ', '');

-- Load the real libraries table
insert into schemas_libraries (local_authority_code, name, address_1, address_2, address_3, postcode, statutory, year_opened, year_closed, colocated, library_type_id, url, email_address)
select
  st.code,
  st.name,
  st.address_1,
  st.address_2,
  st.address_3,
  st.postcode,
  True as statutory,
  opened as year_opened,
  closed as year_closed,
  False as colocated,
  (select id from schemas_library_type where name = st.type) as library_type_id,
  st.url
from schemas_staging_wales st
order by name;

-- Fill in UPRNs that are large user postcodes
update schemas_libraries lu
set unique_property_reference_number = u.uprn
from geo_postcode_lookup p
join geo_uprn u on u.x_coordinate = p.easting and u.y_coordinate = p.northing
where p.postcode = lu.postcode
and p.user_type = 1
and lu.local_authority_code like 'W%';

drop table schemas_staging_wales;

