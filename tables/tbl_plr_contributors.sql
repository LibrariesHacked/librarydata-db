create table plr_contributors (
	id serial,
	name character varying (200)
);

create unique index idx_plrcontributors_id_name on plr_contributors (id, name);
cluster plr_contributors using idx_plrcontributors_id_name;