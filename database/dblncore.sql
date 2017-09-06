/*  dblncore.sql  */
/* Created by Laurence D. Finston (LDF) Thu Dec 13 09:35:57 CET 2012  */

/* * (1)  Top  */

/* * (1) Copyright and License.

This file is part of gwrdifpk, a package for long-term archiving.  
Copyright (C) 2013, 2014 Gesellschaft fuer wissenschaftliche Datenverarbeitung mbH Goettingen  

gwrdifpk is free software; you can redistribute it and/or modify 
it under the terms of the GNU General Public License as published by 
the Free Software Foundation; either version 3 of the License, or 
(at your option) any later version.  

gwrdifpk is distributed in the hope that it will be useful, 
but WITHOUT ANY WARRANTY; without even the implied warranty of 
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
GNU General Public License for more details.  

You should have received a copy of the GNU General Public License 
along with gwrdifpk; if not, write to the Free Software 
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

gwrdifpk is available for downloading via Git from 
https://github.com/gwdg/gwrdifpk.git.

Please send bug reports to Laurence.Finston@gwdg.de

The author can be contacted at: 

Laurence D. Finston 
Gesellschaft fuer wissenschaftliche Datenverarbeitung mbH Goettingen 
Am Fassberg 11 
37077 Goettingen  
Germany

Laurence.Finston@gwdg.de 
*/


/* ** (2)  Emacs Commands:   */ 

/* 
   Call `sql-mysql' (C-f10) to get a buffer in SQLi-mode.  It may be necessary to set
   SQL-mode in the buffer containing this file (C-f9) , although I don't think 
   it should be.  

   Call `toggle-truncate-lines' (C-f1) to suppress wrapping long lines in the 
   SQLi-mode buffer.
 
   Use `C-c C-r' to send the contents of the region to the SQLi-mode buffer.
   I'll probably set keys for various functions in the hook for SQL-mode.

   LDF 2009.12.29.

*/

/* ** (2)  Database and user info  */ 
select * from Irods_Servers\G

/* ** (2) Dublin_Core_Metadata  */

/* Element names from RFC 5013, "The Dublin Core Metadata Element Set"  */

/* !! START HERE:  LDF 2012.11.23.  Some of the types of the fields will need to 
   be changed.  !! TODO:  Set up a table for iRODS servers and use references
   here.  There should be rows for iRODS server admins in the Users table, 
   so I'll be able to use a reference for that, too.

   !! TODO:  Add table for X39.50 metadata?

*/

drop table Dublin_Core_Metadata;

create table Dublin_Core_Metadata
(
    dublin_core_metadata_id bigint unsigned primary key not null,
    user_id int not null references Users(user_id),
    irods_server_id int unsigned references Irods_Servers(irods_server_id),
    irods_object_path varchar(1024),
    dc_metadata_irods_object_path varchar(1024),
    handle_id bigint references handlesystem_standalone(handle_id),
    created datetime not null default 0,
    last_modified datetime not null default 0,
    marked_for_deletion boolean not null default false,
    delete_file tinyint not null default 0,
    delete_from_database_timestamp timestamp default 0,
    irods_object_ref_id bigint unsigned not null default 0 references Irods_Objects(irods_object_id),
    irods_object_self_id bigint unsigned not null default 0 references Irods_Objects(irods_object_id)
);


show columns from gwirdcli.Dublin_Core_Metadata;

/* This column only exists in the client-side database `gwirdcli'  
   LDF 2013.12.18.
*/
alter table Dublin_Core_Metadata add retrieved_from_server_timestamp timestamp default 0;


alter table Dublin_Core_Metadata change deleted marked_for_deletion boolean not null default false;
alter table Dublin_Core_Metadata add delete_from_database_timestamp timestamp default 0;
alter table Dublin_Core_Metadata add dc_metadata_irods_object_path varchar(1024);
alter table Dublin_Core_Metadata add delete_file tinyint not null default 0;
grant all on table Dublin_Core_Metadata to lfinsto, handleserver;

