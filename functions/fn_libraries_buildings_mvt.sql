create or replace function fn_libraries_buildings_mvt(x integer, y integer, z integer) returns bytea as
$$
declare
  bbox geometry := fn_bbox(x, y, z);
	tile bytea;
begin
select st_asmvt(s, 'library_buildings', 4096, 'mvt_geom') into tile
from (
  select l.name, st_asmvtgeom(st_transform(b.geom, 3857), bbox, 4096, 256, true) as mvt_geom
  from geo_building_library bl
  join geo_building b on b.id = bl.building_id
  join schemas_libraries l on l.id = bl.library_id
  where st_intersects(st_transform(b.geom, 3857), bbox)
) as s;
return tile;
end;
$$
language plpgsql;