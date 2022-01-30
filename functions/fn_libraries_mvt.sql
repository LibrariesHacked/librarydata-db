create or replace function fn_libraries_mvt(x integer, y integer, z integer) returns bytea as 
$$
declare 
  bbox geometry := fn_bbox(x, y, z);
	tile bytea;
begin
select st_asmvt(l, 'libraries', 4096, 'mvt_geom') into tile
from (
  select id, "Local authority code", "Library name", "Type of library", "Year closed", "Co-located with", st_asmvtgeom(st_transform(geom, 3857), bbox, 4096, 256, true) as mvt_geom
  from vw_schemas_libraries_extended
  where st_intersects(st_transform(geom, 3857), bbox)
) as l;
return tile;
end;
$$
language plpgsql;