alter table Dublin_Core_Metadata add column irods_object_ref_id
   bigint unsigned not null default 0 references Irods_Objects(irods_object_id);

alter table Dublin_Core_Metadata add column irods_object_self_id
   bigint unsigned not null default 0 references Irods_Objects(irods_object_id);

show columns from Dublin_Core_Metadata;


select * from Dublin_Core_Metadata where dublin_core_metadata_id > 0\G

select * from Dublin_Core_Metadata_Sub where dublin_core_metadata_sub_id > 0\G

select * from Irods_Objects where irods_object_id > 0\G

/* Database queries to get the associated handles for a given set of Dublin Core metadata  */
/* LDF 2013.11.25.                                                                         */

select * from Dublin_Core_Metadata where dublin_core_metadata_id > 0\G

select * from handlesystem_standalone.handles where handle_id =118 order by handle_id\G

select * from handlesystem_standalone.handles where handle = 
   (select data from handlesystem_standalone.handles where handle_id = 118 
      and type = 'DC_METADATA_IRODS_OBJECT_PID')\G

select * from handlesystem_standalone.handles where data = 
   (select handle from handlesystem_standalone.handles where handle_id = 118 limit 1) 
       and type = 'DC_METADATA_PID'\G

select * from Dublin_Core_Metadata_Sub where dublin_core_metadata_id = 1 
   order by dublin_core_metadata_sub_id\G


select dublin_core_metadata_id, user_id, irods_server_id, irods_object_path,
    dc_metadata_irods_object_path, handle_id, created, unix_timestamp(created), 
    last_modified, unix_timestamp(last_modified),
    marked_for_deletion, delete_file, 
    delete_from_database_timestamp, unix_timestamp(delete_from_database_timestamp),
    irods_object_ref_id, irods_object_self_id
    from gwirdsif.Dublin_Core_Metadata 
    where dublin_core_metadata_id = 1
    order by dublin_core_metadata_id\G

select dublin_core_metadata_id, user_id, irods_server_id, irods_object_path,
    dc_metadata_irods_object_path, handle_id, created, unix_timestamp(created), 
    last_modified, unix_timestamp(last_modified),
    marked_for_deletion, delete_file, 
    delete_from_database_timestamp, unix_timestamp(delete_from_database_timestamp),
    irods_object_ref_id, irods_object_self_id, retrieved_from_server_timestamp
    from gwirdcli.Dublin_Core_Metadata 
    where dublin_core_metadata_id > 0
    order by dublin_core_metadata_id\G


/* *** (3) */

delete from Dublin_Core_Metadata;

insert into Dublin_Core_Metadata
(
    dublin_core_metadata_id,
    user_id, 
    irods_server_id,
    irods_object_path,
    handle_id,
    created,
    last_modified,
    marked_for_deletion,
    delete_from_database_timestamp
)
values
(0, 0, 0, 'NULL IRODS_OBJECT_PATH', 0, 0, 0, false, 0);



insert into Dublin_Core_Metadata
(
    dublin_core_metadata_id,
    user_id,
    irods_server_id,
    irods_object_path,
    handle_id,
    deleted,
    created,
    last_modified,
    marked_for_deletion,
    delete_from_database_timestamp
)
values
(1, 1, 1, '/tempZone/home/lfinsto/abc.txt', 1, now(), 0, false, 0);



select * from handlesystem_standalone.handles where handle like('12345/0%') 
order by handle_id, handle_value_id\G

select * from Dublin_Core_Metadata where user_id = 1 
   and irods_object_path = '/tempZone/home/lfinsto/abc.txt'\G

select * from Dublin_Core_Metadata where user_id = 1 
   and irods_object_path = '/tempZone/home/lfinsto/abc.txt'
   and dublin_core_metadata_id in (1, 2, 3);


select * from Dublin_Core_Metadata where dublin_core_metadata_id > 0 order by dublin_core_metadata_id\G
select * from Dublin_Core_Metadata where dublin_core_metadata_id > 0 order by dublin_core_metadata_id\G


