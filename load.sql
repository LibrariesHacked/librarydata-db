-- UPRNs
\copy geo_uprn from 'data/os_open_uprn.csv' csv header;

create index idx_geouprn_xy on geo_uprn (x_coordinate, y_coordinate);

-- Postcodes
\copy geo_postcode_lookup from 'data/ons_postcode_directory.csv' csv header force null easting,northing,latitude,longitude,lsoa,district,ward,county,region,country,date_of_termination;

-- Local authorities
\copy schemas_local_authority from 'data/ons_local_authorities.csv' csv header;

-- Authentication
\copy authentication from 'data/authentication.csv' csv header;
