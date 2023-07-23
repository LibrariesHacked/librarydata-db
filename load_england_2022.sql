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
delete from basic where name = 'Bury Archives';
delete from basic where name = 'Gorse Hill Community Book Collection';
delete from basic where name = 'Small Business Research + Enterprise Centre';
delete from basic where name = 'West Cumberland Hospital Book Drop';
delete from basic where name = 'St. Bernard''s Hospital Library';
delete from basic where name = 'Library Support Unit';

-- load basic dataset
\copy basic from 'data/libraries_england_2022.csv' csv header;

-- convert all library postcodes to uppercase
update basic set postcode = upper(postcode);

-- remove trailing whitespace
update basic set postcode = trim(postcode);

-- other postcode fixes
update basic set postcode = 'NE26 1EJ' where postcode = 'NE26 1EJ.';
update basic set postcode = 'NE8 1EH' where postcode = 'NE8 4NO';
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
update basic set postcode = 'N3 1TR' where name = 'Church End' and postcode = 'N3 1SA';
update basic set postcode = 'PE23 5LH' where name = 'Spilsby Community Hub Library' and postcode = 'PE23 5JE';
update basic set postcode = 'RG12 9LP' where name = 'Harmans Water' and postcode = 'RG12 9HY';
update basic set postcode = 'BD10 9PY' where name = 'Idle Library' and postcode = 'BD10 9LD';
update basic set postcode = 'TN33 0QW' where name = 'Sedlescombe Village Library' and postcode = 'TN33 0QP';
update basic set postcode = 'CO15 2RH' where name = 'Jaywick Library' and postcode = 'CO15 2RG';
update basic set postcode = 'CM0 7AB' where name = 'Southminster Library' and postcode = 'CM0 7AD';
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


-- empty postcodes 
update basic set postcode = 'HD8 0HB' where name = 'Lepton Library' and postcode is null;
update basic set postcode = 'WF12 9DU' where name = 'Thornhill Lees Library' and postcode is null;
update basic set postcode = 'NE31 1PN' where name = 'Hebburn' and postcode is null;
update basic set postcode = 'TS23 1AJ' where name = 'Billingham Library' and postcode is null;
update basic set postcode = 'TS23 2LB' where name = 'Rosebery Library' and postcode is null;
update basic set postcode = 'TS19 9BX' where name = 'Roseworth Library' and postcode is null;
update basic set postcode = 'TS17 6PG' where name = 'Thornaby Library' and postcode is null;
update basic set postcode = 'ST2 8JY' where name = 'Kingsland Early Years' and postcode is null;
update basic set postcode = 'SL4 6AR' where name = 'Eton' and postcode is null;
update basic set postcode = 'SL6 7UA' where name = 'Furze Platt Container' and postcode is null;
update basic set postcode = 'SL6 2LP' where name = 'Holyport Container' and postcode is null;
update basic set postcode = 'SL6 3GW' where name = 'Woodlands Park Container' and postcode is null;