select * from Dublin_Core_Metadata where user_id = 1 
   and irods_object_path = '/tempZone/home/lfinsto/def.txt' order by dublin_core_metadata_id;

select * from Dublin_Core_Metadata where user_id = 1 
   and irods_object_path = '/tempZone/home/lfinsto/def.txt'
   and dublin_core_metadata_id in (1, 2, 3) order by dublin_core_metadata_id;


delete from Dublin_Core_Metadata where dublin_core_metadata_id > 0;

/* ** (2) Dublin_Core_Metadata_Sub  */


drop table Dublin_Core_Metadata_Sub;

create table Dublin_Core_Metadata_Sub
(
    dublin_core_metadata_sub_id bigint unsigned primary key not null,
    dublin_core_metadata_id bigint unsigned not null references Dublin_Core_Metadata(dublin_core_metadata_id),
    dublin_core_element_id int unsigned not null default 0 
       references Dublin_Core_Elements(dublin_core_element_id),
    dublin_core_term_id int unsigned not null default 0 
       references Dublin_Core_Terms(dublin_core_term_id),
    value varchar(1024) not null default ''
);

grant all on table Dublin_Core_Metadata_Sub to lfinsto, handleserver;

show columns from Dublin_Core_Metadata_Sub;

insert into Dublin_Core_Metadata_Sub
(dublin_core_metadata_sub_id, dublin_core_metadata_id, dublin_core_element_id, value)
values

delete from Dublin_Core_Metadata_Sub;

select dublin_core_metadata_id, dublin_core_metadata_sub_id, dublin_core_element_id, value 
   from Dublin_Core_Metadata_Sub where dublin_core_metadata_id > 0 and dublin_core_metadata_sub_id > 0 
   order by dublin_core_metadata_id, dublin_core_metadata_sub_id, dublin_core_element_id, value\G

insert into Dublin_Core_Metadata_Sub
(dublin_core_metadata_sub_id, dublin_core_metadata_id, dublin_core_element_id, value)
values
(0, 0, 0, 'NULL_DUBLIN_CORE_METADATA_SUB_VALUE');


insert into Dublin_Core_Metadata_Sub
(dublin_core_metadata_sub_id, dublin_core_metadata_id, dublin_core_element_id, value)
values
(1,  1, 1,  'Sample Dublin Core Metadata (Title)'),
(2,  1, 2,  'Laurence D. Finston (Creator)'),
(3,  1, 3,  'Sample Dublin Core Metadata (Subject)'),
(4,  1, 4,  'Sample Dublin Core Metadata (Description)'),
(5,  1, 5,  'GWDG (Publisher)'),
(6,  1, 6,  'Sample contributor'),
(7,  1, 7,  '2012-12-06 12:11:26'),  /* Date  */
(8,  1, 8,  'iRODS object (Type)'),
(9,  1, 9,  'ASCII (Format)'),
(10, 1, 10, 'XXX (Identifier)'),
(11, 1, 11, 'GWDG (Source)'),	      
(12, 1, 12, 'English (Language)'),	      
(13, 1, 13, 'Not applicable (Relation)'), 
(14, 1, 14, 'Not applicable (Coverage)'), 
(15, 1, 15, 'All rights reserved (Rights)');

insert into Dublin_Core_Metadata_Sub
(dublin_core_metadata_sub_id, dublin_core_metadata_id, dublin_core_element_id, value)
values
(16, 2, 1,  'Sample 2 Dublin Core Metadata (Title)'),
(17, 2, 2,  'Laurence D. Finston (Creator)'),
(18, 2, 3,  'Sample 2 Dublin Core Metadata (Subject)'),
(19, 2, 4,  'Sample 2 Dublin Core Metadata (Description)'),
(20, 2, 5,  'MPI (Publisher)'),
(21, 2, 6,  'Sample 2 contributor'),
(22, 2, 7,  '2012-12-07 19:15:06'),  /* Date  */
(23, 2, 8,  'iRODS object 2 (Type)'),
(24, 2, 9,  'XML (Format)'),
(25, 2, 10, 'YYY (Identifier)'),
(26, 2, 11, 'MPI (Source)'),	      
(27, 2, 12, 'German (Language)'),	      
(28, 2, 13, 'Not applicable 2 (Relation)'), 
(29, 2, 14, 'Not applicable 2 (Coverage)'), 
(30, 2, 15, 'Public Domain (Rights)');


