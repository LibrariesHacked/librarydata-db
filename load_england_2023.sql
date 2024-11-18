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
    new_build_22 text,
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

-- Trim all fields
update basic set reporting = trim(reporting) where reporting ~ '^\s|\s$';
update basic set name = trim(name) where name ~ '^\s|\s$';
update basic set address1 = trim(address1) where address1 ~ '^\s|\s$';
update basic set address2 = trim(address2) where address2 ~ '^\s|\s$';
update basic set address3 = trim(address3) where address3 ~ '^\s|\s$';
update basic set authority = trim(authority) where authority ~ '^\s|\s$';
update basic set postcode = trim(postcode) where postcode ~ '^\s|\s$';
update basic set uprn = trim(uprn) where uprn ~ '^\s|\s$';
update basic set type = trim(type) where type ~ '^\s|\s$';
update basic set statutory_10 = trim(statutory_10) where statutory_10 ~ '^\s|\s$';
update basic set statutory_16 = trim(statutory_16) where statutory_16 ~ '^\s|\s$';
update basic set statutory_19 = trim(statutory_19) where statutory_19 ~ '^\s|\s$';
update basic set statutory_21 = trim(statutory_21) where statutory_21 ~ '^\s|\s$';
update basic set statutory_22 = trim(statutory_22) where statutory_22 ~ '^\s|\s$';
update basic set statutory_23 = trim(statutory_23) where statutory_23 ~ '^\s|\s$';
update basic set operation_16 = trim(operation_16) where operation_16 ~ '^\s|\s$';
update basic set operation_19 = trim(operation_19) where operation_19 ~ '^\s|\s$';
update basic set operation_21 = trim(operation_21) where operation_21 ~ '^\s|\s$';
update basic set operation_22 = trim(operation_22) where operation_22 ~ '^\s|\s$';
update basic set operation_23 = trim(operation_23) where operation_23 ~ '^\s|\s$';
update basic set closed = trim(closed) where closed ~ '^\s|\s$';
update basic set opened = trim(opened) where opened ~ '^\s|\s$';
update basic set operating_organisation = trim(operating_organisation) where operating_organisation ~ '^\s|\s$';
update basic set department = trim(department) where department ~ '^\s|\s$';
update basic set new_build_22 = trim(new_build_22) where new_build_22 ~ '^\s|\s$';
update basic set co_located = trim(co_located) where co_located ~ '^\s|\s$';
update basic set co_located_archives = trim(co_located_archives) where co_located_archives ~ '^\s|\s$';
update basic set co_located_artscentre = trim(co_located_artscentre) where co_located_artscentre ~ '^\s|\s$';
update basic set co_located_carehome_hostel = trim(co_located_carehome_hostel) where co_located_carehome_hostel ~ '^\s|\s$';
update basic set co_located_catering_bars_pub = trim(co_located_catering_bars_pub) where co_located_catering_bars_pub ~ '^\s|\s$';
update basic set co_located_civic = trim(co_located_civic) where co_located_civic ~ '^\s|\s$';
update basic set co_located_community = trim(co_located_community) where co_located_community ~ '^\s|\s$';
update basic set co_located_faithbuildings = trim(co_located_faithbuildings) where co_located_faithbuildings ~ '^\s|\s$';
update basic set co_located_health = trim(co_located_health) where co_located_health ~ '^\s|\s$';
update basic set co_located_hotel = trim(co_located_hotel) where co_located_hotel ~ '^\s|\s$';
update basic set co_located_industrial_business = trim(co_located_industrial_business) where co_located_industrial_business ~ '^\s|\s$';
update basic set co_located_library = trim(co_located_library) where co_located_library ~ '^\s|\s$';
update basic set co_located_museum = trim(co_located_museum) where co_located_museum ~ '^\s|\s$';
update basic set co_located_retail = trim(co_located_retail) where co_located_retail ~ '^\s|\s$';
update basic set co_located_schools_colleges = trim(co_located_schools_colleges) where co_located_schools_colleges ~ '^\s|\s$';
update basic set co_located_universities_highereducation = trim(co_located_universities_highereducation) where co_located_universities_highereducation ~ '^\s|\s$';
update basic set co_located_other = trim(co_located_other) where co_located_other ~ '^\s|\s$';
update basic set co_located_other_text = trim(co_located_other_text) where co_located_other_text ~ '^\s|\s$';
update basic set monday = trim(monday) where monday ~ '^\s|\s$';
update basic set tuesday = trim(tuesday) where tuesday ~ '^\s|\s$';
update basic set wednesday = trim(wednesday) where wednesday ~ '^\s|\s$';
update basic set thursday = trim(thursday) where thursday ~ '^\s|\s$';
update basic set friday = trim(friday) where friday ~ '^\s|\s$';
update basic set saturday = trim(saturday) where saturday ~ '^\s|\s$';
update basic set sunday = trim(sunday) where sunday ~ '^\s|\s$';
update basic set hours = trim(hours) where hours ~ '^\s|\s$';
update basic set staffed_hours = trim(staffed_hours) where staffed_hours ~ '^\s|\s$';
update basic set automated = trim(automated) where automated ~ '^\s|\s$';
update basic set email = trim(email) where email ~ '^\s|\s$';

