-- create the database
\i 'database/db_librarydata.sql';

-- switch to using the database
\c librarydata;

create extension postgis;

-- set client encoding
set client_encoding = 'UTF8';

\i 'tables/tbl_geo_building.sql';
\i 'tables/tbl_geo_uprn.sql';
\i 'tables/tbl_geo_postcode_lookup.sql';

\i 'tables/tbl_plr_authority.sql';
\i 'tables/tbl_plr_contributor.sql';
\i 'tables/tbl_plr_isbn.sql'
\i 'tables/tbl_plr_item_type.sql'
\i 'tables/tbl_plr_reporting_period.sql'
\i 'tables/tbl_plr_count.sql';
\i 'tables/tbl_plr_staging_authorities.sql';
\i 'tables/tbl_plr_staging_counts.sql';

\i 'tables/tbl_schemas_local_authority.sql';
\i 'tables/tbl_schemas_library_type.sql';
\i 'tables/tbl_schemas_libraries.sql';
\i 'tables/tbl_schemas_staging_libraries.sql';

\i 'tables/tbl_geo_building_library.sql';

-- create views
\i 'views/vw_schemas_libraries.sql';
\i 'views/vw_schemas_libraries_extended.sql';

-- create functions
\i 'functions/fn_bbox.sql';
\i 'functions/fn_libraries_mvt.sql';
\i 'functions/fn_libraries_buildings_mvt.sql';

-- load in data
\i 'load.sql';
\i 'load_buildings.sql';
\i 'load_scotland.sql';
\i 'load_northern_ireland.sql';

vacuum analyze;
