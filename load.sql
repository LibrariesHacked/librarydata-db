-- Unique property reference numbers
\copy geo_uprn from 'data/os_open_uprn.csv' csv header;
create index idx_geouprn_xy on geo_uprn (x_coordinate, y_coordinate);

-- Postcodes
\copy geo_postcode_lookup from 'data/ons_postcode_directory.csv' csv header force null easting,northing,latitude,longitude,district,ward,county,region,country,date_of_termination;

-- Local authorities
create table schemas_staging_local_authority (
  "local-authority-code" text,
  "official-name" text,
  "nice-name" text,
  "gss-code" text,
  "start-date" text,
  "end-date" text,
  "replaced-by" text,
  "nation" text,
  "region" text,
  "local-authority-type" text,
  "local-authority-type-name" text,
  "county-la" text,
  "combined-authority" text,
  "alt-names" text,
  "former-gss-codes" text,
  "notes" text,
  "current-authority" text,
  "BS-6879" text,
  "ecode" text,
  "even-older-register-and-code" text,
  "gov-uk-slug" text,
  "area" text,
  "pop-2020" text,
  "x" text,
  "y" text,
  "long" text,
  "lat" text,
  "powers" text,
  "lower_or_unitary" text,
  "mapit-area-code" text,
  "ofcom" text,
  "old-ons-la-code" text,
  "old-register-and-code" text,
  "open-council-data-id" text,
  "os-file" text,
  "os" text,
  "snac" text,
  "wdtk-id" text
);
\copy schemas_staging_local_authority from 'data/uk_local_authorities.csv' csv header;

insert into schemas_local_authority (code, name, nice_name, nation, region)
select
  "gss-code",
  "official-name",
  "nice-name",
  "nation",
  "region" from schemas_staging_local_authority where "gss-code" is not null;

drop table schemas_staging_local_authority;

-- Authentication
\copy authentication from 'data/authentication.csv' csv header;
