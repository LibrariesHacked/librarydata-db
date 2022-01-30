create table plr_staging_counts (
  authority_code character (2),
  period_start integer,
  period_end integer, 
  isbn character varying (13),
  contributor character varying (200),
  item_type character varying (200),
  stock integer,
  loans integer
);
