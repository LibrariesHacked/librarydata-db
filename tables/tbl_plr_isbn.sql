create table plr_isbn (
	id serial,
	isbn character varying (13),
    constraint pk_plrisbn_id primary key (id)
);

create unique index idx_plrisbn_id on plr_isbn (id);
cluster plr_isbn using idx_plrisbn_id;