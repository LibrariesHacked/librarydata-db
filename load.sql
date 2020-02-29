-- First load PLR data

create table plr_counts_staging (
    authority_code character (2),
    period_start integer,
    period_end integer, 
    isbn character varying (13),
    contributor character varying (200),
    item_type character varying (200),
    stock integer,
    loans integer
);

create table plr_authorities_staging (
    code character (2),
    name character varying (200)
);



-- Then load Open Library Data
