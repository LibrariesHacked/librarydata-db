create view vw_schemas_libraries_extended as
select
  a.name as "Local authority",
  a.code as "Local authority code",
  l.name as "Library name",
  l.address_1 as "Address 1",
  l.address_2 as "Address 2",
  l.address_3 as "Address 3",
  l.postcode as "Postcode",
  p.longitude as "Postcode longitude",
  p.latitude as "Postcode latitude",
  l.unique_property_reference_number as "Unique property reference number",
  u.longitude as "Unique property reference number longitude",
  u.latitude as "Unique property reference number latitude",
  case when l.statutory then 'Yes' else 'No' end as "Statutory",
  t.name as "Type of library",
  l.year_opened as "Year opened",
  l.year_closed as "Year closed",
  l.monday_staffed_hours as "Monday staffed hours",
  l.tuesday_staffed_hours as "Tuesday staffed hours",
  l.wednesday_staffed_hours as "Wednesday staffed hours",
  l.thursday_staffed_hours as "Thursday staffed hours",
  l.friday_staffed_hours as "Friday staffed hours",
  l.saturday_staffed_hours as "Saturday staffed hours",
  l.sunday_staffed_hours as "Sunday staffed hours",
  l.monday_unstaffed_hours as "Monday unstaffed hours",
  l.tuesday_unstaffed_hours as "Tuesday unstaffed hours",
  l.wednesday_unstaffed_hours as "Wednesday unstaffed hours",
  l.thursday_unstaffed_hours as "Thursday unstaffed hours",
  l.friday_unstaffed_hours as "Friday unstaffed hours",
  l.saturday_unstaffed_hours as "Saturday unstaffed hours",
  l.sunday_unstaffed_hours as "Sunday unstaffed hours",
  case when l.colocated then 'Yes' else 'No' end as "Co-located",
  l.colocated_with as "Co-located with",
  l.notes as "Notes",
  l.url as "URL",
  l.email_address as "Email address",
  case 
    when l.unique_property_reference_number is not null then u.longitude
    else p.longitude
  end as "Longitude",
  case 
    when l.unique_property_reference_number is not null then u.latitude
    else p.latitude
  end as "Latitude",
  case 
    when l.unique_property_reference_number is not null then st_setsrid(st_makepoint(u.longitude, u.latitude), 4326)
    else st_setsrid(st_makepoint(p.longitude, p.latitude), 4326)
  end as geom,
  l.id
from schemas_libraries l
join schemas_local_authority a on a.code = l.local_authority_code
join schemas_library_type t on t.id = l.library_type_id
left join geo_uprn u on u.uprn = l.unique_property_reference_number
left join geo_postcode_lookup p on p.postcode = l.postcode;
