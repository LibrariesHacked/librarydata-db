create table plr_reporting_period (
	id serial,
	start date,
    end date,
    constraint pk_plrreportingperiod_id primary key (id)
);

create unique index idx_plrreportingperiod_id_start_end on plr_reporting_period (id, start, end);
cluster plr_reporting_period using idx_plrreportingperiod_id_start_end;