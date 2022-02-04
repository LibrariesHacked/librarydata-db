create table plr_isbn (
  id serial unique,
  isbn character varying (13),
  constraint pk_plrisbn_isbn primary key (isbn)
);

create unique index cuidx_plrisbn_isbn on plr_isbn (isbn);
cluster plr_isbn using cuidx_plrisbn_isbn;

create unique index uidx_plrisbn_id on plr_isbn (id);
