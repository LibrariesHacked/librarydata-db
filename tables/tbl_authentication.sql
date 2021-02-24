create table authentication (
  domain character varying (100),
  authority_codes character (9)[],
  admin boolean,
  constraint pk_authentication_domain primary key (domain)
);

create unique index idx_authentication_domain on authentication (domain);
cluster authentication using idx_authentication_domain;
