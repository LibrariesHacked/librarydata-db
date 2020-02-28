create table plr_authorities (
	code character (2),
	name character varying (200)
);

create unique index idx_plrauthorities_code_name on plr_authorities (code, name);
cluster plr_authorities using idx_plrauthorities_code_name;