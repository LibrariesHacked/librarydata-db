\c librarydata;

create table basic (
    reporting text,
    name text,
    address1 text,
    address2 text,
    address3 text,
    authority text,
    postcode text,
    uprn text,
    type text,
    statutory_10 text,
    statutory_16 text,
    statutory_19 text,
    statutory_21 text,
    statutory_22 text,
    statutory_23 text,
    operation_16 text,
    operation_19 text,
    operation_21 text,
    operation_22 text,
    operation_23 text,
    closed text,
    opened text,
    operating_organisation text,
    department text,
    new_build_21 text,
    co_located text,
    co_located_archives text,
    co_located_artscentre text,
    co_located_carehome_hostel text,
    co_located_catering_bars_pub text,
    co_located_civic text,
    co_located_community text,
    co_located_faithbuildings text,
    co_located_health text,
    co_located_hotel text,
    co_located_industrial_business text,
    co_located_library text,
    co_located_museum text,
    co_located_retail text,
    co_located_schools_colleges text,
    co_located_universities_highereducation text,
    co_located_other text,
    co_located_other_text text,
    monday text,
    tuesday text,
    wednesday text,
    thursday text,
    friday text,
    saturday text,
    sunday text,
    hours text,
    staffed_hours text,
    automated text,
    email text
);

-- load basic dataset
\copy basic from 'data/libraries_england_2023.csv' csv header;

update basic set type = 'Static Library' where type = 'Static library';
update basic set type = 'Static Library' where type = 'static library';

delete from basic where type != 'Static Library';

delete from basic where name = 'Gorse Hill Community Book Collection';
delete from basic where name = 'Small Business Research + Enterprise Centre';
delete from basic where name = 'West Cumberland Hospital Book Drop';
delete from basic where name = 'St. Bernard''s Hospital Library';
delete from basic where name = 'Library Support Unit';
delete from basic where name = 'The Meeting Place';
delete from basic where name = 'Haxby Library';
delete from basic where name = 'Blunsdon Community Book Collection';

-- convert all library postcodes to uppercase
update basic set postcode = upper(postcode);

-- remove trailing whitespace
update basic set postcode = trim(postcode);