-- set all columns to null where the value is now an empty string
update basic set reporting = null where reporting = '';
update basic set name = null where name = '';
update basic set address1 = null where address1 = '';
update basic set address2 = null where address2 = '';
update basic set address3 = null where address3 = '';
update basic set authority = null where authority = '';
update basic set postcode = null where postcode = '';
update basic set uprn = null where uprn = '';
update basic set type = null where type = '';
update basic set statutory_10 = null where statutory_10 = '';
update basic set statutory_16 = null where statutory_16 = '';
update basic set statutory_19 = null where statutory_19 = '';
update basic set statutory_21 = null where statutory_21 = '';
update basic set statutory_22 = null where statutory_22 = '';
update basic set statutory_23 = null where statutory_23 = '';
update basic set operation_16 = null where operation_16 = '';
update basic set operation_19 = null where operation_19 = '';
update basic set operation_21 = null where operation_21 = '';
update basic set operation_22 = null where operation_22 = '';
update basic set operation_23 = null where operation_23 = '';
update basic set closed = null where closed = '';
update basic set opened = null where opened = '';
update basic set operating_organisation = null where operating_organisation = '';
update basic set department = null where department = '';
update basic set new_build_22 = null where new_build_22 = '';
update basic set co_located = null where co_located = '';
update basic set co_located_archives = null where co_located_archives = '';
update basic set co_located_artscentre = null where co_located_artscentre = '';
update basic set co_located_carehome_hostel = null where co_located_carehome_hostel = '';
update basic set co_located_catering_bars_pub = null where co_located_catering_bars_pub = '';
update basic set co_located_civic = null where co_located_civic = '';
update basic set co_located_community = null where co_located_community = '';
update basic set co_located_faithbuildings = null where co_located_faithbuildings = '';
update basic set co_located_health = null where co_located_health = '';
update basic set co_located_hotel = null where co_located_hotel = '';
update basic set co_located_industrial_business = null where co_located_industrial_business = '';
update basic set co_located_library = null where co_located_library = '';
update basic set co_located_museum = null where co_located_museum = '';
update basic set co_located_retail = null where co_located_retail = '';
update basic set co_located_schools_colleges = null where co_located_schools_colleges = '';
update basic set co_located_universities_highereducation = null where co_located_universities_highereducation = '';
update basic set co_located_other = null where co_located_other = '';
update basic set co_located_other_text = null where co_located_other_text = '';
update basic set monday = null where monday = '';
update basic set tuesday = null where tuesday = '';
update basic set wednesday = null where wednesday = '';
update basic set thursday = null where thursday = '';
update basic set friday = null where friday = '';
update basic set saturday = null where saturday = '';
update basic set sunday = null where sunday = '';
update basic set hours = null where hours = '';
update basic set staffed_hours = null where staffed_hours = '';
update basic set automated = null where automated = '';
update basic set email = null where email = '';


