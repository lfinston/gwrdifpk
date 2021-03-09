/*  archobjs.sql  */
/* [...]/Finston/gwrdifpk/database/archobjs.sql  */

/* Created by Laurence D. Finston (LDF) on Jan  7 09:03:35 CET 2013  */

/* * (1)  Top  */

/* * (1) Copyright and License.

This file is part of gwrdifpk, a package for long-term archiving.  
Copyright (C) 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2012,Gesellschaft fuer wissenschaftliche Datenverarbeitung mbH Goettingen  

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
Kreuzbergring 41
37075 Goettingen  
Germany

Laurence.Finston@gmx.de
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

/* * (1)  Archive Objects  */ 

/* ** (2) Irods_Objects  */

use gwirdsif;

drop table Irods_Objects;

create table Irods_Objects
(
    irods_object_id bigint unsigned primary key not null,
    user_id int not null references Users(user_id),
    irods_server_id int unsigned not null references Irods_Servers(irods_server_id),
    irods_object_path varchar(1024) not null default '',
    marked_for_deletion_from_archive boolean not null default 0,
    deleted_from_archive boolean not null default 0,
    delete_from_archive_timestamp timestamp not null default 0,
    marked_for_deletion_from_gwirdsif_db boolean not null default 0,
    delete_from_gwirdsif_db_timestamp timestamp not null default 0,
    created timestamp not null default 0,
    last_modified timestamp not null default 0,
    dublin_core_metadata_id bigint unsigned not null default 0 
       references Dublin_Core_Metadata(dublin_core_metadata_id),
    dublin_core_metadata_irods_object_id bigint unsigned not null default 0
       references Irods_Objects(irods_object_id),
    irods_object_ref_id bigint unsigned not null default 0
       references Irods_Objects(irods_object_id),

    encrypted boolean not null default 0,

    signed_gpg boolean not null default 0,

    detached_signature_irods_object_id bigint unsigned not null default 0 
       references Irods_Objects(irods_object_id),

    gpg_key_pair_id_encrypt int unsigned not null default 0 
       references GPG_Key_Pairs(gpg_key_pair_id),

    gpg_key_pair_id_sign int unsigned not null default 0 
       references GPG_Key_Pairs(gpg_key_pair_id),

    gpg_key_fingerprint_encrypt varchar(64) not null default '',

    gpg_key_fingerprint_sign varchar(64) not null default '',

    compressed_tar_file boolean not null default 0,

    compressed_gzip boolean not null default 0,

    compressed_bzip2 boolean not null default 0;

);

show columns from gwirdsif.Irods_Objects;

insert into Irods_Objects
(irods_object_id, user_id, irods_server_id, irods_object_path)
values
(0, 0, 0, 'NULL IRODS OBJECT PATH');

select * from Irods_Objects\G

select * from Irods_Objects where irods_object_id > 0\G

select * from Irods_Objects_Handles\G

select distinct handle, idx, type from handlesystem_standalone.handles where handle_id = 56\G

select * from handlesystem_standalone.handles where handle like('12345/0000%') order by handle_id\G

select * from Irods_Objects where irods_object_id > 0\G

show columns from Irods_Objects;

alter table gwirdsif.Irods_Objects add column compressed_tar_file boolean not null default 0;
alter table gwirdsif.Irods_Objects add column compressed_gzip boolean not null default 0;
alter table gwirdsif.Irods_Objects add column compressed_bzip2 boolean not null default 0;

alter table gwirdsif.Irods_Objects drop column public_key_id_encrypt;
alter table gwirdsif.Irods_Objects drop column public_key_id_sign;

alter table gwirdsif.Irods_Objects add column gpg_key_id_encrypt char(8) 
not null default '' references gwirdsif.Users(gpg_key_id);

alter table gwirdsif.Irods_Objects add column gpg_key_id_sign char(8) 
not null default '' references gwirdsif.Users(gpg_key_id);

alter table gwirdsif.Irods_Objects add column deleted_from_archive boolean default 0;

alter table gwirdsif.Irods_Objects add column encrypted boolean not null default 0;
alter table gwirdsif.Irods_Objects drop column signed;

alter table gwirdsif.Irods_Objects add column signed_gpg boolean not null default 0;

alter table gwirdsif.Irods_Objects drop column detached_signature_irods_object;

alter table gwirdsif.Irods_Objects add column detached_signature_irods_object_id
bigint unsigned not null default 0 references Irods_Objects(irods_object_id);       

alter table gwirdsif.Irods_Objects drop column gpg_key_id;


alter table gwirdsif.Irods_Objects add column gpg_key_id_encrypt char(8) not null default '' 
references Users(gpg_key_id);       

