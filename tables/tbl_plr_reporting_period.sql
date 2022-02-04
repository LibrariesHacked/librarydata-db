create table plr_reporting_period (
  id serial,
  period_start date,
  period_end date,
  constraint pk_plrreportingperiod_start_end primary key (period_start, period_end)
);

create unique index cuidx_plrreportingperiod_id_start_end on plr_reporting_period (id, period_start, period_end);
cluster plr_reporting_period using cuidx_plrreportingperiod_id_start_end;