insert into Dublin_Core_Metadata_Sub
(dublin_core_metadata_sub_id, dublin_core_metadata_id, dublin_core_term_id, value)
values
(31, 1, 1,  'Sample Abstract');


insert into Dublin_Core_Metadata_Sub
(dublin_core_metadata_sub_id, dublin_core_metadata_id, dublin_core_element_id, value)
values
(32  , 3, 1,  'Sample 3 Dublin Core Metadata (Title)'),
(33, 3, 2,  'Laurence D. Finston (Creator)'),
(34, 3, 3,  'Sample 3 Dublin Core Metadata (Subject)'),
(35, 3, 4,  'Sample 3 Dublin Core Metadata (Description)'),
(36, 3, 5,  'MPI (Publisher)'),
(37, 3, 6,  'Sample 3 contributor'),
(38, 3, 7,  '2012-12-12 09:21:07'),  /* Date  */
(39, 3, 8,  'iRODS object 3 (Type)'),
(40, 3, 9,  'ASCII (Format)'),
(41, 3, 10, 'ZZZ (Identifier)'),
(42, 3, 11, 'BRD (Source)'),	      
(43, 3, 12, 'French (Language)'),	      
(44, 3, 13, 'Not applicable 3 (Relation)'), 
(45, 3, 14, 'Not applicable 3 (Coverage)'), 
(46, 3, 15, 'Creative Commons License (Rights)');





insert into Dublin_Core_Attributes
(dublin_core_metadata_id, dublin_core_metadata_sub_id, attribute, value)
values
(1, 1, 'xsi:type', 'title attribute');

insert into Dublin_Core_Attributes
(dublin_core_metadata_id, dublin_core_metadata_sub_id, attribute, value)
values
(1, 1, 'xsi:type', 'title attribute 2');

insert into Dublin_Core_Attributes
(dublin_core_metadata_id, dublin_core_metadata_sub_id, attribute, value)
values
(3, 33, 'xsi:type', 'creator attribute');

delete from Dublin_Core_Attributes where dublin_core_metadata_id = 3;

select * from Dublin_Core_Attributes order by dublin_core_metadata_id, 
dublin_core_metadata_sub_id, attribute, value;

/* Select elements where attribute is present  */

select U.user_id, U.username, M.dublin_core_metadata_id,
    S.dublin_core_metadata_sub_id, S.dublin_core_element_id, E.element_name, 
    S.value, A.attribute, A.value
    from Users as U, Dublin_Core_Metadata as M, Dublin_Core_Metadata_Sub as S,
    Dublin_Core_Elements as E, Dublin_Core_Attributes as A
    where U.user_id = M.user_id 
    and S.dublin_core_term_id = 0 
    and M.dublin_core_metadata_id = S.dublin_core_metadata_id
    and M.dublin_core_metadata_id = A.dublin_core_metadata_id
    and S.dublin_core_metadata_sub_id = A.dublin_core_metadata_sub_id
    and M.dublin_core_metadata_id > 0
    and S.dublin_core_element_id = E.dublin_core_element_id
    order by M.dublin_core_metadata_id, S.dublin_core_element_id\G

select * from handlesystem_standalone.handles where handle like('12345/0%') order by handle_id\G

select * from Dublin_Core_Metadata_Sub\G

/* Select elements only  */