alter table gwirdsif.Irods_Objects add column gpg_key_id_sign char(8) not null default '' 
references Users(gpg_key_id);       

alter table gwirdsif.Irods_Objects add column 
   irods_object_ref_id bigint unsigned not null default 0 references Irods_Objects(irods_object_id);

alter table gwirdsif.Irods_Objects add column marked_for_deletion_from_archive boolean default 0;
alter table gwirdsif.Irods_Objects add column marked_for_deletion_from_gwirdsif_db boolean default 0;


alter table gwirdsif.Irods_Objects add column dublin_core_metadata_id bigint unsigned not null default 0 
       references Dublin_Core_Metadata(dublin_core_metadata_id);

alter table gwirdsif.Irods_Objects add column dublin_core_metadata_irods_object_id 
   bigint unsigned not null default 0 references Irods_Objects(irods_object_id);


alter table gwirdsif.Irods_Objects change column deleted deleted_from_gwirdsif_db boolean default 0;

alter table gwirdsif.Irods_Objects modify column created timestamp default 0;
alter table gwirdsif.Irods_Objects modify column last_modified timestamp default 0;
alter table gwirdsif.Irods_Objects drop column deleted_from_gwirdsif_db;

alter table gwirdsif.Irods_Objects order by 

show columns from Irods_Objects;

select * from Irods_Objects where irods_object_id > 0\G

select * from  Irods_Objects where irods_object_id > 0\G

select irods_object_id, 
       user_id, 
       irods_server_id,
       irods_object_path,
       marked_for_deletion_from_archive,
       marked_for_deletion_from_gwirdsif_db,
       deleted_from_gwirdsif_db,
       deleted_from_archive,
       created,
       unix_timestamp(created),
       last_modified,
       unix_timestamp(last_modified)
   from  Irods_Objects where irods_object_id > 0\G

select * from  Irods_AVUs where irods_object_id > 0 order by irods_object_id\G

select * from handlesystem_standalone.handles where handle like('12345/00001') order by handle_id, handle\G

select * from handlesystem_standalone.handles where handle like('12345/00___') order by handle_id, handle\G

grant all on table Irods_Objects to lfinsto, handleserver;


select * from gwirdsif.Irods_Objects\G


/* ** (2)  Irods_AVUs  */ 

/* 
LOG
LDF 2013.03.20.
Added this table declaration.
ENDLOG

*/

drop table Irods_AVUs;

create table Irods_AVUs
(
   irods_avu_id bigint unsigned primary key not null,
   irods_object_id bigint unsigned references Irods_Objects(irods_object_id),
   attribute varchar(512),
   value varchar(512),
   units varchar(16),
   time_set timestamp default 0
);


grant all on table Irods_AVUs to lfinsto, handleserver;

insert into Irods_AVUs
(
   irods_avu_id,
   irods_object_id,
   attribute,
   value,
   units,
   time_set)
values
(0, 0, 'NULL_ATTRIBUTE', 'NULL_VALUE', 'NULL_UNITS', 0);


insert into Irods_AVUs
(
   irods_avu_id,
   irods_object_id,
   attribute,
   value,
   units,
   time_set)
values
(2, 1, 'TEST_ATTRIBUTE', 'TEST_VALUE', 'TEST_UNITS', now());


use gwirdsif;

show columns from Irods_AVUs;

select * from Irods_Objects where irods_object_id > 0 order by irods_object_id\G

select irods_object_id, irods_avu_id, attribute, value, units, time_set
   from Irods_AVUs order by irods_object_id, irods_avu_id\G

select irods_object_id, irods_avu_id, attribute, value, units, time_set
   from Irods_AVUs 
   where irods_avu_id > 0 and irods_object_id > 0
   order by irods_object_id, irods_avu_id\G

select * from Irods_AVUs;


/* ** (2) Irods_Objects_Handles  */

create table Irods_Objects_Handles
(
    irods_object_id bigint unsigned references Irods_Objects(irods_object_id),
    handle_id bigint unsigned references handlesystem_standalone.handes(handle_id)

);

grant all on table Irods_Objects_Handles to lfinsto, handleserver;

insert into Irods_Objects_Handles
(irods_object_id, handle_id)
values
(0, 0);

select * from Irods_Objects_Handles;


select * from handlesystem_standalone.handles where handle_id = 56\G 


/* ** (2) */

/* Select all fields from a row of Irods_Objects and all rows from 
   the handles (handlesystem_standalone.handles) for that iRODS object.

    LDF 2013.01.08.
*/

