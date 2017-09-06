/* gwirdcli.sql  */
/* [...]/Finston/gwrdifpk/database/gwirdcli.sql  */

/* Created by Laurence D. Finston (LDF) Thu Apr 25 18:03:06 CEST 2013  */

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

show databases;

show tables;

use mysql;

use gwirdcli;

select User from mysql.user;

/* ** (2)  Database `gwirdcli'  */ 

create database gwirdcli;

use gwirdcli;

show tables;

/* *** (3) Handles database table  */

/* See `handle.sql'  LDF 2013.08.26.  */

select distinct User from user order by User;

create user 'jdoe';
create user 'jsmith';
create user 'abrown';

set password for 'jdoe'@'localhost' = password('jdoe');
set password for 'jsmith'@'localhost' = password('jsmith');
set password for 'abrown'@'localhost' = password('abrown');

GRANT ALL ON gwirdcli.* TO 'abrown'@'localhost';
GRANT ALL ON gwirdcli.* TO 'jdoe'@'localhost';
GRANT ALL ON gwirdcli.* TO 'jsmith'@'localhost';

/* *** (3) Users  */

create table Users
(
    user_id int primary key,
    username varchar(128) unique not null,
    irods_password_encrypted varchar(2048),  /* 2048 == 2^11  */
    irods_password_encrypted_timestamp timestamp default 0,
    Distinguished_Name varchar(256),
    irods_homedir varchar(128),
    irods_zone varchar(128),
    irods_default_resource varchar(128),
    handle_username varchar(128) default '',
    handle_password_encrypted varchar(32) default '',
    default_institute_id int references Institutes(institute_id),
    default_prefix_id int references Prefixes(prefix_id),
);



alter table Users drop column gpg_key_id;

alter table Users change public_key_id gpg_key_id char(8) not null default '';

alter table Users add gpg_key_id char(8) not null default '';

grant all on table Users to lfinsto;

insert into Users (user_id, username, Distinguished_Name, irods_password_encrypted, 
                   irods_password_encrypted_timestamp,
                   irods_homedir, irods_zone, irods_default_resource, 
                   default_institute_id, default_prefix_id) 
   values
   (0, 'NULL_USER', 'NULL_DISTINGUISHED_NAME', 'NULL_PASSWORD_ENCRYPTED', 0,
    'NULL_HOMEDIR', 'NULL_ZONE', 'NULL_DEFAULT_RESOURCE', 0, 0);




select * from gwirdcli.Users as U, gwirdcli.GPG_Key_Pairs as G 
where U.user_id > 0 and U.user_id = G.user_id
order by U.user_id\G

use gwirdcli;
delete from Users where user_id = 1;

/* '/C=DE/ST=Germany/L=Goettingen/O=GWDG/OU=gwrdifpk/CN=Laurence Finston',  */



replace into Users (user_id, username, Distinguished_Name, irods_password_encrypted, 
                   irods_homedir, irods_zone, irods_default_resource, handle_username, default_institute_id, 
                   default_prefix_id) 
values

   (1, 'lfinsto', 
    '/C=DE/O=GWDG/OU=gwrdifpk/L=Goettingen/ST=Germany/CN=Laurence Finston',
'-----BEGIN PGP MESSAGE-----
Version: GnuPG v2.0.18 (GNU/Linux)

hQEMA5VtQf3LogBwAQf9GY3UJQIvUwCsaRFKwzmbF+Aj797+Wmx/MCYLC09rlig8
tog3ysZGds6xmY54Ps5gYvKnFgMgnMQqOrqa/y2sk+4y8ifr1H55M3fcZCpNpKEC
NVqWSWjP7S0B8WrCrX8bzD08ONy+lWRrh6buhenuUdmGzhYf7XwEeuTQm6A2kXKg
3K/dRvsd+jaHXWUshvWGJzh8Y1+IHv4ZRe5XOdHWK5sE/V7m9fIupBl6rhBejeKy
8tQwY0Ug4RFkGYeU82Pg5yAOdQ0Xdm3ROgKyY+dM4QzsGJWeYlsAgSf/hhNN+2p3
1NKLGT2aFtdcARyRcoHJM/rQXcxpSSLXMt/0e1Uo0NJKAShI6EbbmWuZnyOigw+f
FTYAloiHKfqamJVX+0Tei0Mj/mITgmndBhAiviiHHPnSud6D1K61EW2hjYBmiv6o
FoOM1G7R39v8sdE=
=VHIK
-----END PGP MESSAGE-----
',
'/tempZone/home/lfinsto', 'tempZone', 'demoResc', 'lfinsto', 1, 1);