select U.user_id, U.username, M.dublin_core_metadata_id, M.irods_server_id, 
    M.irods_object_path, M.handle_id, 
    S.dublin_core_metadata_sub_id, S.dublin_core_element_id, E.element_name, 
    S.value
    from Users as U, Dublin_Core_Metadata as M, Dublin_Core_Metadata_Sub as S,
    Dublin_Core_Elements as E
    where U.user_id = M.user_id 
    and S.dublin_core_term_id = 0 
    and M.dublin_core_metadata_id = S.dublin_core_metadata_id
    and M.dublin_core_metadata_id > 0
    and S.dublin_core_element_id = E.dublin_core_element_id
    order by M.dublin_core_metadata_id, S.dublin_core_element_id\G

/* Select terms (qualifiers) only  */

select U.user_id, U.username, M.dublin_core_metadata_id, M.irods_server_id, M.irods_object_path, M.handle_id, 
    S.dublin_core_metadata_sub_id, S.dublin_core_term_id, T.term_name, 
    S.value
    from Users as U, Dublin_Core_Metadata as M, Dublin_Core_Metadata_Sub as S,
    Dublin_Core_Terms as T
    where U.user_id = M.user_id 
    and S.dublin_core_element_id = 0 
    and M.dublin_core_metadata_id = S.dublin_core_metadata_id
    and M.dublin_core_metadata_id > 0
    and S.dublin_core_term_id = T.dublin_core_term_id
    order by M.dublin_core_metadata_id, S.dublin_core_term_id\G

/* Select elements and terms (qualifiers)  */

/* dublin_core_metadata_id == 1  */

select U.user_id, U.username, M.dublin_core_metadata_id, M.irods_server_id, M.irods_object_path, M.handle_id, 
    S.dublin_core_metadata_sub_id, 
    S.dublin_core_element_id, E.element_name, 
    S.dublin_core_term_id, T.term_name, 
    S.value
    from Users as U, Dublin_Core_Metadata as M, Dublin_Core_Metadata_Sub as S,
    Dublin_Core_Elements as E, Dublin_Core_Terms as T
    where U.user_id = M.user_id 
    and M.dublin_core_metadata_id = 1 
    and M.dublin_core_metadata_id = S.dublin_core_metadata_id
    and S.dublin_core_element_id = E.dublin_core_element_id
    and S.dublin_core_term_id = T.dublin_core_term_id
    order by M.dublin_core_metadata_id, S.dublin_core_term_id\G

/* dublin_core_metadata_id == 2  */


select U.user_id, U.username, M.dublin_core_metadata_id, M.irods_server_id, M.irods_object_path, M.handle_id, 
    S.dublin_core_metadata_sub_id, 
    S.dublin_core_element_id, E.element_name, 
    S.dublin_core_term_id, T.term_name, 
    S.value
    from Users as U, Dublin_Core_Metadata as M, Dublin_Core_Metadata_Sub as S,
    Dublin_Core_Elements as E, Dublin_Core_Terms as T
    where U.user_id = M.user_id 
    and M.dublin_core_metadata_id = 2 
    and M.dublin_core_metadata_id = S.dublin_core_metadata_id
    and S.dublin_core_element_id = E.dublin_core_element_id
    and S.dublin_core_term_id = T.dublin_core_term_id
    order by M.dublin_core_metadata_id, S.dublin_core_term_id\G



/* Select all rows (elements and terms)  */

select * from Dublin_Core_Metadata_Sub order by 
   dublin_core_metadata_id, dublin_core_metadata_sub_id, dublin_core_element_id, 
   dublin_core_term_id, value\G


show columns from Dublin_Core_Metadata;
select * from Dublin_Core_Metadata\G

select * from Dublin_Core_Metadata where dublin_core_metadata_id > 0 order by dublin_core_metadata_id;

select dublin_core_metadata_id,  dublin_core_metadata_sub_id from Dublin_Core_Metadata_Sub 
where dublin_core_metadata_id in (select MM.dublin_core_metadata_id from Dublin_Core_Metadata as MM
   where user_id = 1 
      and irods_object_path = '/tempZone/home/lfinsto/abc.txt' 
          or irods_object_path = '/tempZone/home/lfinsto/def.txt') order by dublin_core_metadata_id,
      dublin_core_metadata_sub_id;