-- postcode fixes for the original libraries dataset
update schemas_libraries set postcode = 'B34 7AQ' where name = 'Shard End Library' and postcode = 'B34 7AG';
update schemas_libraries set postcode = 'BD16 1GL' where name = 'Bingley Library' and postcode = 'BD16 1AW';
update schemas_libraries set postcode = 'CA1 3SN' where name = 'Harraby Library Link' and postcode = 'CA1 3PP';
update schemas_libraries set postcode = 'SK22 3BR' where name = 'New Mills' and postcode = 'SK22 4AR';
update schemas_libraries set postcode = 'TN31 7JG' where name = 'Rye Library' and postcode = 'TN31 7JL';
update schemas_libraries set postcode = 'CM1 1GE' where name = 'Chelmsford Library' and postcode = 'CM1 1LH';
update schemas_libraries set postcode = 'GL50 3JT' where name = 'Cheltenham Children''s library' and postcode = 'GL50 3JY';
update schemas_libraries set postcode = 'WD19 7FD' where name = 'Oxhey Library (South Oxhey)' and postcode = 'WD19 7AG';
update schemas_libraries set postcode = 'CT12 6FA' where name = 'Newington Library' and postcode = 'CT12 6NB';
update schemas_libraries set postcode = 'SE27 9NS' where name = 'West Norwood' and postcode = 'SE27 9JX';
update schemas_libraries set postcode = 'PR1 2PP' where name = 'Preston Harris' and postcode = 'PR1 1HT';
update schemas_libraries set postcode = 'M19 3BP' where name = 'Arcadia library & Leisure Centre' and postcode = 'M19 3PH';
update schemas_libraries set postcode = 'NE5 4BR' where name = 'Newbiggin Hall Library' and postcode = 'NE5 4BZ';
update schemas_libraries set postcode = 'IP22 4DD' where name = 'Diss Library' and postcode = 'IP22 3DD';
update schemas_libraries set postcode = 'NN17 1PD' where name = 'Corby' and postcode = 'NN17 1QJ';
update schemas_libraries set postcode = 'NE12 7LJ' where name = 'Forest Hall Library' and postcode = 'NE12 0LJ';
update schemas_libraries set postcode = 'NG1 7FF' where name = 'Nottingham Central Library' and postcode = 'NG1 6HP';
update schemas_libraries set postcode = 'NG22 9TH' where name = 'Dukeries' and postcode = 'NG22 9TD';
update schemas_libraries set postcode = 'M35 0FH' where name = 'Failsworth Library' and postcode = 'M35 0FJ';
update schemas_libraries set postcode = 'OX4 6JZ' where name = 'Littlemore' and postcode = 'OX4 5JY';
update schemas_libraries set postcode = 'TS12 2HP' where name = 'Skelton Library' and postcode = 'TS12 2HN';
update schemas_libraries set postcode = 'M27 6FA' where name = 'Swinton Gateway Library' and postcode = 'M27 6BP';
update schemas_libraries set postcode = 'BS15 9AG' where name = 'Kingswood' and postcode = 'BS15 9TR';
update schemas_libraries set postcode = 'NE33 1JF' where name = 'The Word Library' and postcode = 'NE33 1DX';
update schemas_libraries set postcode = 'TS17 7EW' where name = 'Thornaby Central Library & Customer Service Centre' and postcode = 'TS17 9EU';
update schemas_libraries set postcode = 'CO10 0NH' where name = 'Great Cornard' and postcode = 'CO10 0JU';
update schemas_libraries set postcode = 'KT14 6LB' where name = 'West Byfleet' and postcode = 'KT14 6NY';
update schemas_libraries set postcode = 'SN3 2LZ' where name = 'Park Library' and postcode = 'SN3 2LP';
update schemas_libraries set postcode = 'WF1 2EB' where name = 'Wakefield One' and postcode = 'WF1 2DA';
update schemas_libraries set postcode = 'SW11 6RD' where name = 'Northcote Library' and postcode = 'SW11 6HW';
update schemas_libraries set postcode = 'M46 9JQ' where name = 'Atherton' and postcode = 'M46 9JH';
update schemas_libraries set postcode = 'NW9 4BR' where name = 'Colindale' and postcode = 'NW9 5XL';
update schemas_libraries set postcode = 'TA24 8NP' where name = 'Porlock' and postcode = 'TA24 7HD';
update schemas_libraries set postcode = 'EX23 8LG' where name = 'Bude Library & Information Service' and postcode = 'EX23 9LG';
update schemas_libraries set postcode = 'DH6 2LW' where name = 'Shotton Library' and postcode = 'DL6 2LW';
update schemas_libraries set postcode = 'SY9 5AQ' where name = 'Bishop''s Castle' and postcode = 'SY5 9AQ';
update schemas_libraries set postcode = 'W12 7BF' where name = 'Shepherds Bush' and postcode = 'W6 7AT';
update schemas_libraries set postcode = 'CR6 9NF' where name = 'Warlingham' and postcode = 'CR6 9NE';
update schemas_libraries set postcode = 'YO7 1TH' where name = 'Thirsk Library' and postcode = 'YO7 1DA';
update schemas_libraries set postcode = 'SE24 0DG' where name = 'Carnegie Library (Herne Hill)' and postcode = 'SE24 0AG';
update schemas_libraries set postcode = 'N3 1TR' where name = 'Church End' and postcode = 'N3 2LN';
update schemas_libraries set postcode = 'TN31 7JG' where name = 'Rye Library' and postcode = 'TN31 7JF';
update schemas_libraries set postcode = 'GL3 4EX' where name = 'Brockworth Community Library' and postcode = 'GL3 4ET';
update schemas_libraries set postcode = 'PE16 6DY' where name = 'Chatteris Library' and postcode = 'PE16 6PT';
update schemas_libraries set postcode = 'LA5 0DF' where name = 'Arnside Library Link' and postcode = 'LA5 0DA';
update schemas_libraries set postcode = 'CM8 3RQ' where name = 'Silver End Library' and postcode = 'CM8 3RB';
update schemas_libraries set postcode = 'SE19 1TQ' where name = 'Upper Norwood' and postcode = 'SE19 1TJ';
update schemas_libraries set postcode = 'M20 2DN' where name = 'Didsbury Library' and postcode = 'M21 9PN';
update schemas_libraries set postcode = 'LN4 1LH' where name = 'Branston Community Hub' and postcode = 'LN4 1HL';
update schemas_libraries set postcode = 'DE74 2DA' where name = 'Kegworth' and postcode = 'DE74 2DE';
update schemas_libraries set postcode = 'LN2 2BT' where name = 'Ermine Community Hub Library' and postcode = 'LN2 2BY';
update schemas_libraries set postcode = 'LN6 9YW' where name = 'North Hykeham Community Library' and postcode = 'LN6 9YN';
update schemas_libraries set postcode = 'PE12 7AD' where name = 'Holbeach Community Hub Library' and postcode = 'PE12 7AX';
update schemas_libraries set postcode = 'LA6 3HG' where name = 'Ingleton Library' and postcode = 'YO62 5BL';
update schemas_libraries set postcode = 'BL1 1DF' where name = 'Bolton Central Library' and postcode = 'BL1 1SE';
update schemas_libraries set postcode = 'BD17 6JX' where name = 'Baildon Library' and postcode = 'BD17 6ND';
update schemas_libraries set postcode = 'BS2 8XJ' where name = 'St. Pauls' and postcode = 'BS2 8AL';
update schemas_libraries set postcode = 'LA14 4BP' where name = 'Ormsgill (Library Link)' and postcode = 'LA14 4AR';
update schemas_libraries set postcode = 'CM13 1BD' where name = 'Shenfield Library' and postcode = 'CM15 8NJ';
update schemas_libraries set postcode = 'PR2 1UH' where name = 'Savick' and postcode = 'PR2 1TU';
update schemas_libraries set postcode = 'LN6 0NA' where name = 'Birchwood Community Hub Library' and postcode = 'LN6 0QB';
update schemas_libraries set postcode = 'NG34 9RE' where name = 'Heckington Community Hub' and postcode = 'NG34 9RQ';
update schemas_libraries set postcode = 'BS29 6DA' where name = 'Banwell' and postcode = 'BS29 6DB';

