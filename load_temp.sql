-- switch to using the database
\c librarydata_temp;

-- set client encoding
set client_encoding = 'UTF8';

\i 'load_wales.sql';

vacuum analyze;
