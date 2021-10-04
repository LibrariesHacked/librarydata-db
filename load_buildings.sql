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