-- closed libraries without postcodes
update schemas_libraries set postcode = 'TS23 1AJ' where name = 'Billingham Library' and postcode is null;
update schemas_libraries set postcode = 'TS23 2LB' where name = 'Rosebery Library' and postcode is null;
update schemas_libraries set postcode = 'TS19 9BX' where name = 'Roseworth Library' and postcode is null;
update schemas_libraries set postcode = 'TS17 6PG' where name = 'Thornaby Library' and postcode is null;
update schemas_libraries set postcode = 'WA5 1JH' where name = 'Great Sankey Library' and postcode is null;
update schemas_libraries set postcode = 'NG6 9AE' where name = 'Bulwell Library' and postcode is null;
update schemas_libraries set postcode = 'NG7 6BE' where name = 'Hyson Green Library' and postcode is null;
update schemas_libraries set postcode = 'NG3 4EZ' where name = 'St. Ann''s Library' and postcode is null;
update schemas_libraries set postcode = 'ST2 8JY' where name = 'Kingsland Early Years' and postcode is null;
update schemas_libraries set postcode = 'OL16 1JZ' where name = 'Rochdale Central Library' and postcode is null;
update schemas_libraries set postcode = 'M7 4EY' where name = 'Broughton Library' and postcode is null;
update schemas_libraries set postcode = 'M6 6QT' where name = 'Lower Kersal Library' and postcode is null;
update schemas_libraries set postcode = 'M27 4AE' where name = 'Swinton Library' and postcode is null;
update schemas_libraries set postcode = 'DN6 8HF' where name = 'Carcroft' and postcode is null;
update schemas_libraries set postcode = 'NE28 7NB' where name = 'Wallsend Library' and postcode is null;
update schemas_libraries set postcode = 'NE26 1EJ' where name = 'Whitley Bay Library' and postcode is null;
update schemas_libraries set postcode = 'NE31 1PN' where name = 'Hebburn' and postcode is null;
update schemas_libraries set postcode = 'SE10 0RL' where name = 'East Greenwich Library' and postcode is null;
update schemas_libraries set postcode = 'SE3 9YR' where name = 'Ferrier Library' and postcode is null;
update schemas_libraries set postcode = 'WD6 1JX' where name = 'Borehamwood Library' and postcode is null;
update schemas_libraries set postcode = 'TN8 5BD' where name = 'Edenbridge' and postcode is null;
update schemas_libraries set postcode = 'TN23 5SH' where name = 'Stanhope Library' and postcode is null;
update schemas_libraries set postcode = 'FY7 8EG' where name = 'Chatsworth' and postcode is null;
update schemas_libraries set postcode = 'BB12 9QH' where name = 'Wheatley Lane' and postcode is null;
update schemas_libraries set postcode = 'CV12 0BN' where name = 'Bedworth Heath' and postcode is null;
update schemas_libraries set postcode = 'CV3 2BQ' where name = 'Binley Woods' and postcode is null;
update schemas_libraries set postcode = 'B78 2HN' where name = 'Kingsbury' and postcode is null;

