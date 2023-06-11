create table geo_staging_buildings (
  WKT text,
  fid text,
  id text,
  building_theme text,
  classification text,
  distinctive_name text,
  feature_code text
);

\copy geo_staging_buildings from program 'cmd /c "type C:\Development\LibrariesHacked\librarydata-db\data\os_library_buildings.csv"' csv header;

insert into geo_building(guid, name, geom)
select fid, distinctive_name, ST_GeomFromText(wkt, 27700)
from geo_staging_buildings;

drop table geo_staging_buildings;

create unique index idx_geobuilding_id on geo_building (id);
cluster geo_building using idx_geobuilding_id;
create index idx_geobuilding_geom on geo_building using gist (geom);
