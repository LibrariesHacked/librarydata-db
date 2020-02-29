-- create the database
\i 'database/db_librarydata.sql';

-- switch to using the database
\c librarydata;

-- set client encoding
set client_encoding = 'UTF8';

-- create tables
\i 'tables/tbl_plr_authority.sql';
\i 'tables/tbl_plr_contributor.sql';
\i 'tables/tbl_plr_isbn.sql'
\i 'tables/tbl_plr_item_type.sql'
\i 'tables/tbl_plr_reporting_period.sql'
\i 'tables/tbl_plr_count.sql';

-- create views

-- create functions

-- load in data
\i 'load.sql';