select * from Users order by user_id\G

select * from gwirdcli.Users where user_id = 1\G
select * from gwirdsif.Users where user_id = 1\G

use gwirdcli;

update Users set gpg_key_id = 'CA0E93A2' where user_id = 1;


/* *** (3) */

show tables;

show columns from handles;

show columns from Users;

select * from handles;

/* *** (3) Pull_Servers  */

drop table Pull_Servers;

create table Pull_Servers
(
    pull_server_id int primary key,
    server_hostname varchar(128) not null default '',    
    server_ip_address varchar(64) not null default '',
    server_distinguished_name varchar(256) not null default '',
    created datetime not null default 0,
    last_modified datetime not null default 0
);

grant all on table Pull_Servers to lfinsto;

show columns from Pull_Servers;

replace into Pull_Servers (
    pull_server_id,
    server_hostname,
    server_ip_address,
    server_distinguished_name,
    created,
    last_modified)
values
(0, '', '', '', 0, 0),
(1, 'pcfinston.gwdg.de', '134.76.5.25', 
'/C=DE/O=GWDG/OU=gwrdifpk/L=Goettingen/ST=Niedersachsen/CN=gwirdsif', now(), 0);

select * from Pull_Servers order by pull_server_id\G

/* *** (3) Pull_Responses  */

/* 
LOG
LDF 2014.02.11.
Added this table.
ENDLOG 
*/

drop table Pull_Responses;

use gwirdcli;

create table Pull_Responses
(
    pull_response_id int primary key,
    user_id int not null default 0 references Users(user_id),
    server_hostname varchar(128) not null default '',    
    server_ip_address varchar(64) not null default '',
    client_hostname varchar(128) not null default '',    
    client_ip_address varchar(64) not null default '',
    pull_interval int not null default 0,
    latest_pull datetime not null default 0,
    created datetime not null default 0,
    last_modified datetime not null default 0
);

alter table Pull_Responses modify column pull_interval int not null default 0;
alter table Pull_Responses drop column distinguished_name;


grant all on table Pull_Responses to lfinsto;

show columns from Pull_Responses;

select P.pull_response_id, U.user_id, U.username, P.distinguished_name,
U.irods_homedir, U.irods_zone, U.irods_default_resource,
P.client_hostname, P.client_ip_address, P.pull_interval, 
P.latest_pull, P.created, P.last_modified
from Pull_Responses as P, Users as U 
where P.user_id = U.user_id order by pull_response_id\G

select P.pull_response_id, U.user_id, U.username, U.Distinguished_Name,
U.irods_homedir, U.irods_zone, U.irods_default_resource,
P.client_hostname, P.client_ip_address, P.pull_interval, 
P.latest_pull, P.created, P.last_modified
from Pull_Responses as P, Users as U 
where P.pull_response_id > 0
and P.user_id = U.user_id order by pull_response_id\G

select * from Pull_Paths where pull_path_id > 0\G

insert into Pull_Responses
(pull_response_id, user_id, distinguished_name, server_hostname, server_ip_address, 
client_hostname, client_ip_address, 
 pull_interval, latest_pull, created, last_modified)
values
(0, 0, '', '', '', '', '', 0, 0, 0, 0);

select * from Pull_Responses where pull_response_id > 0 order by pull_response_id\G

select * from Pull_Paths where pull_path_id > 0 order by pull_path_id\G

update Pull_Responses set latest_pull = timestampadd(day, -1.5, now()) where pull_response_id = 1;

replace into  Pull_Responses (pull_response_id, user_id, 
                              server_hostname, server_ip_address, 
                              client_hostname, client_ip_address, 
                              pull_interval, latest_pull, created, last_modified) 
                      values (1, 1, 
                              'pcfinston.gwdg.de', '134.76.5.25', 'pcfinston.gwdg.de', '134.76.5.25', 
                     86400, 0, now(), 0);


delete from Pull_Responses where pull_response_id > 0;

update Pull_Responses set latest_pull = now() where pull_response_id = 1;

update Pull_Responses set latest_pull = timestampadd(second, -86500, now()) where pull_response_id = 1;



select * from Pull_Responses where pull_response_id = 1\G

select * from Pull_Paths order by pull_path_id\G

/* *** (3) Pull_Paths  */

drop table Pull_Paths;

create table Pull_Paths
(
    pull_path_id int primary key,
    pull_response_id int references Pull_Responses(pull_response_id),
    owner_id int not null default 0 references Users(user_id),
    local_path varchar(512) not null default '',
    remote_path varchar(512) not null default '',
    checksum_sha224 varchar(64) not null default '',
    created datetime not null default 0,
    last_modified datetime not null default 0
);

