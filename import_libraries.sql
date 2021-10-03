\copy schemas_staging_libraries from 'data/libraries_aberdeenshire.csv' csv header force null address_1,address_2,address_3,postcode,unique_property_reference_number,year_opened,year_closed,monday_staffed_hours,tuesday_staffed_hours,wednesday_staffed_hours,thursday_staffed_hours,friday_staffed_hours,saturday_staffed_hours,sunday_staffed_hours,monday_unstaffed_hours,tuesday_unstaffed_hours,wednesday_unstaffed_hours,thursday_unstaffed_hours,friday_unstaffed_hours,saturday_unstaffed_hours,sunday_unstaffed_hours,special_hours,colocated,colocated_with,notes,url,email_address;

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
  st.monday_unstaffed_hours,
  st.tuesday_unstaffed_hours,
  st.wednesday_unstaffed_hours,
  st.thursday_unstaffed_hours,
  st.friday_unstaffed_hours,
  st.saturday_unstaffed_hours,
  st.sunday_unstaffed_hours,
  st.special_hours,
  (case when st.colocated = 'yes' then True else False end) as colocated,
  st.colocated_with,
  st.notes,
  st.url,
  st.email_address
from schemas_staging_libraries st
order by local_authority_code, name;

drop table schemas_staging_libraries;
