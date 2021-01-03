create view vw_libraries_geo as
select
  a.name as "local_authority",
  a.code as "local_authority_code",
  l.name as "library_name",
  l.address_1 as "address_1",
  l.address_2 as "address_2",
  l.address_3 as "address_3",
  l.postcode as "postcode",
  t.name as "library_type",
  l.year_closed as "year_closed",
  l.unique_property_reference_number as "unique_property_reference_number",
  case when l.colocated then 'Yes' else 'No' end as "colocated",
  l.colocated_with as "colocated_with",
  l.notes as "notes",
  l.url as "url",
  l.email_address as "email_address",
  case 
    when l.unique_property_reference_number is not null then u.longitude
    else p.longitude
  end as "longitude",
  case 
    when l.unique_property_reference_number is not null then u.latitude
    else p.latitude
  end as "latitude",
  case 
    when l.unique_property_reference_number is not null then u.x_coordinate
    else p.easting
  end as "easting",
  case 
    when l.unique_property_reference_number is not null then u.y_coordinate
    else p.northing
  end as "northing",
  p.oa as "oa_code",
  p.county as "county_code",
  p.district as "ward_code",
  p.region as "region_code",
  p.country as "country_code",
  p.rural_urban_classification as "rural_urban_classification",
  p.imd as "imd"
from schemas_libraries l
join schemas_local_authority a on a.code = l.local_authority_code
join schemas_library_type t on t.id = l.library_type_id
left join geo_uprn u on u.uprn = l.unique_property_reference_number
left join geo_postcode_lookup p on p.postcode = l.postcode;
