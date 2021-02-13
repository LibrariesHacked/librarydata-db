create table geo_staging_buildings (
  wkt text,
  guid text
);

\copy geo_staging_buildings from program 'cmd /c "type C:\Development\LibrariesHacked\librarydata-db\data\os_buildings.csv"' csv header;

insert into geo_building(guid, geom)
select guid, ST_GeomFromText(wkt, 27700)
from geo_staging_buildings;

drop table geo_staging_buildings;

create unique index idx_geobuilding_id on geo_building (id);
cluster geo_building using idx_geobuilding_id;
create index idx_geobuilding_geom on geo_building using gist (geom);

-- Now, work out library buildings!
insert into geo_building_library(building_id, library_id)
select 
  distinct b.id, l.id
from geo_building b
join(
  select
    l.id,
    case 
      when l.unique_property_reference_number is not null then st_setsrid(st_makepoint(u.x_coordinate, u.y_coordinate), 27700)
      else st_setsrid(st_makepoint(p.easting, p.northing), 27700)
    end as geom
  from schemas_libraries l
  left join geo_uprn u on u.uprn = l.unique_property_reference_number
  left join geo_postcode_lookup p on p.postcode = l.postcode
) l on st_intersects(b.geom, l.geom);