select i.irods_object_id, i.user_id, i.irods_server_id, i.irods_object_path, i.deleted,
    i.created, i.last_modified, 
    h.handle_id,
    h.handle_value_id,
    h.handle,
    h.idx,
    h.type,
    h.data,
    h.ttl_type,
    h.ttl,
    h.timestamp,
    h.refs,
    h.admin_read,
    h.admin_write,
    h.pub_read,
    h.pub_write,
    h.created,
    h.last_modified
from Irods_Objects as i, Irods_Objects_Handles as ih, handlesystem_standalone.handles as h
where
    i.irods_object_id = 1
    and i.irods_object_id = ih.irods_object_id
    and h.handle_id = ih.handle_id
\G

select i.irods_object_id, i.user_id, i.irods_server_id, i.irods_object_path, i.deleted,
    i.created, i.last_modified, 
    h.handle_id,
    h.handle
from Irods_Objects as i, Irods_Objects_Handles as ih, handlesystem_standalone.handles as h
where i.irods_object_id = ih.irods_object_id
    and h.handle_id = ih.handle_id
    and i.irods_object_id > 0
    and h.handle_id > 0
\G


select * from Irods_Objects where irods_object_id > 0\G
select * from Irods_AVUs\G


/* ** (2) */

delete from Irods_Objects where irods_object_id = 1;

select * from Irods_Objects_Handles where irods_object_id = 1;

delete from Irods_Objects_Handles where irods_object_id = 1;

/* ** (2) Irods_Servers  */

drop table Irods_Servers;

create table Irods_Servers
(
   irods_server_id int unsigned primary key not null,
   irods_server_name varchar(1024) not null default '',
   irods_server_ip_address varchar(1024),
   irods_server_port int unsigned not null,
   irods_server_admin varchar(1024)        
);


grant all on table Irods_Servers to lfinsto, handleserver;

insert into Irods_Servers
(irods_server_id, irods_server_name, irods_server_ip_address, irods_server_port, irods_server_admin)
values
(0, 'NULL_IRODS_SERVER_NAME', 'NULL_IRODS_SERVER_IP_ADDRESS', 0, 'NULL_IRODS_SERVER_ADMIN');


insert into Irods_Servers
(irods_server_id, irods_server_name, irods_server_ip_address, irods_server_port, irods_server_admin)
values
(1, 'pcfinston.gwdg.de', '134.76.5.25', 1247, 'lfinsto');


show columns from Irods_Servers;
select * from Irods_Servers\G

/* ** (2) view Irods_Info  */

/*
   LOG
   LDF 2013.06.07.
   Added this view.
   ENDLOG
*/

/* !! START HERE:  LDF 2013.08.08.  Update this view.  */

drop view Irods_Info;

show tables;

show columns from Irods_Info;

create view Irods_Info as 
select IO.irods_object_id, IA.irods_avu_id, IO.user_id, 
IO.irods_object_path, IA.attribute, 
IA.value, IA.units, IA.time_set as 'AVU timeset',
IO.created as 'irods object created', IO.last_modified as 'irods object last modified', 
IO.marked_for_deletion_from_archive as 'irods_object_marked_for_deletion_from_archive',
IO.marked_for_deletion_from_gwirdsif_db as 'irods_object_marked_for_deletion_from_gwirdsif_db',
IO.deleted_from_archive as 'irods_object_deleted_from_archive',
IO.delete_from_archive_timestamp as 'irods_object_delete_from_archive_timestamp',
IO.delete_from_gwirdsif_db_timestamp as 'irods_object_delete_from_gwirdsif_db_timestamp'
from Irods_Objects as IO, Irods_AVUs as IA
where IO.irods_object_id = IA.irods_object_id
and IO.irods_object_id > 0 and IA.irods_avu_id > 0
order by IO.irods_object_id, IA.irods_avu_id;

show columns from Irods_Info\G

grant all on Irods_Info to 'lfinsto';

select * from Irods_Info order by irods_object_id, irods_avu_id\G

select irods_avu_id, irods_object_path from Irods_Info order by irods_object_id, irods_avu_id\G

select * from Irods_Info where irods_object_id = 3\G

select * from Irods_AVUs where irods_avu_id > 0 order by irods_avu_id\G

/* ** (2) Irods_Objects_Dublin_Core_Metadata  */

/* 
LOG
LDF 2013.12.05.
Added this table.
ENDLOG

*/

create table Irods_Objects_Dublin_Core_Metadata
(

    irods_object_id         bigint unsigned not null default 0 references Irods_Objects(irods_object_id),
    dublin_core_metadata_id bigint unsigned not null default 0 references Dublin_Core_Metadata(dublin_core_metadata_id)

);

insert into Irods_Objects_Dublin_Core_Metadata (irods_object_id, dublin_core_metadata_id) values (0, 0);

select * from Irods_Objects_Dublin_Core_Metadata order by irods_object_id, dublin_core_metadata_id;


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
