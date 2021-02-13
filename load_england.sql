
-- England Libraries dataset
\copy schemas_staging_libraries from 'data/libraries_england.csv' csv header force null address_1,address_2,address_3,postcode,unique_property_reference_number,year_opened,year_closed,monday_staffed_hours,tuesday_staffed_hours,wednesday_staffed_hours,thursday_staffed_hours,friday_staffed_hours,saturday_staffed_hours,sunday_staffed_hours,monday_unstaffed_hours,tuesday_unstaffed_hours,wednesday_unstaffed_hours,thursday_unstaffed_hours,friday_unstaffed_hours,saturday_unstaffed_hours,sunday_unstaffed_hours,special_hours,colocated,colocated_with,notes,url,email_address;

-- Use standard postcode
update schemas_staging_libraries lu
set postcode = p.postcode
from geo_postcode_lookup p
where replace(p.postcode, ' ', '') =  replace(lu.postcode, ' ', '');

-- Remove leading zeros from UPRNs
update schemas_staging_libraries
set unique_property_reference_number = trim(leading '0' from unique_property_reference_number);

-- Remove UPRNs that have letters in them
update schemas_staging_libraries
set unique_property_reference_number = null
where unique_property_reference_number ~  '.*[a-zA-Z].*';

-- Remove UPRNs that are unfeasible (over 5 miles from their postcode)
update schemas_staging_libraries lu
set unique_property_reference_number = null
from
	(select l.postcode
	from schemas_staging_libraries l
	join geo_postcode_lookup p on replace(p.postcode, ' ', '') =  replace(l.postcode, ' ', '')
	join geo_uprn u on cast(l.unique_property_reference_number as numeric) = u.uprn
	where st_distance(st_makepoint(u.x_coordinate, u.y_coordinate), st_makepoint(p.easting, p.northing)) > 8045) pc
where pc.postcode = lu.postcode
and lu.unique_property_reference_number is not null;

-- Remove UPRNs that do not exist
update schemas_staging_libraries lu
set unique_property_reference_number = null
from
	(select l.postcode
  from schemas_staging_libraries l
  left join geo_uprn u on cast(l.unique_property_reference_number as numeric) = u.uprn
  where l.unique_property_reference_number is not null and u.uprn is null) pc
where pc.postcode = lu.postcode
and lu.unique_property_reference_number is not null;

-- Fill in UPRNs that are large user postcodes
update schemas_staging_libraries lu
set unique_property_reference_number = u.uprn
from geo_postcode_lookup p
join geo_uprn u on u.x_coordinate = p.easting and u.y_coordinate = p.northing
where p.postcode = lu.postcode
and p.user_type = 1;

-- Make non closed year numeric 
update schemas_staging_libraries
set year_closed = 1900 where year_closed = 'Closed';

-- Load the real libraries table
insert into schemas_libraries (local_authority_code, name, address_1, address_2, address_3, postcode, statutory, unique_property_reference_number, library_type_id, year_opened, year_closed, monday_staffed_hours, tuesday_staffed_hours, wednesday_staffed_hours, thursday_staffed_hours, friday_staffed_hours, saturday_staffed_hours, sunday_staffed_hours, monday_unstaffed_hours, tuesday_unstaffed_hours, wednesday_unstaffed_hours, thursday_unstaffed_hours, friday_unstaffed_hours, saturday_unstaffed_hours, sunday_unstaffed_hours, special_hours, colocated, colocated_with, notes, url, email_address)
select
  (select code from schemas_local_authority where name = st.local_authority limit 1) as local_authority_code,
  st.name,
  st.address_1,
  st.address_2,
  st.address_3,
  st.postcode,
  (case when st.statutory = 'yes' then True else False end) as statutory,
  cast(st.unique_property_reference_number as numeric),
  (select id from schemas_library_type where name = st.library_type) as library_type_id,
  cast(st.year_opened as numeric) as year_opened,
  cast(st.year_closed as numeric) as year_closed,
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
  (case when st.colocated = 'yes' then True else False end) as colocated,
  st.colocated_with,
  st.notes,
  st.url,
  st.email_address
from schemas_staging_libraries st
order by local_authority_code, name;

drop table schemas_staging_libraries;