-- other postcode fixes - all existing errors
update basic set postcode = 'NE26 1EJ' where postcode = 'NE26 1EJ.';
update basic set postcode = 'B34 7AQ' where name = 'Shard End Library' and postcode = 'B34 7AG';
update basic set postcode = 'BD16 1GL' where name = 'Bingley Library' and postcode = 'BD16 1AW';
update basic set postcode = 'CA1 3SN' where name = 'Harraby Library Link' and postcode = 'CA1 3PP';
update basic set postcode = 'SK22 3BR' where name = 'New Mills' and postcode = 'SK22 4AR';
update basic set postcode = 'TN31 7JG' where name = 'Rye Library' and postcode = 'TN31 7JL';
update basic set postcode = 'GL50 3JT' where name = 'Cheltenham Children''s library' and postcode = 'GL50 3JY';
update basic set postcode = 'WD19 7FD' where name = 'Oxhey Library (South Oxhey)' and postcode = 'WD19 7AG';
update basic set postcode = 'SE27 9NS' where name = 'West Norwood' and postcode = 'SE27 9JX';
update basic set postcode = 'PR1 2PP' where name = 'Preston Harris' and postcode = 'PR1 1HT';
update basic set postcode = 'M19 3BP' where name = 'Arcadia library & Leisure Centre' and postcode = 'M19 3PH';
update basic set postcode = 'NE5 4BR' where name = 'Newbiggin Hall Library' and postcode = 'NE5 4BZ';
update basic set postcode = 'NN17 1PD' where name = 'Corby' and postcode = 'NN17 1QJ';
update basic set postcode = 'NE12 7LJ' where name = 'Forest Hall Library' and postcode = 'NE12 0LJ';
update basic set postcode = 'NG22 9TH' where name = 'Dukeries' and postcode = 'NG22 9TD';
update basic set postcode = 'M35 0FH' where name = 'Failsworth Library' and postcode = 'M35 0FJ';
update basic set postcode = 'OX4 6JZ' where name = 'Littlemore' and postcode = 'OX4 5JY';
update basic set postcode = 'TS12 2HP' where name = 'Skelton Library' and postcode = 'TS12 2HN';
update basic set postcode = 'M27 6FA' where name = 'Swinton Gateway Library' and postcode = 'M27 6BP';
update basic set postcode = 'BS15 9AG' where name = 'Kingswood' and postcode = 'BS15 9TR';
update basic set postcode = 'NE33 1JF' where name = 'The Word Library' and postcode = 'NE33 1DX';
update basic set postcode = 'TS17 7EW' where name = 'Thornaby Central Library & Customer Service Centre' and postcode = 'TS17 9EU';
update basic set postcode = 'CO10 0NH' where name = 'Great Cornard' and postcode = 'CO10 0JU';
update basic set postcode = 'SN3 2LZ' where name = 'Park Library' and postcode = 'SN3 2LP';
update basic set postcode = 'WF1 2EB' where name = 'Wakefield One' and postcode = 'WF1 2DA';
update basic set postcode = 'M46 9JQ' where name = 'Atherton' and postcode = 'M46 9JH';
update basic set postcode = 'NW9 4BR' where name = 'Colindale' and postcode = 'NW9 5XL';
update basic set postcode = 'TA24 8NP' where name = 'Porlock' and postcode = 'TA24 7HD';
update basic set postcode = 'EX23 8LG' where name = 'Bude Library & Information Service' and postcode = 'EX23 9LG';
update basic set postcode = 'DH6 2LW' where name = 'Shotton Library' and postcode = 'DL6 2LW';
update basic set postcode = 'SY9 5AQ' where name = 'Bishop''s Castle' and postcode = 'SY5 9AQ';
update basic set postcode = 'W12 7BF' where name = 'Shepherds Bush' and postcode = 'W6 7AT';
update basic set postcode = 'N3 1TR' where name = 'Church End' and postcode = 'N3 1SA';
update basic set postcode = 'PE23 5LH' where name = 'Spilsby Community Hub Library' and postcode = 'PE23 5JE';
update basic set postcode = 'RG12 9LP' where name = 'Harmans Water' and postcode = 'RG12 9HY';
update basic set postcode = 'BD10 9PY' where name = 'Idle Library' and postcode = 'BD10 9LD';
update basic set postcode = 'TN33 0QW' where name = 'Sedlescombe Village Library' and postcode = 'TN33 0QP';
update basic set postcode = 'CO15 2RH' where name = 'Jaywick Library' and postcode = 'CO15 2RG';
update basic set postcode = 'PO12 1BT' where name = 'Gosport Naval & Local Studies' and postcode = 'PO12 1NS';
update basic set postcode = 'N4 4QR' where name = 'Stroud Green & Harringay Library' and postcode = 'N4 4QL';
update basic set postcode = 'DE74 2DA' where name = 'Kegworth' and postcode = 'LE67 6NP';
update basic set postcode = 'PE25 1NP' where name = 'Ingoldmells Community Hub' and postcode = 'PE25 1NL';
update basic set postcode = 'M27 4AE' where name = 'Swinton Library' and postcode = 'M27 6BP';
update basic set postcode = 'WA1 1JG' where name = 'Warrington Library' and postcode = 'WA1 1JB';
update basic set postcode = 'DL3 9AA' where name = 'Cockerton Library' and postcode = 'DL3 9NN';
update basic set postcode = 'DN5 0HU' where name = 'Bentley Area Community Library' and postcode = 'DN5 0DE';
update basic set postcode = 'EN3 4DX' where name = 'Ponders End' and postcode = 'EN3 4EZ';
update basic set postcode = 'N17 8AG' where name = 'Coombes Croft Library' and postcode = 'N17 8BY';
update basic set postcode = 'NE68 7YL' where name = 'Seahouses' and postcode = 'NE68 7UE';
update basic set postcode = 'TW19 7HE' where name = 'Stanwell' and postcode = 'TW19 7HF';
update basic set postcode = 'CA1 3PP' where name = 'Harraby Library Link' and postcode = 'CA1 3SN';
update basic set postcode = 'WA4 2PE' where name = 'Grappenhall Library' and postcode = 'WA4 2PF';
update basic set postcode = 'OL15 0BQ' where name = 'Smithybridge Library' and postcode = 'OL12 9SA';


-- other postcode fixes - new errors
update basic set postcode = 'SE1 5TY' where postcode = 'SE1  5TY';
update basic set postcode = 'SE1 1JA' where postcode = 'SE1  1JA';
update basic set postcode = 'SE2 9FA' where postcode = 'SE29FA';


update basic set uprn = trim(uprn);
-- remove invalid uprns
update basic set uprn = null where uprn !~ '^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$'; -- 255
-- remove uprns that have no match in geo_uprn
update basic
set uprn = null
where uprn in 
(
    select 
        b.uprn
    from basic b
    left join geo_uprn u
    on u.uprn = cast(b.uprn as numeric)
    where b.uprn is not null
    and u is null
); -- 276
-- remove uprns that seem to have an invalid location
update basic
set uprn = null
where uprn in 
(
    select uprn from
        (select 
            b.uprn as uprn,
            st_distance(st_setsrid(st_makepoint(u.x_coordinate, u.y_coordinate), 27700), 
            st_setsrid(st_makepoint(p.easting, p.northing), 27700)) as distance
        from basic b
        join geo_postcode_lookup p
        on p.postcode = b.postcode
        left join geo_uprn u
        on u.uprn = cast(b.uprn as numeric)
        where b.uprn is not null) as d
    where d.distance > 3218
); -- 265

