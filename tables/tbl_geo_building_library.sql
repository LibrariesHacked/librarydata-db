create table geo_building_library (
  building_id integer,
  library_id integer,
  constraint pk_geobuildinglibrary_buildingid_libraryid primary key (building_id, library_id),
  constraint fk_geobuildinglibrary_buildingid foreign key (building_id) references geo_building(id),
  constraint fk_geobuildinglibrary_libraryid foreign key (library_id) references schemas_libraries(id)
);

create unique index cuidx_geobuildinglibrary_buildingid_libraryid on geo_building_library (building_id, library_id);
cluster geo_building_library using cuidx_geobuildinglibrary_buildingid_libraryid;
