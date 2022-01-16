-- switch to using the database
\c librarydata;

-- set client encoding
set client_encoding = 'UTF8';

\copy (select * from vw_schemas_libraries order by "Local authority", "Library name", "Address 1", "Postcode", "Year opened", "Year closed") to 'data/schemas/libraries.csv' csv header;
