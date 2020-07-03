-- UPRNs
\copy geo_uprn from 'data/os_open_uprn.csv' csv header;

-- Postcodes
\copy geo_postcode_lookup from 'data/ons_postcode_directory.csv' csv header force null easting,northing,latitude,longitude,lsoa,district,ward,county,region,country,date_of_termination;

-- Local authorities
\copy schemas_local_authority from 'data/ons_local_authorities.csv' csv header;

-- Libraries dataset
\copy schemas_staging_libraries from 'data/libraries.csv' csv header force null address_1,address_2,address_3,postcode,unique_property_reference_number,year_opened,year_closed,monday_staffed_hours,tuesday_staffed_hours,wednesday_staffed_hours,thursday_staffed_hours,friday_staffed_hours,saturday_staffed_hours,sunday_staffed_hours,monday_unstaffed_hours,tuesday_unstaffed_hours,wednesday_unstaffed_hours,thursday_unstaffed_hours,friday_unstaffed_hours,saturday_unstaffed_hours,sunday_unstaffed_hours,special_hours,colocated,colocated_with,notes,url,email_address;

-- Remove leading zeros from UPRNs
update schemas_staging_libraries
set unique_property_reference_number = trim(leading '0' from unique_property_reference_number);

-- Remove UPRNs that have letters in them
update schemas_staging_libraries
set unique_property_reference_number = null
where unique_property_reference_number ~  '.*[a-zA-Z].*';

-- Remove UPRNs that are unfeasible (far away from their postcode)


-- Fill in UPRNs that are large user postcodes



-- Load the library types
insert into schemas_library_type (name)
select distinct library_type from schemas_staging_libraries order by library_type;

-- Load the real libraries table
insert into schemas_libraries (local_authority_code, name, address_1, address_2, address_3, postcode, statutory, library_type_id, year_opened, year_closed, monday_staffed_hours, tuesday_staffed_hours, wednesday_staffed_hours, thursday_staffed_hours, friday_staffed_hours, saturday_staffed_hours, sunday_staffed_hours, monday_unstaffed_hours, tuesday_unstaffed_hours, wednesday_unstaffed_hours, thursday_unstaffed_hours, friday_unstaffed_hours, saturday_unstaffed_hours, sunday_unstaffed_hours, special_hours, colocated, colocated_with, notes, url, email_address)
select
  (select name from schemas_local_authority where name = st.name limit 1) as local_authority_code,
  st.name,
  st.address_1,
  st.address_2,
  st.address_3,
  p.postcode,
  (case when st.statutory = 'yes' then 1 else 0 end) as statutory,
  (select id from schemas_library_type where name = st.library_type) as library_type_id,
  st.year_opened,
  st.year_closed,
  st.monday_staffed_hours,
  st.tuesday_staffed_hours,
  st.wednesday_staffed_hours,
  st.thursday_staffed_hours,
  st.friday_staffed_hours,
  st.saturday_staffed_hours,
  st.sunday_staffed_hours,
  '00:00-00:00',
  '00:00-00:00',
  '00:00-00:00',
  '00:00-00:00',
  '00:00-00:00',
  '00:00-00:00',
  '00:00-00:00',
  st.special_hours,
  st.colocated,
  st.colocated_with,
  st.notes,
  st.url,
  st.email_address
from schemas_staging_libraries st
left outer join geo_postcode_lookup p on replace(p.postcode, ' ', '') =  replace(st.postcode, ' ', '')
order by local_authority_code, name;
