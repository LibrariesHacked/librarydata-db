create table plr_reporting_periods (
	id serial,
	start date,
    end date
);

create unique index idx_plrreportingperiods_id_start_end on plr_reporting_periods (id, start, end);
cluster plr_reporting_periods using idx_plrreportingperiods_id_start_end;