-- was temporarily closed, now open again in same location
delete from schemas_libraries where name = 'Swanley' and postcode is null;

-- closed in 2022 and reopened
update schemas_libraries set year_closed = 2022 where name = 'Sidcup Library' and postcode = 'DA14 4AQ';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Sidcup Library', true, 2022, 'DA14 6DS', false);

-- closed in 2022 and reopened in firestation
update schemas_libraries set year_closed = 2022 where name = 'Aston Library' and postcode = 'B6 6EJ';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Aston Library', true, 2022, 'B6 6ED', false);

-- closed in 2020 and reopened in 2020
update schemas_libraries set year_closed = 2020 where name = 'Crowle Library' and postcode = 'DN17 4LB';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Crowle Community Hub', true, 2020, 'DN17 4LA', false);

-- closed in 2021 and moved to new location
update schemas_libraries set year_closed = 2021 where name = 'Meir Library' and postcode = 'ST3 7DJ';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Meir Library', true, 2021, 'ST3 7DY', false);

-- closed in 2022 and moved to new location
update schemas_libraries set year_closed = 2022 where name = 'Bedlington Station Library' and postcode = 'NE22 5HB';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Bedlington Station Library', true, 2022, 'NE22 5JN', false);

-- closed in 2022 and moved to new location
update schemas_libraries set year_closed = 2022 where name = 'Timperley' and postcode = 'WA15 6QQ';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Timperley Library', true, 2022, 'WA15 7XR', false);

-- closed in 2022 and moved to new location
update schemas_libraries set year_closed = 2022 where name = 'North Baddesley Community' and postcode = 'SO52 9EN';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('North Baddesley Community Library', true, 2022, 'SO52 9EQ', false);

-- moved in 2020 to new premises
update schemas_libraries set year_closed = 2020 where name = 'Walton' and postcode = 'WF2 6LD';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Walton Library', true, 2020, 'WF2 6UA', false);

-- closed in 2019 and replaced with new library (use basic dataset to add new entry)
update schemas_libraries set year_closed = 2019 where name = 'Birkby & Fartown Library' and postcode = 'HD1 6HA';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Birkby & Fartown Library', true, 2019, 'HD1 6HF', false);