grant all on table Pull_Paths to lfinsto;

replace into Pull_Paths (pull_path_id, pull_response_id, owner_id, 
                        local_path, remote_path, checksum_sha224, created, last_modified)
values
(0, 0, 0, '',
'',
'', 0, 0);


replace into Pull_Paths (pull_path_id, pull_response_id, owner_id, 
                        local_path, remote_path, checksum_sha224, created, last_modified)
values
(1, 1, 1, '/home/lfinsto/irods_proj/irods_master/Finston/gwrdifpk/src/abc.txt',
'/tempZone/home/lfinsto/abc.txt',
'e36d4285f132166368050318a2478a54c175db9d1381dfa7934519ca', now(), 0);

replace into Pull_Paths (pull_path_id, pull_response_id, owner_id, 
                        local_path, remote_path, checksum_sha224, created, last_modified)
values
(2, 1, 1, '/home/lfinsto/irods_proj/irods_master/Finston/gwrdifpk/src/def.txt',
'/tempZone/home/lfinsto/def.txt',
'e36d4285f132166368050318a2478a54c175db9d1381dfa7934519ca', now(), 0);

delete from Pull_Paths where pull_path_id > 1;

update gwirdsif.Pull_Requests set latest_pull = 0 where pull_request_id = 1;
update Pull_Responses set latest_pull = 0 where pull_response_id = 1;
update Pull_Paths set checksum_sha224 = 'xxx' where pull_path_id in (1, 2);

select * from Pull_Paths where pull_path_id > 0 order by pull_path_id\G
select * from Pull_Paths where pull_path_id > 0 order by pull_path_id\G

select * from handlesystem_standalone.handles where data like('%abc%') order by handle_id\G

select * from handlesystem_standalone.handles where handle = '12345/00001' 
order by handle_value_id\G

select * from gwirdsif.Irods_Objects where irods_object_path = '/tempZone/home/lfinsto/abc.txt'
order by irods_object_id\G


/* *** (3) Privileges_Gwirdcli  */

drop table Privileges_Gwirdcli;

select * from Users\G

create table Privileges_Gwirdcli
(
    user_id int primary key unique not null references Users(user_id),
    superuser boolean not null default 0,
    delegate boolean not null default 0,
    add_groups boolean not null default 0,
    delete_groups boolean not null default 0,
    show_user_info boolean not null default 0,
    show_groups boolean not null default 0,
    show_certificates boolean not null default 0,
    show_distinguished_names boolean not null default 0,
    show_privileges boolean not null default 0,

    pull_response_self boolean not null default 0,
    pull_response_group boolean not null default 0,
    pull_response_all boolean not null default 0


);

grant all on Privileges_Gwirdcli to lfinsto;

show columns from gwirdcli.Privileges_Gwirdcli;

insert into gwirdcli.Privileges_Gwirdcli
(user_id, superuser, delegate, add_groups, delete_groups, show_user_info,
 show_groups, show_certificates, show_distinguished_names, show_privileges,
 pull_response_self, pull_response_group, pull_response_all)
values
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

insert into gwirdcli.Privileges_Gwirdcli
(user_id, superuser, delegate, add_groups, delete_groups, show_user_info,
 show_groups, show_certificates, show_distinguished_names, show_privileges,
 pull_response_self, pull_response_group, pull_response_all)
values
(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

insert into gwirdcli.Privileges_Gwirdcli
(user_id, superuser, delegate, add_groups, delete_groups, show_user_info,
 show_groups, show_certificates, show_distinguished_names, show_privileges,
 pull_response_self, pull_response_group, pull_response_all)
values
(2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

insert into gwirdcli.Privileges_Gwirdcli
(user_id, superuser, delegate, add_groups, delete_groups, show_user_info,
 show_groups, show_certificates, show_distinguished_names, show_privileges,
 pull_response_self, pull_response_group, pull_response_all)
values
(3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

select * from gwirdcli.Privileges_Gwirdcli\G

select * from gwirdcli.Users\G


/* *** (3) */



/* ** (2) */


insert into gwirdcli.handles (handle, idx, type, data, ttl_type, 
ttl, timestamp, refs, 
admin_read, admin_write, pub_read, pub_write, handle_id, handle_value_id, 
created_by_user_id, deleted, created, last_modified) values 
('12345/00001', 1, 'IRODS_OBJECT', NULL, 0, 86400, from_unixtime(1365173037), NULL, 
1, 1, 1, 0, 50, 112, 1, 0, from_unixtime(1365176637), 
from_unixtime(0));


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

