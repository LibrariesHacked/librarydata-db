create table plr_authority (
  id serial,
  code character (2),
  name character varying (200),
  constraint pk_plrauthority_id primary key (id)
);

create unique index cuidx_plrauthority_id_code on plr_authority (id, code);
cluster plr_authority using cuidx_plrauthority_id_code;
