create table schemas_staging_northern_ireland (
  name text,
  address_1 character varying (250),
  address_2 character varying (250),
  address_3 character varying (250),
  postcode character varying (9),
  url text,
  email text,
  monday text, 
  tuesday text, 
  wednesday text,
  thursday text,
  friday text,
  saturday text,
  sunday text
);

-- Scotland Libraries dataset
\copy schemas_staging_northern_ireland from 'data/libraries_northern_ireland.csv' csv header force null address_1,address_2,address_3,postcode,url,email,monday,tuesday,wednesday,thursday,friday,saturday,sunday;

-- Use standard postcode
update schemas_staging_northern_ireland lu
set postcode = p.postcode
from geo_postcode_lookup p
where replace(p.postcode, ' ', '') =  replace(lu.postcode, ' ', '');

-- Load the real libraries table
insert into schemas_libraries (local_authority_code, name, address_1, address_2, address_3, postcode, statutory, colocated, library_type_id, monday_staffed_hours, tuesday_staffed_hours, wednesday_staffed_hours, thursday_staffed_hours, friday_staffed_hours, saturday_staffed_hours, sunday_staffed_hours, url, email_address)
select distinct
  'N92000002',
  st.name,
  st.address_1,
  st.address_2,
  st.address_3,
  st.postcode,
  True as statutory,
  False as colocated,
  (select id from schemas_library_type where name = 'LAL') as library_type_id,
  st.monday, 
  st.tuesday, 
  st.wednesday,
  st.thursday,
  st.friday,
  st.saturday,
  st.sunday,
  st.url,
  st.email
from schemas_staging_northern_ireland st
order by name;

-- Fill in UPRNs that are large user postcodes
update schemas_libraries lu
set unique_property_reference_number = u.uprn
from geo_postcode_lookup p
join geo_uprn u on u.x_coordinate = p.easting and u.y_coordinate = p.northing
where p.postcode = lu.postcode
and p.user_type = 1
and unique_property_reference_number is null;

drop table schemas_staging_northern_ireland;
