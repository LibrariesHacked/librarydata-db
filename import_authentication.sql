-- switch to using the database
\c librarydata;

-- set client encoding
set client_encoding = 'UTF8';

-- Clear down data
delete from authentication;

-- Load in data
\copy authentication from 'data/authentication.csv' csv header;
