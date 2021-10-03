-- switch to using the database
\c librarydata;

-- set client encoding
set client_encoding = 'UTF8';

\copy (select * from vw_schemas_libraries order by "Local authority", "Library name") to 'data/libraries/libraries.csv' csv header;

