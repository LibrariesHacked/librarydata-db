create table plr_item_type (
  id serial,
  name character varying (200),
  constraint pk_itemtype_id primary key (id)
);

create unique index cuidx_plritemtype_id_name on plr_item_type (id, name);
cluster plr_item_type using cuidx_plritemtype_id_name;
