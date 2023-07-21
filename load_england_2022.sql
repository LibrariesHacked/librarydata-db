\c librarydata;

CREATE TABLE basic
(
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
    operation_16 text,
    operation_19 text,
    operation_21 text,
    operation_22 text,
    closed text,
    opened text,
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

update basic set type = 'Static Library' where type = 'Static library';

delete from basic where type != 'Static Library';

-- Path: load_england_2022.sql
\copy basic from 'data/libraries_england_2022.csv' csv header;

-- convert all library postcodes to uppercase
update basic set postcode = upper(postcode);

-- remove trailing whitespace
update basic set postcode = trim(postcode);

-- other postcode fixes
update basic set postcode = 'B34 7AQ' where name = 'Shard End Library' and postcode = 'B34 7AG';
update basic set postcode = 'BD16 1GL' where name = 'Bingley Library' and postcode = 'BD16 1AW';
update basic set postcode = 'CA1 3SN' where name = 'Harraby Library Link' and postcode = 'CA1 3PP';
update basic set postcode = 'SK22 3BR' where name = 'New Mills' and postcode = 'SK22 4AR';
update basic set postcode = 'TN31 7JG' where name = 'Rye Library' and postcode = 'TN31 7JL';
update basic set postcode = 'CM1 1GE' where name = 'Chelmsford Library' and postcode = 'CM1 1LH';
update basic set postcode = 'GL50 3JT' where name = 'Cheltenham Children''s library' and postcode = 'GL50 3JY';
update basic set postcode = 'WD19 7FD' where name = 'Oxhey Library (South Oxhey)' and postcode = 'WD19 7AG';
update basic set postcode = 'CT12 6FA' where name = 'Newington Library' and postcode = 'CT12 6NB';
update basic set postcode = 'SE27 9NS' where name = 'West Norwood' and postcode = 'SE27 9JX';
update basic set postcode = 'PR1 2PP' where name = 'Preston Harris' and postcode = 'PR1 1HT';
update basic set postcode = 'M19 3BP' where name = 'Arcadia library & Leisure Centre' and postcode = 'M19 3PH';
update basic set postcode = 'NE5 4BR' where name = 'Newbiggin Hall Library' and postcode = 'NE5 4BZ';
update basic set postcode = 'IP22 4DD' where name = 'Diss Library' and postcode = 'IP22 3DD';
update basic set postcode = 'NN17 1PD' where name = 'Corby' and postcode = 'NN17 1QJ';
update basic set postcode = 'NE12 7LJ' where name = 'Forest Hall Library' and postcode = 'NE12 0LJ';
update basic set postcode = 'NG1 7FF' where name = 'Nottingham Central Library' and postcode = 'NG1 6HP';
update basic set postcode = 'NG22 9TH' where name = 'Dukeries' and postcode = 'NG22 9TD';
update basic set postcode = 'M35 0FH' where name = 'Failsworth Library' and postcode = 'M35 0FJ';
update basic set postcode = 'OX4 6JZ' where name = 'Littlemore' and postcode = 'OX4 5JY';
update basic set postcode = 'TS12 2HP' where name = 'Skelton Library' and postcode = 'TS12 2HN';
update basic set postcode = 'M27 6FA' where name = 'Swinton Gateway Library' and postcode = 'M27 6BP';
update basic set postcode = 'BS15 9AG' where name = 'Kingswood' and postcode = 'BS15 9TR';
update basic set postcode = 'NE33 1JF' where name = 'The Word Library' and postcode = 'NE33 1DX';
update basic set postcode = 'TS17 7EW' where name = 'Thornaby Central Library & Customer Service Centre' and postcode = 'TS17 9EU';
update basic set postcode = 'CO10 0NH' where name = 'Great Cornard' and postcode = 'CO10 0JU';
update basic set postcode = 'KT14 6LB' where name = 'West Byfleet' and postcode = 'KT14 6NY';
update basic set postcode = 'SN3 2LZ' where name = 'Park Library' and postcode = 'SN3 2LP';
update basic set postcode = 'WF1 2EB' where name = 'Wakefield One' and postcode = 'WF1 2DA';
update basic set postcode = 'SW11 6RD' where name = 'Northcote Library' and postcode = 'SW11 6HW';
update basic set postcode = 'M46 9JQ' where name = 'Atherton' and postcode = 'M46 9JH';
update basic set postcode = 'NW9 4BR' where name = 'Colindale' and postcode = 'NW9 5XL';
update basic set postcode = 'TA24 8NP' where name = 'Porlock' and postcode = 'TA24 7HD';
update basic set postcode = 'EX23 8LG' where name = 'Bude Library & Information Service' and postcode = 'EX23 9LG';
update basic set postcode = 'DH6 2LW' where name = 'Shotton Library' and postcode = 'DL6 2LW';
update basic set postcode = 'SY9 5AQ' where name = 'Bishop''s Castle' and postcode = 'SY5 9AQ';
update basic set postcode = 'W12 7BF' where name = 'Shepherds Bush' and postcode = 'W6 7AT';


-- postcode fixes for the original libraries dataset
update schemas_libraries set postcode = 'NG22 9TH' where name = 'Dukeries' and postcode = 'NG22 9TD';
update schemas_libraries set postcode = 'W12 7BF' where name = 'Shepherds Bush' and postcode = 'W6 7AT';


-- closed libraries without postcodes
update schemas_libraries set postcode = 'TS23 1AJ' where name = 'Billingham Library' and postcode is null;
update schemas_libraries set postcode = 'TS23 2LB' where name = 'Rosebery Library' and postcode is null;
update schemas_libraries set postcode = 'TS19 9BX' where name = 'Roseworth Library' and postcode is null;
update schemas_libraries set postcode = 'TS17 6PG' where name = 'Thornaby Library' and postcode is null;
update schemas_libraries set postcode = 'WA5 1JH' where name = 'Great Sankey Library' and postcode is null;

-- psql --set=sslmode=require -f load_england_2022.sql -h librarieshacked-db.postgres.database.azure.com -p 5432 -U librarieshacked postgres