select S.dublin_core_metadata_id, 
       S.dublin_core_metadata_sub_id, 
       S.dublin_core_element_id, E.element_name, 
       S.dublin_core_term_id, T.term_name, 
       S.value
       from Dublin_Core_Metadata_Sub as S,
       Dublin_Core_Elements as E, Dublin_Core_Terms as T
       where (S.dublin_core_metadata_id = 1 or S.dublin_core_metadata_id = 2)
       and S.dublin_core_element_id = E.dublin_core_element_id
       and S.dublin_core_term_id = T.dublin_core_term_id
       order by S.dublin_core_metadata_id, S.dublin_core_metadata_sub_id,
       S.dublin_core_element_id, S.dublin_core_term_id\G



/* Get the highest id from both tables with one query.  
   LDF 2012.12.21.
*/

select (select dublin_core_metadata_id from Dublin_Core_Metadata
           order by dublin_core_metadata_id desc limit 1),
       (select dublin_core_metadata_sub_id from Dublin_Core_Metadata_Sub 
           order by dublin_core_metadata_sub_id desc limit 1)\G


select * from Dublin_Core_Metadata where dublin_core_metadata_id > 0 
   order by dublin_core_metadata_id\G

/* Metadata_Sub */

select distinct S.dublin_core_metadata_id, S.dublin_core_metadata_sub_id, S.dublin_core_term_id, 
S.value, E.dublin_core_element_id, E.element_name, S.dublin_core_term_id, T.term_name
from Dublin_Core_Metadata_Sub as S, Dublin_Core_Elements as E, Dublin_Core_Terms as T 
where S.dublin_core_metadata_id in (1, 2)
and S.dublin_core_metadata_sub_id > 0 
and
S.dublin_core_element_id = E.dublin_core_element_id 
and S.dublin_core_term_id = T.dublin_core_term_id 
order by S.dublin_core_metadata_id, S.dublin_core_metadata_sub_id\G

/* Qualifiers */

select distinct Q.dublin_core_metadata_id, Q.dublin_core_qualifier_id, Q.dublin_core_element_id, 
E.element_name, Q.dublin_core_term_id, T.term_name, Q.value
from Dublin_Core_Qualifiers as Q, Dublin_Core_Elements as E, Dublin_Core_Terms as T 
where Q.dublin_core_metadata_id in (1, 2) 
and Q.dublin_core_element_id = E.dublin_core_element_id
and Q.dublin_core_term_id = T.dublin_core_term_id
order by Q.dublin_core_metadata_id, 
Q.dublin_core_qualifier_id\G

/* Attributes */

select dublin_core_metadata_id, dublin_core_metadata_sub_id, attribute, value 
from Dublin_Core_Attributes where dublin_core_metadata_id in (1, 2) order by dublin_core_metadata_id, 
dublin_core_metadata_sub_id\G


select * from Dublin_Core_Elements\G

select * from Dublin_Core_Qualifiers\G





/* *** (3) */

drop table Dublin_Core_Elements;

create table Dublin_Core_Elements
(
    dublin_core_element_id int unsigned primary key not null,
    element_name varchar(32) not null
);


select * from Dublin_Core_Elements;

grant all on table Dublin_Core_Elements to lfinsto, handleserver;

insert into Dublin_Core_Elements
(dublin_core_element_id, element_name)
values
(0,  'NULL_DUBLIN_CORE_ELEMENT'),
(1,  'title'),
(2,  'creator'),	 
(3,  'subject'),	 
(4,  'description'),
(5,  'publisher'),	 
(6,  'contributor'),
(7,  'date'),	 
(8,  'type'),	 
(9,  'format'),	 
(10, 'identifier'),
(11, 'source'),	 
(12, 'language'),	 
(13, 'relation'),	 
(14, 'coverage'),	 
(15, 'rights');

select * from Dublin_Core_Elements;


/* *** (3) */