-- moved in 2017 to new premises (use basic dataset to add new entry)
update schemas_libraries set year_closed = 2017 where name = 'Bentham Library' and postcode = 'LA2 7JU';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Bentham Community Library', true, 2017, 'LA2 7HG', false);

-- moved in 2016 to new premises
update schemas_libraries set year_closed = 2016, address_1 = 'Debenham Resource Centre' where name = 'Debenham Library' and postcode = 'IP14 6RW';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Debenham Library', true, 2016, 'IP14 6PL', false);

-- Meerside library closed and replaced by Langdale Library
update schemas_libraries set year_closed = 2022 where name = 'Mereside' and postcode = 'FY4 4TP';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Langdale Library and Laundry Room', 'true', 2022, 'FY4 4TR', false);

-- library moved in 2022 to new premises
update schemas_libraries set year_closed = 2022 where name = 'Little Lever Library' and postcode = 'BL3 1LP';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Little Lever Library', true, 2022, 'BL3 1HH', false);

-- library closed in 2017 and replaced by new community library
update schemas_libraries set year_closed = 2017, library_type_id = 1 where name = 'Queensbury Library' and postcode = 'BD13 1AB';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Queensbury Library', true, 2017, 'BD13 2PA', false);

-- heaton hub closed in 2017 and replaced by new community library
update schemas_libraries set year_closed = 2017, library_type_id = 1 where name = 'Heaton Hub Library' and postcode = 'BD9 6LP';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Heaton Hub Library', true, 2017, 'BD9 6LL', false);

-- library moved after arson attack in 2020
update schemas_libraries set year_closed = 2020 where name = 'Mixenden' and postcode = 'HX2 8PU';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Mixenden', true, 2020, 'HX2 8SH', false);

-- two hollingbury libraries closed and new one in community centre opened
update schemas_libraries set year_closed = 2017 where name = 'Hollingbury Library (Carden)' and postcode = 'BN1 8LU';
update schemas_libraries set year_closed = 2017, name = 'Hollingbury Library' where name = 'Hollingbury Library (Old Boat Corner)' and postcode = 'BN1 8DA';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Hollingbury Library', true, 2017, 'BN1 8GN', false);

-- southmead library moved in 2022
update schemas_libraries set year_closed = 2022 where name = 'Southmead Library' and postcode = 'BS10 6AS';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Southmead Library', true, 2022, 'BS10 6BQ', false);

-- missing the old chester library
insert into schemas_libraries(name, statutory, year_closed, postcode, colocated)
values ('Chester Library', true, 2017, 'CH1 2EF', false);

-- missing the old bodmin library closed in 2017
insert into schemas_libraries(name, statutory, year_closed, postcode, colocated)
values ('Bodmin Library and One Stop Shop', true, 2017, 'PL31 2JX', true);

-- missing the old Par library closed in 2018
insert into schemas_libraries(name, statutory, year_closed, postcode, colocated)
values ('Par Library', true, 2018, 'PL24 2AH', false);

-- mssing the old upton cross library closed in 2017
insert into schemas_libraries(name, statutory, year_closed, postcode, colocated)
values ('Upton Cross Library', true, 2017, 'PL14 5AX', false);

-- bampton library moved in 2016
update schemas_libraries set year_closed = 2016 where name = 'Bampton' and postcode = 'EX16 9NE';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Bampton', true, 2016, 'EX16 9NG', false);

-- millom library moved in 2022
update schemas_libraries set year_closed = 2022 where name = 'Millom Library' and postcode = 'LA18 4DD';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Millom Library', true, 2022, 'LA18 5AB', false);

-- belper library moved in 2020
update schemas_libraries set year_closed = 2020 where name = 'Belper' and postcode = 'DE56 1BA';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Belper', true, 2020, 'DE56 1UQ', false);

-- bovey tracey library moved in 2020
update schemas_libraries set year_closed = 2020 where name = 'Bovey Tracey' and postcode = 'TQ13 9HZ';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Bovey Tracey', true, 2020, 'TQ13 9AW', false);

