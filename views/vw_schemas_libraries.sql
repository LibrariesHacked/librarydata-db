create view vw_schemas_libraries as
select
  a.name as "Local authority",
  l.name as "Library name",
  l.address_1 as "Address 1"
from schemas_libraries l
join schemas_local_authority a
on a.code = l.local_authority_code;