-- statutory - based on latest 23 assessment
update basic set statutory_23 = 'No' where statutory_23 = 'no';
update basic set statutory_23 = 'Yes' where statutory_23 = 'yes';
update basic set statutory_23 = 'No' where statutory_23 = 'NO';

-- library_type_id
update basic set operation_23 = 'LA' where operation_23 = 'La';
update basic set operation_23 = 'C' where operation_23 = 'c';

-- name
update  
    schemas_libraries l
set 
    name = b.name  
from basic b 
where l.postcode = b.postcode
and b.postcode not in (select postcode from basic where type = 'Static Library' group by postcode having count(*) > 1)
and l.name != b.name;


-- address_1
update  
    schemas_libraries l
set 
    address_1 = b.address1  
from basic b 
where l.postcode = b.postcode
and b.postcode not in (select postcode from basic where type = 'Static Library' group by postcode having count(*) > 1);

-- address_2
update  
    schemas_libraries l
set 
    address_2 = b.address2  
from basic b 
where l.postcode = b.postcode
and b.postcode not in (select postcode from basic where type = 'Static Library' group by postcode having count(*) > 1);

-- address_3
update  
    schemas_libraries l
set 
    address_3 = b.address3
from basic b 
where l.postcode = b.postcode
and b.postcode not in (select postcode from basic where type = 'Static Library' group by postcode having count(*) > 1);

-- statutory
update  
    schemas_libraries l
set 
    statutory =  
        case 
            when b.statutory_23 = 'Yes' then true
            when b.statutory_23 = 'No' then false
        end
from basic b 
where l.postcode = b.postcode
and b.postcode not in (select postcode from basic where type = 'Static Library' group by postcode having count(*) > 1)
and l.year_closed is null;


-- uprn
update  
    schemas_libraries l
set 
    unique_property_reference_number = cast(b.uprn as numeric)
from basic b 
where l.postcode = b.postcode
and b.postcode not in (select postcode from basic where type = 'Static Library' group by postcode having count(*) > 1)
and l.unique_property_reference_number != cast(b.uprn as numeric)
and b.uprn  is not null; -- 1 updated





update  
    schemas_libraries l
set 
    library_type_id =  
        case 
            when b.operation_23 = 'LA' then 1
            when b.operation_23 = 'LAU' then 2
            when b.operation_23 = 'C' then 3
            when b.operation_23 = 'CR' then 4
            when b.operation_23 = 'ICL' then 5
        end
from basic b 
where l.postcode = b.postcode
and b.postcode not in (select postcode from basic where type = 'Static Library' group by postcode having count(*) > 1)
and b.closed is null
and b.operation_23  in ('LA', 'LAU', 'C', 'CR', 'ICL');


-- year opened
update  
    schemas_libraries l
set 
    year_opened = cast(b.opened as numeric)
from basic b 
where l.postcode = b.postcode
and b.postcode not in (select postcode from basic where type = 'Static Library' group by postcode having count(*) > 1)
and b.opened ~ '^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$'
and l.year_opened is null;

-- year_closed
update  
    schemas_libraries l
set 
    year_closed = cast(b.closed as numeric)
from basic b 
where l.postcode = b.postcode
and b.postcode not in (select postcode from basic where type = 'Static Library' group by postcode having count(*) > 1)
and b.closed ~ '^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$'
and l.year_closed is null;

-- colocated
update basic set co_located = 'Yes' where co_located = 'yes';
update basic set co_located = 'No' where co_located = 'N/A';

update  
    schemas_libraries l
set
    colocated = case
        when b.co_located = 'Yes' then true
        when b.co_located = 'No' then false
    end
from basic b
where l.postcode = b.postcode
and b.postcode not in (select postcode from basic where type = 'Static Library' group by postcode having count(*) > 1);

-- email
update  
    schemas_libraries l
set 
    email_address = b.email
from basic b 
where l.postcode = b.postcode
and b.postcode not in (select postcode from basic where type = 'Static Library' group by postcode having count(*) > 1)
and b.email is not null
and l.year_closed is null;

-- psql --set=sslmode=require -f load_england_2022.sql -h librarieshacked-db.postgres.database.azure.com -p 5432 -U librarieshacked postgres