drop table Dublin_Core_Terms;

create table Dublin_Core_Terms
(
    dublin_core_term_id int unsigned primary key not null,
    term_name varchar(64) not null
);


grant all on table Dublin_Core_Terms to lfinsto, handleserver;

delete from Dublin_Core_Terms;

select * from Dublin_Core_Terms;


insert into Dublin_Core_Terms
(dublin_core_term_id, term_name)
values
(0,  'NULL_DUBLIN_CORE_TERM'),
(1,  'abstract'), 
(2,  'accessRights'),
(3,  'accrualMethod '),
(4,  'accrualPeriodicity'),
(5,  'accrualPolicy'),
(6,  'alternative'),
(7,  'audience'),
(8,  'available'),
(9,  'bibliographicCitation'),
(10, 'conformsTo'),
(11, 'contributor'),
(12, 'coverage'),
(13, 'created'),
(14, 'creator'),
(15, 'date'),
(16, 'dateAccepted'),
(17, 'dateCopyrighted'),
(18, 'dateSubmitted'),
(19, 'description'),
(20, 'educationLevel'),
(21, 'extent'),
(22, 'format'),
(23, 'hasFormat'),
(24, 'hasPart'),
(25, 'hasVersion'),
(26, 'identifier'),
(27, 'instructionalMethod'),
(28, 'isFormatOf'),
(29, 'isPartOf'),
(30, 'isReferencedBy'),
(31, 'isReplacedBy'),
(32, 'isRequiredBy'),
(33, 'issued'),
(34, 'isVersionOf'),
(35, 'language'),
(36, 'license'),
(37, 'mediator'),
(38, 'medium'),
(39, 'modified'),
(40, 'provenance'),
(41, 'publisher'),
(42, 'references'),
(43, 'relation'),
(44, 'replaces'),
(45, 'requires'),
(46, 'rights'),
(47, 'rightsHolder'),
(48, 'source'),
(49, 'spatial'),
(50, 'subject'),
(51, 'tableOfContents'),
(52, 'temporal'),
(53, 'title'),
(54, 'type'),
(55, 'valid');

select * from Dublin_Core_Terms;

/* *** (3) */

drop table Dublin_Core_Qualifiers;

create table Dublin_Core_Qualifiers
(
    dublin_core_qualifier_id bigint unsigned primary key not null,
    dublin_core_metadata_id bigint unsigned references Dublin_Core_Metadata(dublin_core_metadata_id),
    dublin_core_element_id bigint unsigned references Dublin_Core_Elements(dublin_core_element_id),
    dublin_core_term_id bigint unsigned references Dublin_Core_Terms(dublin_core_term_id),
    value varchar(512) not null default '' 
);


grant all on table Dublin_Core_Qualifiers to lfinsto, handleserver;


select * from Dublin_Core_Qualifiers\G

delete from Dublin_Core_Qualifiers;

insert into Dublin_Core_Qualifiers
(dublin_core_qualifier_id, dublin_core_metadata_id, dublin_core_element_id, 
 dublin_core_term_id, value)
values
(0, 0, 0, 0, '');


insert into Dublin_Core_Qualifiers
(dublin_core_qualifier_id, dublin_core_metadata_id, dublin_core_element_id, 
 dublin_core_term_id, value)
values
(1, 1, 1, 1, 'Sample Qualifier 1'),
(2, 1, 2, 2, 'Sample Qualifier 2');


insert into Dublin_Core_Qualifiers
(dublin_core_qualifier_id, dublin_core_metadata_id, dublin_core_element_id, 
 dublin_core_term_id, value)
values
(3, 2, 1, 2, 'Sample Qualifier 3');



select * from Dublin_Core_Qualifiers order by dublin_core_qualifier_id\G

select * from Dublin_Core_Qualifiers where dublin_core_qualifier_id > 0\G

