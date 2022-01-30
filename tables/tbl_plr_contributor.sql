create table plr_contributor (
  id serial,
  name character varying (200),
  constraint pk_plrcontributor_id primary key (id)
);

create unique index idx_plrcontributor_id_name on plr_contributor (id, name);
cluster plr_contributor using idx_plrcontributor_id_name;