-- Update the reporting name to the 'nice_name' in the 'schemas_authorities' table
update basic set reporting = 'City of Bristol' where reporting = 'Bristol, City of';
update basic set reporting = 'Dorset Council' where reporting = 'Dorset';
update basic set reporting = 'East Riding of Yorkshire' where reporting = 'East Riding Of Yorkshire';
update basic set reporting = 'Herefordshire' where reporting = 'Herefordshire, County of';
update basic set reporting = 'Kingston upon Hull' where reporting = 'Kingston upon Hull, City of';
update basic set reporting = 'Kingston upon Thames' where reporting = 'Kingston Upon Thames';
update basic set reporting = 'Newcastle upon Tyne' where reporting = 'Newcastle Upon Tyne';
update basic set reporting = 'Richmond upon Thames' where reporting = 'Richmond Upon Thames';
update basic set reporting = 'Southampton' where reporting = 'southampton';
update basic set reporting = 'Southend-on-Sea' where reporting = 'Southend';


update basic set authority = 'City of Bristol' where authority = 'Bristol, City of';
update basic set authority = 'Dorset Council' where authority = 'Dorset';
update basic set authority = 'East Riding of Yorkshire' where authority = 'East Riding Of Yorkshire';
update basic set authority = 'Herefordshire' where authority = 'Herefordshire, County of';
update basic set authority = 'Kingston upon Hull' where authority = 'Kingston upon Hull, City of';
update basic set authority = 'Kingston upon Thames' where authority = 'Kingston Upon Thames';
update basic set authority = 'Newcastle upon Tyne' where authority = 'Newcastle Upon Tyne';
update basic set authority = 'Richmond upon Thames' where authority = 'Richmond Upon Thames';
update basic set authority = 'Westminster' where authority = 'London';
-- Suffolk run a prison library in Norfolk
update basic set authority = 'Norfolk' where authority = 'Norwich' and reporting = 'Suffolk';


update basic set postcode = null where postcode = '[No registered public address]';
update basic set postcode = null where postcode = '[Unknown]';
update basic set postcode = null where postcode = '[UNKNOWN]';
update basic set postcode = null where postcode = 'N/A - MOBILE';

-- convert all library postcodes to uppercase where the postcode includes lowercase
update basic set postcode = upper(postcode) where postcode ~ '[a-z]';

-- Set a library as closed
update basic set closed = '2016' where postcode = 'NE33 2PE';

-- Find invalid postcodes for closed libraries - 2
select * from basic
where closed is not null
and postcode not in
(select b.postcode from basic b
join geo_postcode_lookup p
on p.postcode = b.postcode
where p.postcode is not null);

update basic set postcode = 'NE26 1EJ' where postcode = 'NE26 1EJ.';
update basic set postcode = 'SE1 5TY' where postcode = 'SE1  5TY';

-- invalid postcodes for open libraries - 35
select * from basic where postcode not in
(select b.postcode from basic b
join geo_postcode_lookup p
on p.postcode = b.postcode
where p.postcode is not null
and p.date_of_termination is null)
and closed is null;

-- Invalid codes for open libraries
update basic set postcode = 'NW9 4BR' where name = 'Colindale' and postcode = 'NW9 5XL';
update basic set postcode = 'SE2 9FA' where postcode = 'SE29FA';
update basic set postcode = 'CH1 1RL' where postcode = 'CH1 1 RL';
update basic set postcode = 'CA1 3SN' where name = 'Harraby Library Link' and postcode = 'CA1 3PP';
update basic set postcode = 'SK22 3BR' where name = 'New Mills' and postcode = 'SK22 4AR';
update basic set postcode = 'TN31 7JG' where name = 'Rye Library' and postcode = 'TN31 7JL';
update basic set postcode = 'GL50 3JT' where name = 'Cheltenham Children''s library' and postcode = 'GL50 3JY';
update basic set postcode = 'WD19 7FD' where name = 'Oxhey Library (South Oxhey)' and postcode = 'WD19 7AG';
update basic set postcode = 'PO30 5RS' where postcode = 'PO30 5NX';
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
update basic set postcode = 'S13 7GD' where postcode = 'S13 7JU';
update basic set uprn = '10094516167' where uprn = '100052086384';
update basic set postcode = 'BS15 9AG' where name = 'Kingswood' and postcode = 'BS15 9TR';
update basic set postcode = 'NE33 1JF' where name = 'The Word Library' and postcode = 'NE33 1DX';
update basic set postcode = 'SE1 1JA' where postcode = 'SE1  1JA';
update basic set postcode = 'TS17 7EW' where name = 'Thornaby Central Library & Customer Service Centre' and postcode = 'TS17 9EU';
update basic set postcode = 'CO10 0NH' where name = 'Great Cornard' and postcode = 'CO10 0JU';
update basic set postcode = 'SN3 2LZ' where name = 'Park Library' and postcode = 'SN3 2LP';
update basic set postcode = 'WF1 2EB' where name = 'Wakefield One' and postcode = 'WF1 2DA';
update basic set postcode = 'B43 7HN' where postcode = 'B43 7NE';
update basic set postcode = 'B49 5HJ' where postcode = 'B495HJ';
update basic set postcode = 'M46 9JQ' where name = 'Atherton' and postcode = 'M46 9JH';
update basic set postcode = 'B34 7AQ' where name = 'Shard End Library' and postcode = 'B34 7AG';
update basic set postcode = 'BD16 1GL' where name = 'Bingley Library' and postcode = 'BD16 1AW';