select Q.dublin_core_qualifier_id, Q.dublin_core_metadata_id, Q.dublin_core_element_id, 
 E.element_name, Q.dublin_core_term_id, T.term_name, Q.value from Dublin_Core_Qualifiers as Q,
 Dublin_Core_Elements as E, Dublin_Core_Terms as T
 where
 Q.dublin_core_element_id = E.dublin_core_element_id and 
 Q.dublin_core_term_id = T.dublin_core_term_id order by Q.dublin_core_qualifier_id\G
 

select M.dublin_core_metadata_id, Q.dublin_core_qualifier_id, Q.value, Q.dublin_core_element_id,
       E.element_name, T.term_name
      from Dublin_Core_Metadata as M, Dublin_Core_Qualifiers as Q, Dublin_Core_Terms as T,
           Dublin_Core_Elements as E
   where M.dublin_core_metadata_id = Q.dublin_core_metadata_id
     and E.dublin_core_element_id = Q.dublin_core_element_id
     and Q.dublin_core_term_id = T.dublin_core_term_id
     and M.dublin_core_metadata_id = 1\G


/* ** (2) */

/* This query selects the qualifiers for a given entry in `Dublin_Core_Metadata'  
   LDF 2012.12.06.
*/

select M.dublin_core_metadata_id, Q.dublin_core_qualifier_id, Q.value, Q.dublin_core_element_id,
       E.element_name, T.term_name
      from Dublin_Core_Metadata as M, Dublin_Core_Qualifiers as Q, Dublin_Core_Terms as T,
           Dublin_Core_Elements as E
   where M.dublin_core_metadata_id = Q.dublin_core_metadata_id
     and E.dublin_core_element_id = Q.dublin_core_element_id
     and Q.dublin_core_term_id = T.dublin_core_term_id
     and M.dublin_core_metadata_id = 1\G
   

/* ** (2) */

/* 
LOG
LDF 2012.12.12.
Added this table.  Currently, `attributes' are not tested for validity.  It may not 
be necessary to do this, or not using SQL.  It may be necessary or useful to test them
in `gwirdsif'
ENDLOG

*/

drop table Dublin_Core_Attributes;

create table Dublin_Core_Attributes
(

    dublin_core_metadata_id bigint unsigned not null references 
       Dublin_Core_Metadata(dublin_core_metadata_id),

    dublin_core_metadata_sub_id bigint unsigned not null references 
       Dublin_Core_Metadata_Sub(dublin_core_metadata_sub_id),

    attribute varchar(128),
  
    value varchar(256)
);

select * from Dublin_Core_Attributes;


grant all on table Dublin_Core_Attributes to lfinsto, handleserver;

/* ** (2) */

select * from Dublin_Core_Metadata;

delete from Dublin_Core_Metadata where dublin_core_metadata_id > 0;

select U.user_id, U.username, M.dublin_core_metadata_id, 
    M.irods_server_id, M.irods_object_path, M.handle_id, 
    S.dublin_core_metadata_sub_id, 
    S.dublin_core_element_id, E.element_name, 
    S.dublin_core_term_id, T.term_name, 
    S.value
    from Users as U, Dublin_Core_Metadata as M, 
    Dublin_Core_Metadata_Sub as S,
    Dublin_Core_Elements as E, Dublin_Core_Terms as T
    where U.user_id = M.user_id 
    and M.dublin_core_metadata_id = 1 
    and M.dublin_core_metadata_id = S.dublin_core_metadata_id
    and S.dublin_core_element_id = E.dublin_core_element_id
    and S.dublin_core_term_id = T.dublin_core_term_id
    order by S.dublin_core_metadata_sub_id, S.dublin_core_element_id, S.dublin_core_term_id\G






/* ** (2) */


/* * (1) Local variables for Emacs  */


/* 
Local Variables:
mode:SQL
abbrev-mode:t
eval:(read-abbrev-file "~/.abbrev_defs")
eval:(outline-minor-mode t)
outline-regexp:"\/\\*[ \\t]+[*\\f]+[ \\t]+([0-9]+)"
comment-start:"/*"
comment-end:"*/"
End:
*/
