create table plr_count (
	id serial,
	isbn_id integer,
	stock_count integer,
	loans_count integer,
	contributor_id integer,
	item_type_id integer,
	constraint pk_plrcount_id primary key (id),
	constraint fk_plrcount_isbnid foreign key (isbn_id) references plr_isbn (id),
	constraint fk_plrcount_contributorid foreign key (contributor_id) references plr_contributor (id),
	constraint fk_plrcount_itemtypeid foreign key (item_type_id) references plr_item_type (id)
);

create unique index idx_plrcount_id on plr_count (id);
create index idx_plrcount_isbnid on plr_count (isbn_id);
create index idx_plrcount_contributorid on plr_count (contributor_id);
create index idx_plrcount_itemtypeid on plr_count (item_type_id);
cluster plr_count using idx_plrcount_id;