create table geo_building (
  id serial,
  guid text,
  constraint pk_geobuilding_id primary key (id)
);

select AddGeometryColumn ('public', 'geo_building', 'geom', 27700, 'MULTIPOLYGON', 3);
