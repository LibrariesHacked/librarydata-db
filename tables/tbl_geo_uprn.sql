create table geo_uprn (
  uprn numeric not null,
  x_coordinate numeric not null,
  y_coordinate numeric not null,
  latitude numeric not null,
  longitude numeric not null,
  constraint pk_geouprn_uprn primary key (uprn)
);

create unique index cuidx_geouprn_uprn on geo_uprn (uprn);
cluster geo_uprn using cuidx_geouprn_uprn;