-- Incorrect but valid postcodes
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
update basic set postcode = 'WA4 2PE' where name = 'Grappenhall Library' and postcode = 'WA4 2PF';
update basic set postcode = 'OL15 0BQ' where name = 'Smithybridge Library' and postcode = 'OL12 9SA';



-- Find UPRNs that have leading zeros
select * from basic where uprn ~ '^0';

-- Replace all leading zeros from those UPRNs that have leading zeros
update basic set uprn = regexp_replace(uprn, '^0+', '') where uprn ~ '^0';

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

-- remove uprns that seem to be too far from their postcode location
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
    where d.distance > 8045 -- 5 miles
)
and postcode is not null; -- 305


update basic set type = 'Static Library' where type = 'Static library';
update basic set type = 'Static Library' where type = 'static library';
update basic set type = 'Archive' where type = 'archive';
update basic set type = 'Mobile Library' where type = 'mobile library';
update basic set type = 'Archive' where type = 'static archive';

-- Non libraries
delete from basic where name = 'Gorse Hill Community Book Collection'; -- Closed in 2009
delete from basic where name = 'Library Support Unit'; -- not a public library
-- These micros have operation status as unkownn - will delete
delete from basic where name = 'Millbrook Micro';
delete from basic where name = 'Mullion Micro';
delete from basic where name = 'Polbathic Micro';
delete from basic where name = 'St Dennis Micro';
delete from basic where name = 'St. Columb Library';
delete from basic where name = 'Stoke Climsland';
delete from basic where name = 'Treverbyn Micro';
delete from basic where name = 'Vogue Micro';
delete from basic where name = 'Wainhouse Corner Micro Library';
delete from basic where name = 'Sedlescombe Village Library';


-- Ensure statutory fields are Yes or No
update basic set statutory_10 = 'No' where statutory_10 = '[Unknown]';
update basic set statutory_10 = 'No' where statutory_10 = 'Facility not open';
update basic set statutory_10 = 'No' where statutory_10 = 'Facility Not Open';
update basic set statutory_10 = 'Yes' where statutory_10 = 'yes';

update basic set statutory_16 = 'No' where statutory_16 = '[Unknown]';
update basic set statutory_16 = 'No' where statutory_16 = 'no';
update basic set statutory_16 = 'No' where statutory_16 = 'Facility Not Open';
update basic set statutory_16 = 'No' where statutory_16 = 'Facility not open';
update basic set statutory_16 = 'No' where statutory_16 = 'Temporary Closure';
update basic set statutory_16 = 'Yes' where statutory_16 = 'yes';

update basic set statutory_19 = 'Yes' where statutory_19 = 'yes';
update basic set statutory_19 = 'No' where statutory_19 = 'Facility Not Open';
update basic set statutory_19 = 'No' where statutory_19 = 'Facility not open'
update basic set statutory_19 = 'No' where statutory_19 = 'Temporary Closure';

update basic set statutory_21 = 'No' where statutory_21 = 'no';
update basic set statutory_21 = 'No' where statutory_21 = 'Facility Not Open';
update basic set statutory_21 = 'No' where statutory_21 = 'Facility not open';
update basic set statutory_21 = 'No' where statutory_21 = 'Temporary Closure';