-- ottery st mary library moved in 2017 
update schemas_libraries set year_closed = 2017 where name = 'Ottery St Mary' and postcode = 'EX11 1DJ';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Ottery St Mary', true, 2017, 'EX11 1DB', false);

-- hornsea library moved in 2020
update schemas_libraries set year_closed = 2020 where name = 'Hornsea Library' and postcode = 'HU18 1PA';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Hornsea Library & Customer Service Centre', true, 2020, 'HU18 1PZ', false);

-- wickford library moved in 2021
update schemas_libraries set year_closed = 2021 where name = 'Wickford Library' and postcode = 'SS12 0AG';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Wickford Library', true, 2021, 'SS12 0RA', false);

-- missing chrishall community library
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Chrishall Community Library', true, 2019, 'SG8 8RP', false);

-- missing "Finchingfield Community Library" opened in 2019
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Finchingfield Community Library', true, 2019, 'CM7 4NN', false);

-- missing "Great Bromley Community Library" opened in 2019
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Great Bromley Community Library', true, 2019, 'CO7 7TL', false);

-- missing "Lamarsh Community Library" opened in 2019
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Lamarsh Community Library', true, 2019, 'CO8 5EU', false);

-- missing "Steeple Bumstead Community Library" opened in 2019
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Steeple Bumstead Community Library', true, 2019, 'CB9 7DQ', false);

-- stonehouse library moved in 2020
update schemas_libraries set year_closed = 2020 where name = 'Stonehouse Library' and postcode = 'GL10 2NP';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Stonehouse Library', true, 2020, 'GL10 2NG', false);

-- emsworth library moved in 2016
update schemas_libraries set year_closed = 2016 where name = 'Emsworth' and postcode = 'PO10 7AQ';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Emsworth', true, 2016, 'PO10 7DD', false);

-- throston grange library moved in 2022
update schemas_libraries set year_closed = 2022 where name = 'Throston Grange Library' and postcode = 'TS26 0XR';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Throston Grange Library', true, 2022, 'TS26 0TB', false);

-- shanklin moved in 2020
update schemas_libraries set year_closed = 2020 where name = 'Shanklin Community Library' and postcode = 'PO37 6PG';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Shanklin Community Library', true, 2020, 'PO37 7LA', false);

-- southborough library moved in 2021
update schemas_libraries set year_closed = 2021 where name = 'Southborough Library' and postcode = 'TN4 0BA';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Southborough Library', true, 2021, 'TN4 0NA', false);

-- castle donington library moved in 2019
update schemas_libraries set year_closed = 2019 where name = 'Castle Donington' and postcode = 'DE74 2LJ';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Castle Donington', true, 2019, 'DE74 2NR', false);

-- catford library moved in 2022
update schemas_libraries set year_closed = 2022 where name = 'Catford library' and postcode = 'SE6 4RU';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Catford library', true, 2022, 'SE6 4JU', false);

-- missing the closed library in welton from 2018
insert into schemas_libraries(name, statutory, year_closed, postcode, colocated)
values ('Welton', true, 2018, 'LN2 3JJ', false);

-- missing the old holbeach library closed in 2018
insert into schemas_libraries(name, statutory, year_closed, postcode, colocated)
values ('Holbeach Library', true, 2018, 'PE12 7LL', false);

-- missing the old burgh le marsh library closed in 2018
insert into schemas_libraries(name, statutory, year_closed, postcode, colocated)
values ('Burgh le Marsh', true, 2018, 'PE24 5JS', false);

-- missing wigmore library closed in 2014
insert into schemas_libraries(name, statutory, year_closed, postcode, colocated)
values ('Wigmore', true, 2014, 'LU2 8DJ', false);

-- milborne port closed in 2018 and reopened  as community library
update schemas_libraries set year_closed = 2018 where name = 'Milborne Port' and postcode = 'DT9 5ET';
insert into schemas_libraries(name, statutory, year_opened, postcode, colocated)
values ('Milborne Port', true, 2018, 'DT9 5DF', false);

-- psql --set=sslmode=require -f load_england_2022.sql -h librarieshacked-db.postgres.database.azure.com -p 5432 -U librarieshacked postgres
