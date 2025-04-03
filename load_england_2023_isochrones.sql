\c librarydata;

create table basic_isochrones_temp (
  WKT text,
  group_index integer,
  value integer,
  center text,
  area numeric,
  reachfactor numeric,
  total_pop integer,
  service text,
  name text,
  longitude numeric,
  latitude numeric
);

\copy basic_isochrones_temp from 'data/libraries_england_2023_isochrones.csv' csv header;

create table basic_isochrones (
  service text,
  name text,
  seconds integer,
  area numeric,
  reachfactor numeric,
  centre_longitude numeric,
  centre_latitude numeric,
  geom geometry(Polygon, 4326)
);
create index basic_isochrones_geom_idx on basic_isochrones using gist(geom);

insert into basic_isochrones (service, name, seconds, area, reachfactor, centre_longitude, centre_latitude, geom)
select service, name, value, area, reachfactor, longitude, latitude, ST_GeomFromText(WKT, 4326) from basic_isochrones_temp;



select * 
from basic_isochrones i
join lsoa_boundary lsoa
on st_intersects(st_transform(lsoa.geom, 4326), i.geom)
join lsoa_population lp
on lp.lsoacd = lsoa.lsoacd
where i.seconds = 900 -- 15 minute walk
limit 1