update basic set statutory_22 = 'Yes' where statutory_22 = 'yes';
update basic set statutory_22 = 'No' where statutory_22 = 'no';
update basic set statutory_22 = 'No' where statutory_22 = 'Facility Not Open';
update basic set statutory_22 = 'No' where statutory_22 = 'Temporary Closure';

update basic set statutory_23 = 'No' where statutory_23 = 'NO';
update basic set statutory_23 = 'No' where statutory_23 = 'Temporary Closure';


-- Ensure operation fields are a valid code
update basic set operation_16 = '' where operation_16 not in ('LA', 'LAU', 'C', 'CR', 'ICL');
update basic set operation_19 = '' where operation_19 not in ('LA', 'LAU', 'C', 'CR', 'ICL');
update basic set operation_21 = '' where operation_21 not in ('LA', 'LAU', 'C', 'CR', 'ICL');
update basic set operation_22 = 'LA' where operation_22 ='La';
update basic set operation_22 = 'C' where operation_22 ='c';
update basic set operation_22 = '' where operation_22 not in ('LA', 'LAU', 'C', 'CR', 'ICL');
update basic set operation_23 = 'C' where operation_23 ='c';
update basic set operation_23 = '' where operation_23 not in ('LA', 'LAU', 'C', 'CR', 'ICL');

-- check where year closed is not a number - 0
select * from basic where closed !~ '^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$';

--- check where year opened is not a number - 5
select * from basic where opened !~ '^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$';

update basic set opened = null where opened = '[unknown]';
update basic set opened = null where opened = '[Unknown]';
update basic set opened = '1960' where opened = '1960s';
update basic set opened = '1970' where opened = '1970s';
update basic set opened = '1985' where opened = '1985c';

-- 2000
update basic set operating_organisation = null where operating_organisation = '-';
-- 15
update basic set operating_organisation = null where operating_organisation = 'NA';
-- 1
update basic set operating_organisation = null where operating_organisation = 'N';
-- 7
update basic set operating_organisation = null where operating_organisation = 'CR';
-- 264
update basic set operating_organisation = null where operating_organisation = 'N/A';
-- 77
update basic set operating_organisation = null where operating_organisation = 'LA';


-- Update the new_build_22 field
update basic set new_build_22 = 'No' where new_build_22 = 'n';
update basic set new_build_22 = 'No' where new_build_22 = 'N/A';
update basic set new_build_22 = 'No' where new_build_22 = 'no';
update basic set new_build_22 = 'No' where new_build_22 = 'NO';
update basic set new_build_22 = 'No' where new_build_22 is null;


-- Update the co_located field
update basic set co_located = 'Yes' where co_located = 'yes';
update basic set co_located = 'No' where co_located = 'N/A';
update basic set co_located = 'No' where co_located = 'n/a';
update basic set co_located = 'No' where co_located = '[Unknown]';



-- Now process updates to the libraries table

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

-- library type
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


update basic set co_located_archives = 'X' where co_located_archives = 'x';
update basic set co_located_artscentre = 'X' where co_located_artscentre = 'x';
update basic set co_located_carehome_hostel = 'X' where co_located_carehome_hostel = 'x';
update basic set co_located_catering_bars_pub = 'X' where co_located_catering_bars_pub = 'x';
update basic set co_located_civic = 'X' where co_located_civic = 'x';
update basic set co_located_community = 'X' where co_located_community = 'x';
update basic set co_located_faithbuildings = 'X' where co_located_faithbuildings = 'x';
update basic set co_located_health = 'X' where co_located_health = 'x';
update basic set co_located_hotel = 'X' where co_located_hotel = 'x';
update basic set co_located_industrial_business = 'X' where co_located_industrial_business = 'x';
update basic set co_located_library = 'X' where co_located_library = 'x';
update basic set co_located_museum = 'X' where co_located_museum = 'x';
update basic set co_located_retail = 'X' where co_located_retail = 'x';
update basic set co_located_schools_colleges = 'X' where co_located_schools_colleges = 'x';
update basic set co_located_universities_highereducation = 'X' where co_located_universities_highereducation = 'x';
update basic set co_located_other = 'X' where co_located_other = 'x';


update basic set co_located_other_text = null where co_located_other_text = '[Detail not provided]';




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
