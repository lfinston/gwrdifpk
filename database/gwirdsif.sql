/*  gwirdsif.sql  */
/* Created by Laurence D. Finston (LDF) Wed Jul 11 08:38:32 CEST 2012  */

/* gwirdsif.sql  */
/* [..]/Finston/gwrdifpk/database/gwirdsif.sql  */


/* * (1)  Top  */

/* * (1) Copyright and License.

This file is part of gwrdifpk, a package for long-term archiving.  
Copyright (C) 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021 Gesellschaft fuer wissenschaftliche Datenverarbeitung mbH Goettingen

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

/* ** (2)  Database and user info  */ 

show databases;

show tables;

use mysql;

use gwirdsif;

select User from mysql.user;

/* or  */

show columns from user;
select User from mysql.user;

select distinct user_name from Users order by user_name;
select * from Users where user_name = 'dgon0005' order by user_id;

create user 'lfinsto';

create user 'cpohl';
create user 'cboehme1';
create user 'pwieder';
create user 'uschwar1';
create user 'abruns1';

grant all on table Institutes to cboehme1@localhost;
grant all on table Users to cboehme1@localhost;
grant all on table TANs to cboehme1@localhost;

grant all on table Institutes to cpohl@localhost;
grant all on table Users to cpohl@localhost;
grant all on table TANs to cpohl@localhost;

grant all on table Institutes to pwieder@localhost;
grant all on table Users to pwieder@localhost;
grant all on table TANs to pwieder@localhost;

grant all on table Institutes to uschwar1@localhost;
grant all on table Users to uschwar1@localhost;
grant all on table TANs to uschwar1@localhost;


grant all on table Institutes to abruns1@localhost;
grant all on table Users to abruns1@localhost;
grant all on table TANs to abruns1@localhost;

grant show databases on *.* to lfinsto@localhost;
grant show databases on *.* to cboehme1@localhost;
grant show databases on *.* to cpohl@localhost;
grant show databases on *.* to pwieder@localhost;
grant show databases on *.* to uschwar1@localhost;
grant show databases on *.* to abruns1@localhost;

show grants for 'lfinsto';
show grants for 'cboehme1'@'localhost';
show grants for 'cpohl';
show grants for 'pwieder';
show grants for 'uschwar1';
show grants for 'abruns1';

select user_id from Users where user_name = 'dgmd0009' order by user_id limit 10 offset 1;

delete from Users where user_id in (20, 34);

/* ** (2)  Database `gwirdsif'  */ 

create database gwirdsif;

use gwirdsif;

select table_name from tables where table_schema = 'YYY' order by table_name;

-- drop database gwirdsif;

/* ** (2)  Drop tables.  */

-- drop table Users;
-- drop table Certificates

/* ** (2)  Create tables.  */

/* *** (3)  Institutes.  */


drop table Institutes;

create table Institutes
(
    institute_id int primary key,
    contact int references Users(user_id),
    abbreviation char(4) unique not null,
    name varchar(128) unique not null,
    enabled boolean not null default 1
);

insert ignore into Institutes (institute_id, contact, abbreviation, name, enabled)
values
(0, 0, '0000', 'NULL INSTITUTE', 1),
(1, 1, 'ZZZZ', 'GWDG Test Institute', 1),
(2, 1, 'AAAA', 'GWDG Test Institute A', 1),
(3, 1, 'BBBB', 'GWDG Test Institute B', 1);



delete from Institutes where institute_id > 0;


grant all on table Institutes to lfinsto, cboehme1;

select * from Institutes;

/* *** (3)  Prefixes  */

use gwirdsif;
show tables;

drop table Prefixes;

create table Prefixes
(
   prefix_id int primary key,
   prefix varchar(16) unique not null,
   enabled boolean not null default 1
);

grant all on table Prefixes to lfinsto, cboehme1, pwieder, uschwar1, tkalman;


insert into Prefixes (prefix_id, prefix, enabled)
values
(0, 'NULL_PREFIX', 0),
(1, '12345', 1),
(2, '00001', 1);

select * from Prefixes;

update Prefixes set enabled = 0 where prefix_id = 2;
update Prefixes set enabled = 1 where prefix_id = 2;

/* *** (3)  Users.  */

/* !! START HERE:  LDF 2012.10.05.  Be very careful when dropping the table
   and recreating it.  Make sure to save the `irods_password_encrypted_timestamp' values.
   Otherwise, they will have to be recovered from the `.irodsA' files, which is
   a lot of work.  Perhaps use `alter table'.
*/

drop table Users;

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
    default_prefix_id int references Prefixes(prefix_id)
);

alter table Users alter column handle_password_encrypted set default '';
alter table Users change column zone irods_zone varchar(128);
alter table Users change column default_resource irods_default_resource varchar(128);
alter table Users add gpg_key_id char(8) not null default '';
alter table Users drop gpg_key_id;

alter table Users drop public_key_id;



show columns from Users;

update Users set default_prefix_id = 2;



delete from Users where user_id > 0;

select * from Prefixes;

show columns from Users;

select * from Users order by user_id\G

select u.user_id, u.username, u.default_prefix_id, p.prefix, u.default_institute_id, i.name 
from Users as u, Prefixes as p, Institutes as i 
where 
u.default_prefix_id = p.prefix_id 
and u.default_institute_id = i.institute_id
order by u.user_id;

grant all on table Users to lfinsto, cboehme1, pwieder, uschwar1, tkalman;

alter table Users add default_institute_id int;
alter table Users add foreign key(default_institute_id) references Institutes(institute_id);
alter table Users add default_prefix_id int;
alter table Users add foreign key(default_prefix_id) references Prefixes(prefix_id);

update Users set default_institute_id = 1;
update Users set default_prefix_id = 2;



/* **** (4)  Insert into Users  */

/* 


   It does _not_ work to generate the "scrambled" password files 
   on one platform and use them on another.  Perhaps the hostname 
   is used as well as the timestamp. 
   LDF 2012.09.12.

   !! PLEASE NOTE:  If a user is recreated, e.g., after reinstalling the iRODS server,
   or a password is recreated using `iadmin moduser' (i.e., the same password is used),
   then it will not be necessary to update the value of `irods_password_encrypted'
   in the row for that user.  The reason is that the combination of (unscrambled) password,
   timestamp and whatever else is used to generate the scrambled password (hostname, perhaps)
   will still be correct.
   LDF 2013.01.22.

   !! The shellscript `../src/update_irods_passwd.sh' can be used for this purpose.
   LDF 2013.05.10.

*/

delete from Users;

select * from Users order by user_id\G

insert into Users (user_id, username, Distinguished_Name, irods_password_encrypted, 
                   irods_password_encrypted_timestamp,
                   irods_homedir, irods_zone, irods_default_resource, 
                   default_institute_id, default_prefix_id, gpg_key_id) 
   values
   (0, 'NULL_USER', 'NULL_DISTINGUISHED_NAME', 'NULL_PASSWORD_ENCRYPTED', 0,
    'NULL_HOMEDIR', 'NULL_ZONE', 'NULL_DEFAULT_RESOURCE', 0, 0, '00000000');

update Users set gpg_key_id = '00000000' where user_id = 0;


delete from Users where user_id = 1;


select u.user_id, u.username, u.Distinguished_Name, i.institute_id, i.name, i.abbreviation,
p.prefix from Users as u, Institutes as i, Prefixes as p 
where u.default_institute_id = i.institute_id and p.prefix_id = u.default_prefix_id and user_id = 1\G

/* *** (3) On pcfinston.gwdg.de  */

delete from Users where user_id = 1;

/* !! IMPORTANT:  If you change `irods_password_encrypted', you must change 
   `irods_password_encrypted_timestamp', too! 
   The shellscript `../src/update_irods_passwd.sh' can be used for this purpose.
   LDF 2013.05.10.

*/

/* **** (4) */

/* /C=DE/ST=Germany/L=Goettingen/O=GWDG/OU=gwrdifpk/CN=Laurence Finston  */

replace into gwirdsif.Users (user_id, username, Distinguished_Name, irods_password_encrypted, 
                   irods_homedir, irods_zone, irods_default_resource, handle_username, default_institute_id, 
                   default_prefix_id, gpg_key_id) 
values

   (1, 'lfinsto', 
    '/C=DE/O=GWDG/OU=gwrdifpk/L=Goettingen/ST=Germany/CN=Laurence Finston',
'-----BEGIN PGP MESSAGE-----
Version: GnuPG v2.0.18 (GNU/Linux)

hQEMA5VtQf3LogBwAQgAqC8qgbsStMDYyKj3496RlcIccc/ioGnk4gf9w+yM+HK5
w+xlUm+9wKLOA8pYE67F34HHWNGLAjVEhQ48a3zhT69vGVZKP2S/8faH3AOcGxDE
m42Y9bK/k5U0bNJC52xCT55vBNQGhRSNnL/iTGL6UCuND3fDFMCuwBQmWsoLaZjf
sCmBxLZJkekATyZH49ovLCeDAp9R3iNX9QX6F+i35iy4TFxgQMGpm2UPc/QS9N1E
FxAALtzFnP78OGJvJ4N98J5v9g1KkPLXZrSKJdb5FgFuBCBkAXPow4ExrBE2VxFB
4Upog06NbxoovsIu9/MR5P17DH6aoHgWjteGfepXUdJKAYETCYevyK+3nOxmf/Ts
AqwA0AhJQNWKHenh6ny+A97RhtwZ0k9tGS69M6CYjFFWR3H/akGAX9mQCEZUw7T0
SOk+AJ9eOPI8SUk=
=Lp2N
-----END PGP MESSAGE-----
',
'/tempZone/home/lfinsto', 'tempZone', 'demoResc', 'lfinsto', 1, 1, '');


update Users set gpg_key_id = 'CA0E93A2' where username = 'lfinsto';

update Users set gpg_key_id = 'C837BDC2' where username = 'jdoe';

update Users set gpg_key_id = '789A0F86' where username = 'jsmith';

update Users set gpg_key_id = '6191215D' where username = 'abrown';


update gwirdsif.Users set Distinguished_Name =
'/C=DE/O=GWDG/OU=gwrdifpk/L=Goettingen/ST=Germany/CN=Laurence Finston' where user_id = 1;


/* **** (4) */

insert into Users (user_id, username, Distinguished_Name, 
                   irods_homedir, irods_zone, irods_default_resource, 
                   handle_username, default_institute_id, default_prefix_id) 
values

   (2, 'jdoe', 
'/C=DE/ST=Niedersachsen/L=Goettingen/O=GWDG/OU=gwrdifpk/CN=John Doe',
'/tempZone/home/jdoe', 'tempZone', 'demoResc', 'jdoe', 1, 1);


update Users set Distinguished_Name =
'/C=DE/ST=Niedersachsen/L=Goettingen/O=GWDG/OU=gwrdifpk/CN=John Doe' where user_id = 2;

select * from Users order by user_id\G


delete from Users where user_id = 3;

insert into Users (user_id, username, Distinguished_Name, 
                   irods_homedir, irods_zone, irods_default_resource, 
                   handle_username, default_institute_id, default_prefix_id) 
values

   (3, 'jsmith', 
'/C=DE/ST=Niedersachsen/L=Goettingen/O=GWDG/OU=gwrdifpk/CN=Jane Smith',
'/tempZone/home/jsmith', 'tempZone', 'demoResc', 'jsmith', 1, 1);


replace into gwirdcli.Users (user_id, username, Distinguished_Name, 
                   irods_homedir, irods_zone, irods_default_resource, 
                   handle_username, default_institute_id, default_prefix_id) 
values

   (3, 'jsmith', 
'/C=DE/O=GWDG/OU=gwrdifpk/L=Goettingen/ST=Niedersachsen/CN=Jane Smith',
'/tempZone/home/jsmith', 'tempZone', 'demoResc', 'jsmith', 1, 1);

/C=DE/ST=Niedersachsen/L=Goettingen/O=GWDG/OU=gwrdifpk/CN=Jane Smith

update Users set Distinguished_Name =
'/C=DE/ST=Niedersachsen/L=Goettingen/O=GWDG/OU=gwrdifpk/CN=Jane Smith' where user_id = 3;

select * from Users order by user_id\G


select U.user_id, U.username, U.irods_password_encrypted,
U.irods_password_encrypted_timestamp, U.Distinguished_Name, U.irods_homedir,
U.irods_zone, U.irods_default_resource, U.handle_username,
U.handle_password_encrypted, U.default_institute_id, U.default_prefix_id,
G.gpg_key_pair_id, G.fingerprint from gwirdcli.Users as U,
gwirdcli.GPG_Key_Pairs as G where Distinguished_Name =
'/C=DE/O=GWDG/OU=gwrdifpk/L=Goettingen/ST=Niedersachsen/CN=Jane Smith' and
U.user_id = G.user_id order by U.user_id, G.gpg_key_pair_id desc limit 1;

select * from gwirdcli.GPG_Key_Pairs order by gpg_key_pair_id\G









/* ***** (5) */

insert into Users (user_id, username, Distinguished_Name, 
                   irods_homedir, irods_zone, irods_default_resource, 
                   handle_username, default_institute_id, default_prefix_id) 
values

   (4, 'abrown', 
'/C=DE/ST=Niedersachsen/L=Goettingen/O=GWDG/OU=gwrdifpk/CN=Albert Brown',
'/tempZone/home/abrown', 'tempZone', 'demoResc', 'abrown', 1, 1);



/* **** (4) */

update gwirdsif.Users set irods_password_encrypted_timestamp = '2013-05-10 17:48:58' where user_id = 1;

select * from Users where user_id = 1\G

select * from Users order by user_id\G


select * from Users order by user_id\G

delete from Users where user_id = 1;

update Users set irods_password_encrypted = '' where user_id = 1;


/* *** (3)  Users_Prefixes  */

create table Users_Prefixes
(
   user_id int references Users(user_id),
   prefix_id int references Prefixes(prefix_id)
);

grant all on table Users_Prefixes to lfinsto, cboehme1, pwieder, uschwar1, tkalman;

replace into Users_Prefixes (user_id, prefix_id)
values
(0, 0),
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2);


select * from Users_Prefixes order by user_id, prefix_id;

select u.user_id, u.username, p.prefix_id, p.prefix from Users as u, Prefixes as p, 
Users_Prefixes as up where u.user_id = up.user_id and up.prefix_id = p.prefix_id 
order by p.prefix_id, u.user_id;

/* *** (3)  TANs  */ 

drop table TANs;

create table TANs
(
    user_id int default 0 references Users(user_id),
    TAN varchar(64) primary key,
    expiration timestamp default 0
);

grant all on table TANs to lfinsto;

select * from TANs;
show columns from TANs;

select count(TAN) from TANs;

/* timestampadd(month, 6, utc_timestamp())   */

insert ignore into TANs (TAN) 
values 
('xEzo 9Xd9 jBWt F0zJ K0Fs Ssmt'),
('gQpg vz5B xBPR wB2p WQNJ gjgv'),
('Etku 40cQ DA1w gGXN Wrcm tN2Z'),
('8TRf OdsX UdP5 ZFh1 tRuY aTMi'),
('6gGs ZWm8 yKgg 2o3U NvZZ lFle'),
('bqq6 Lczp KV2T pSqu hNbb JBCg'),
('zJtG lwJb Reww 11fg tgtD SeIk'),
('QioT R4za 6ZCp MGEZ v7z0 TZ8y');


/* *** (3)  GPG_Key_Pairs  */ 

drop table GPG_Key_Pairs;

drop table gwirdsif.GPG_Key_Pairs;
drop table gwirdcli.GPG_Key_Pairs;


use gwirdcli;
use gwirdsif;

create table GPG_Key_Pairs
(
   gpg_key_pair_id int unsigned primary key not null default 0,
   user_id int not null default 0 references Users(user_id),
   uid varchar(128) not null default '',
   fingerprint varchar(64) not null default '',
   public_key blob not null,
   revoked boolean not null default 0,
   created datetime not null default 0,
   last_modified datetime not null default 0
);

show columns from gwirdcli.GPG_Key_Pairs;
show columns from gwirdsif.GPG_Key_Pairs;

alter table gwirdsif.GPG_Key_Pairs drop column gpg_key_id;
alter table gwirdcli.GPG_Key_Pairs drop column gpg_key_id;

alter table gwirdsif.GPG_Key_Pairs add column revoked boolean not null default 0;
alter table gwirdcli.GPG_Key_Pairs add column revoked boolean not null default 0;

show tables from gwirdcli;

grant all on table GPG_Key_Pairs to lfinsto;

select * from gwirdsif.GPG_Key_Pairs order by gpg_key_pair_id\G
select * from gwirdcli.GPG_Key_Pairs order by gpg_key_pair_id\G

select * from gwirdsif.GPG_Key_Pairs\G


insert into gwirdsif.GPG_Key_Pairs (gpg_key_pair_id, user_id, fingerprint, public_key)
values
(0, 0, '', '');

insert into gwirdcli.GPG_Key_Pairs (gpg_key_pair_id, user_id, fingerprint, public_key)
values
(0, 0, '', '');

insert into gwirdcli.GPG_Key_Pairs (gpg_key_pair_id, user_id, fingerprint, public_key)
values
(0, 0, '', '');

replace into gwirdsif.GPG_Key_Pairs (gpg_key_pair_id, user_id, fingerprint, public_key)
values
(2, 2, '', ''),
(3, 3, '', ''),
(4, 4, '', '');

delete from gwirdsif.GPG_Key_Pairs where gpg_key_pair_id > 1;


select user_id from gwirdsif.Users order by user_id\G

select gpg_key_pair_id, user_id from gwirdsif.GPG_Key_Pairs order by gpg_key_pair_id, user_id\G

select * from gwirdsif.GPG_Key_Pairs order by gpg_key_pair_id, user_id\G


use gwirdsif;

use gwirdcli;

replace into GPG_Key_Pairs (gpg_key_pair_id, user_id, uid, fingerprint, public_key, created)
values
(1, 1, 'lfinsto (gwrdifpk) (Laurence Finston) <noone@nowhere.de>',
'41E4286D5DED32B80956D5429CBFF6B2CA0E93A2',
'-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v2.0.18 (GNU/Linux)

mQENBFI8BwQBCACtoSL8r20Gb+YaGByz/DMSaQzT3NL2BT+X2AmAfKzxWwkFFz0C
7ppD0txiphN1IXqnLepet8DsnGRwFjE7Io4Q0WNQyIewSY8hthV68mmekQxUFWQB
QixB+rSYaWAwHkXq+NBWkHpVo3wgLwQcWUKIppxu4VnEzTmRsnpgio0h+3aFDfdu
eRDA6AleypgqQNoYzIUlWjLAeMDuxZgM2WcHl7jREbJ7RN+BEg6CJXOJEFhlEJEz
Xs0nmDx2rHfIsahthAUasgRGaXjUiV8Ug0xnDxy0yLVGIl15esRigp4WltGdp3o1
aaOECJKPjusS1MbR9VpxW3hj71ovFy7fVmoZABEBAAG0OGxmaW5zdG8gKGd3cmRp
ZnBrKSAoTGF1cmVuY2UgRmluc3RvbikgPG5vb25lQG5vd2hlcmUuZGU+iQE4BBMB
AgAiBQJSPAcEAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRCcv/ayyg6T
oi5zB/4pSeYpgkAfO3Q8BZR8w0K23mwlgxssfFxetqBq1B4w2/Lg0J3VIe40O0+B
6F4KHpM+5mMHLud1+XdKmzqKMPG09MIZ7X9x+LLC37RgXhSFlNL0yPUMhuY1pMNt
kROAQLNzfMylHdk2iXjpIU++RP5dbnVrmATSBc9UERHy8rBtDUt3evaUcOXzLXXN
H7sbkqj/deFRBalCVcWnyN1Jq2CwdoGV4W060F6/TH72ZyIz44UHxe7DM5xSi35I
9LcTYLJZEeA+rXQnub1BNFtcR+16+BggqhPHQwkVwga4B62MtXHhhidCyemq2B3m
rInaBMwTOExpItWTmMz05zeeZnXnuQENBFI8BwQBCADbOjNI8awKuaUF6+jaF6ws
ugAwWkDdRjcb9IUo/RFP7tCI8rkDCfXJkIqMaZ5Zm/CjVA9LYqaJWKRro+It0plV
GjtMNSP1Z+EBVqHm0O8NVD3l6NUyLAZ7ef2saZMor0FkKJNWFzQTTrwX+7+tulic
resVCDEL7XSGyNq/esmZVYGZIKv9NLeKHScXvRx+tPPkplYnGti0Ibz5/MGRbSnW
0PvlkVWYnjUacpXq1QMf2zZGuINzIcNudCQVXarIaHI7oc3pqmwuGJqvQPsdlJM4
AdD93E1lw1TI4jCMjC8PCypWU0IcQpg3wpJ6HtGTLiU/Tw+fexl8cG2KhMpd6Bh5
ABEBAAGJAR8EGAECAAkFAlI8BwQCGwwACgkQnL/2ssoOk6JZwQf+JYRQn7lcdTEP
pIvbsHH//WM0WoreKkmyjtDxY2X04bULvyb6H7Yx1lvGTzMCkhjZV7iAOsU9sxy8
j6O6jJS+mPN42GsrP6GuyFvXu8imQAcMC/7XwPMoqBxYc2cx8RCG/5upYKqwvgUt
RyUM9NgKwAaj852K76cEARA5qwBOloSIDGmrql0VFXzHaksjMfhGMno53HOBhMMz
qSu3CY9voQ3UXWIYYWS0oPeKKR2OxAyt6M1Om/K3ULHyO8KN+ZpwLGPT+w4zvsEu
E1i3bocooJZSztZIatHTfC1tHr7I3KlZYl5LDSCQqZtOSA8ngeXornZwDOahuYCE
B0UJwEQW0g==
=Dkbf
-----END PGP PUBLIC KEY BLOCK-----',
now()
);


replace into GPG_Key_Pairs (gpg_key_pair_id, user_id, uid, fingerprint, public_key, created)
values
(2, 2, 'jdoe (gwrdifpk) (John Doe) <noone@nowhere.de>',
'836E1D9286675ADBCB71185EBCC643A4C837BDC2',
'-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v2.0.18 (GNU/Linux)

mQENBFI8B1QBCADnWiBaDFepRwuIRE2ZCFQY7Ph8m4ryaXGivgMYBKYoz4OdaSeC
SN/H9dEnxYHNoYT+vdQrQ1HL7WxjkSFkSoIpmXkq+jsxuyzITOsRpBB8lMy8dX6t
AxQiRRSmJu16nAlPLepmdQco9nDhiFy61Ov5mDMW7RSVg5kFy++eoqk9ehhmJyWZ
M2iFAWemqegXW19YJHz4/czP16tbZFBxrfNlsL33nGeguxGWAF30egIDJPmt/ayT
FsSjBgGNVHWgeKw9QTrfAdQey39DDQg2zGVtHeCTjCIX4uTJTV72g5Oyd70N/kqD
oVi47GsDJ4k3wYoGpGVcizaDqRjYIJCi1j9dABEBAAG0LWpkb2UgKGd3cmRpZnBr
KSAoSm9obiBEb2UpIDxub29uZUBub3doZXJlLmRlPokBOAQTAQIAIgUCUjwHVAIb
AwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQvMZDpMg3vcK5fAf/dYOVwopN
Ncom/FJbVq8oYyM4Y2XPLaVEdTkhAc6XaYM3WeYQnE0fuDyccrHNTiCV1hrbSyU1
RBHthiMD9DUJFQrexA/J8AZ3ECNTsn2qzcllNLVOhfZBs3tTQK+qVQGs7q2jCmhU
0X6UXZAK+GwWhW6pO8Cb6beMYSmJBlyGx28V5SSRSN7q0j/boeoBEqgMPhbOiUGP
eDA7SDTX/Zyt8LNlH/5083glxE8y7lZhljCgzTjH+3wNrA2yjrCKX70A38dLBPyO
dCWhgOCB/++AjYuC5MGWgj/U1gYVt/f2vB1oOzt+ERh0UvyIzMlft77I42Rp9CTy
Gs0GIPctYtj2w7kBDQRSPAdUAQgAx859HA2luxtNPzUqjM02OktemIMBZl+z1h8Z
Ls2Ib4nIl60dsaDwW3iZbnYh/NwXQRF6von3JUPlU9jGRsGq9JMdUXtzlu1pNsni
LpSfvPGz5yHboLUC1shYYFAk26Bw4hK21s3fKbsp56ubIw9vTUsDfKngSgV6tBdE
WnJJrqYGbWmB1+uYEsdjwIUlzO8ugVG9TWFl3mg9cCSPi9WNHfdnPxb9dN5P+DAx
azXAdPlniiywhjpozmMN79Tm9s2zxdWeU3fPL3Uwer9ouLVnA/a/B9aDiHXb8idF
JlMLuMV4XJAIYWQ8gK5ymILUqMCxfR5Js3LSJ6YhFo/ZPNVWfQARAQABiQEfBBgB
AgAJBQJSPAdUAhsMAAoJELzGQ6TIN73Cn2oIAKOgIXefQnjwNjJneJjbPz40iEB+
ButLsKP/5sOsD27f5K/AnFwpbOCTSEIbMc84nnrTQ4LmTEf1kOwMb9yzk8gUbi6E
kgKtAMpSYNeDgw8PMZAZZVU0oDOmwkssnM/VB6jkhsqxRAnQEAfSaqNTMJxrCCIU
BIZisgwn4+yn7yEhyBOXSI09AJK7MhezO+LWIEiMPMMHt9qvIAYsDBZdGxhJXuXT
k2awB1B4Nu2pB0EMV/Ai/dSJUZzk1Z21YoYJ+ouahGfi+9tZ7WC1+YuUVXqTnarl
HG4iVFw96exM5fvN5lw+wL6pg5u6SzsLem4P4XDPZv2O1l5eE2l5KPwUbpM=
=WlGf
-----END PGP PUBLIC KEY BLOCK-----
',
now()
);


replace into GPG_Key_Pairs (gpg_key_pair_id, user_id, uid, fingerprint, public_key, created)
values
(3, 3, 'jsmith (gwrdifpk) (Jane Smith) <noone@nowhere.de>',
'7BE9E11571860F5D424F229ACC03F787789A0F86',
'-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v2.0.18 (GNU/Linux)

mQENBFI8B2QBCADsHr80yiCa7goraF/H9pfhACgafELPNLftl9zYMV9nxixQc9xD
nojnfXqS9WIsZ/JZGwJJyqbIKBm2YKjx92xrvJdZ9HTjp+IcwlvjWcBoPZXKIb1J
pAy5JNMsQ1Z98oAojwCwaL1qyp/Ioq8dXIR/VTASx5aOdqNswkuo8cWZxac+QZot
X0E8Z4AyGwVeYm0kycLSrif/AGgCX3pEveCEPAxpyn9L3NdlzC1iDfL8hSXmwAvO
jh807/x6xgJb2IcMg3pHj87C7LYOiJxzZ1PtVr+qK324UOxDpPDAlR06jqvtWn9i
dtDBgJgSccwwY6+QVR4nlVh3dEbtHQu+G0dZABEBAAG0MWpzbWl0aCAoZ3dyZGlm
cGspIChKYW5lIFNtaXRoKSA8bm9vbmVAbm93aGVyZS5kZT6JATgEEwECACIFAlI8
B2QCGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEMwD94d4mg+GbegIALOj
jZRR1qQbI1HeIs+Ud1ZZn5MYXev1bGNSOYQhEyP5a69hZ41CK41hWGox7V/ytUvM
mvsVH3jyuIFL7Fdhoa8i9xjNO8xG/pr4bOGgfxVWO8B72LdBVT4NT22GcZqUy/7F
v7jiwZTWjGO/S7xHzQFlipq4z2gFQ/sk383bTqEu8EpmZz6in1i4q/1QG8R2GN6/
4rGiZrZKqQyw9J6udz00+iyvGwvk9CezQjmOpEhNCqgJEfIeptsiFMjkFqWdZqf6
KoxMsOdHzRTiTtviQcbqYHDnmDtsHQemF/2M/Idr5NfGNly5HNC9IRhi5vt8dpo3
ynRnOT0BLqQg7TejPyu5AQ0EUjwHZAEIAJFm0FKptH5/Pa05alwoPZx8ClkoseLB
scmqlETcNJWUoNtN+nxJsszcgrztYZ7eqGvMPsortWoP7H/MyWYHPhJTH32zIHfl
DlkI3ceQWEqg0/t2aF/ORAmvfx6xBO1j19Qq//vGnxnGu6LncZBjMyLn+2k82WWt
HtIcfXYo48cgCm1KQCaTvEMMDJ55fPUWZkB/xMUoEXoUGveKOPagNxjJpKzxyDZP
VYYHh4vvmooptX1cgYza+s2yEwgPLJITZoGJfMTaaz7Sm1FHCrS269OaafSmqU1U
4kg9Hj9ClFgJGITjq/Y1Di6Vj0TD4SPbts85YYgaiiHJ+Mk+ipqin1EAEQEAAYkB
HwQYAQIACQUCUjwHZAIbDAAKCRDMA/eHeJoPhrTzCACpmSCHOPnoGUQLQtB6d+E1
KJa9hqc4acbzT/pEjk4LedM5FM5zOEOMleE/pR+9NKVzzflDAkQab9dFXLTQfZUz
32ecwu8w2qNzgNLSrSfzkWEihse8Bwy80B0A53uoYQcgX7Z4943srNGb46zoGvVX
7v/jv2A6arKMZrBw4vmcqIa+4EXgHsUlh0xTK0Wpeph4jnvFThqNx+wxO8nYEoQD
xsl3Ptaf0BlYbJ5DXUpY7YQAEvYvIpCjeHCNinAarVCzM3Th1/3nYPFM/R8N9zt/
PcKbKYL5FYMz/Qmrl6qx0bBUlJgdkvXDqhc+1DI5/wX1kY/cQJRyFs928XOX6Nzo
=d+Rr
-----END PGP PUBLIC KEY BLOCK-----
',
now()
);

replace into GPG_Key_Pairs (gpg_key_pair_id, user_id, uid, fingerprint, public_key, created)
values
(4, 4, 'abrown (gwrdifpk) (Albert Brown) <noone@nowhere.de>',
'C52A67DA0CD22FB57CC26D1E5E2EA9526191215D',
'-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v2.0.18 (GNU/Linux)

mQENBFI8B4MBCADGUpfpmjX2NUJw02040h20msJ73DRVewHtbydcnmj8pYb10aQe
vKYyqZaigfEqNWDH1jq7YmL78Qn8BuhNiZy0piWwFKE3hcaQeXOgfUmyY2Kjjfng
1gwR95c7B3MnuIU3iUGDsSEXZo7+LLihgS4ThaZeLjClhDGI0M/rDB86ZkcnZ6aR
JPcFykVmTY8b7h2ni3sozSvo3iyjTioEAA2xeZAxD3nmYKzAlZxnf9yDupWPSFv0
C++XIFpXnyOfwci+1pwkMSTk5HDOdOMNTiyg4Hh29ZWisefDaMY+lSy2KnWLSUBW
cWWZrndkR/p2TpGPNoqzRMEDySPyzsYIPf/3ABEBAAG0M2Ficm93biAoZ3dyZGlm
cGspIChBbGJlcnQgQnJvd24pIDxub29uZUBub3doZXJlLmRlPokBOAQTAQIAIgUC
UjwHgwIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQXi6pUmGRIV1c/wf/
cQidpOaxM3S6iI2DhMo1IqGPOSOfyxNSKUef6z5TbBBhS9NVAhczlQ4GglMbuUnq
eT+I7Jbr8wXfek7cAWMgfBHIqhHrsgTmhmN6LK41DVh/PwSXqWrv8Oyk18Z1jtJM
WVv39RYHWdIts5kiIOlBIy1gKiCS0f32RwgDwQBg5mvmMphvocJUHmUtKOFo9ido
5B8mVByLEhAmQNUKDemmmlfpiPwT9yGdLpBd9pLz/1WfDZCku/TMvp40xh19hM7J
xy0erT/Uiv2fdeBGCVPFlyJksCYMwZZljJvehJWMFXwuMMpTKMBBySYk4n1ZR/gn
vfE8eVhDTKXedDYFC/Xt87kBDQRSPAeDAQgAwNQ2c0PvdXesGTYdBo13TJ0tatBT
QAXHftUpz0leUcKhZogmGt6Ft7nQ1O5EALT80letVCypHY4ru2qE/vnt/3Kcie/+
hu9r0HR4+JFao3TPIXa7k6fNzjkDmsFUMmuyDCJ2U11bbEAJA7btTBxPJq9XfFbk
7cuwf/8MHlfidXeWze4K9yDLmsqOao36wM492aemK916tlH/cTzLcaZ7qXXKUb8U
Cxqb6QixAaVKaSTMsqnikoBVv3ikqez4HcR9AWzznx26h+jcXB3EVyALwVmt2sVb
c80SR8F2UfwT9b/0bj3+qgtmIGmsiwiyVy26jOQts7LSlSY+QNAFrqsBMQARAQAB
iQEfBBgBAgAJBQJSPAeDAhsMAAoJEF4uqVJhkSFdUokIAIKmgoZAayjIg2qGL5Tq
z8kiM99FxNXRUa12w6ChXQytaxeV/BLs6zgjVe3dbc85qbt5UVDDCQOTwnenWQVn
evNhYx/NH1te/Aw/rf18O9ooxZ57yEf3BoG2g1u4tHdcocKv8Slf4MMcUxZe7srs
0TFjwVUYMUkTyb3VHpPba7+F+69W1RHS5cfdWugcGYgBpjaMTXe1HRLmO74UeZbX
5iTq5SLeXcWrWD7yjkyetpUunOZTP7aubfk4HA6T5h3aZqkhGvtOFNAZaTJZfxfd
USzlBKvJFKfoMlctZb1Ck4XFHONUxIhqWk6F75mfPRaT7yZidqzv6w+6ky7ebrYu
vJ8=
=dybd
-----END PGP PUBLIC KEY BLOCK-----
',
now()
);





select * from GPG_Key_Pairs where gpg_key_pair_id > 0 order by gpg_key_pair_id\G


(length "41E4286D5DED32B80956D5429CBFF6B2CA0E93A2") 40

/* *** (3) Users_GPG_Key_Pairs  */

create table Users_GPG_Key_Pairs
(
   user_id int not null default 0 references Users(user_id),
   gpg_key_pair_id int unsigned not null default 0 references GPG_Key_Pairs(gpg_key_pair_id)

);

select * from Users_GPG_Key_Pairs;

select U.user_id, U.username, U.Distinguished_Name, G.gpg_key_pair_id, G.gpg_key_id, G.fingerprint
from Users as U, GPG_Key_Pairs as G, Users_GPG_Key_Pairs as UG
where U.user_id = UG.user_id and G.gpg_key_pair_id = UG.gpg_key_pair_id
order by user_id, gpg_key_pair_id\G


grant all on table Users_GPG_Key_Pairs to lfinsto;

insert into Users_GPG_Key_Pairs (user_id, gpg_key_pair_id)
values (1, 1);

select * from Users_GPG_Key_Pairs;

/* *** (3) Table Session_Data  */

drop table Session_Data;

create table Session_Data
(

   session_id varchar(256) not null,
   user_id int not null references Users(user_id),
   effective_user_id int references Users(user_id),
   user_name varchar(128) references Users(user_name),
   effective_user_name varchar(128) references Users(user_name),
   timestamp timestamp default 0

);


grant all on table Session_Data to lfinsto, cboehme1;


update Session_Data set timestamp = timestampadd(hour, -3, now()) where session_id = 'xxx';


select * from Session_Data;

select * from Session_Data\G

show columns from Session_Data;

select session_data_ctr from Session_Data order by session_data_ctr desc limit 1;



/* *** (3) View User_Info  */

drop view User_Info;

show columns from Users;
show columns from Certificates;

drop view User_Info;

create view User_Info as select 
   U.user_id, U.username, 
   C.certificate_id, C.serialNumber, C.commonName, C.organization,
   C.organizationalUnitName,
   P.superuser, P.delegate, P.show_user_info, P.show_groups,
   P.show_certificates, P.show_distinguished_names,
   P.show_privileges,
   G.gpg_key_pair_id, G.fingerprint, G.created as 'GPG key pair created',
   G.last_modified as 'GPG key pair last modified'
from Users as U, Certificates as C, Privileges as P, GPG_Key_Pairs as G
where U.user_id = C.user_id and U.user_id = P.user_id and U.user_id = G.user_id
order by U.user_id, G.gpg_key_pair_id;

select * from User_Info where user_id = 1\G

select * from User_Info order by user_id, certificate_id\G

select * from User_Info order by user_id;

select * from User_Info order by commonName;


/* *** (3) Certificates  */

/* The lengths of the `varchar' and `char' fields is specified by the relevant 
   standards and/or RFCs applying to X.509 certificates.  See 
   `[...]/optinum/Installer/gwirdsif/src/DATABASE/x509guide.txt' for 
   more information.
   LDF 2009.12.23.
*/


drop table Certificates;

create table Certificates
(
   certificate_id int primary key,
   user_id int references Users(user_id),
   issuer_cert_id int references Certificates(certificate_id),

   is_ca boolean not null,    /* Is certification authority */
   is_proxy boolean not null, /* Is proxy certificate  */

   serialNumber bigint unsigned,       /* Fields from here on use names from the X.509 specifications */
                                       /* LDF 2009.12.23.                                             */
   organization varchar(64),
   organizationalUnitName varchar(64),
   commonName varchar(64),           
   countryName char(2),          
   localityName varchar(64),         
   stateOrProvinceName varchar(64),
   Validity_notBefore datetime, 
   Validity_notAfter datetime
);

grant all on table Certificates to lfinsto;

show columns from Certificates;

select * from Certificates\G

/* **** (4) Insert into `Certificates' table */

/* ***** (5) NULL Certificate */

insert into Certificates 
(certificate_id,           
 user_id,
 issuer_cert_id,
 is_ca,              
 is_proxy,              
 serialNumber,             
 organization,             
 organizationalUnitName,   
 commonName,               
 countryName,              
 localityName,             
 stateOrProvinceName,
 Validity_notBefore,
 Validity_notAfter
)      
values
(
0,      /* certificate_id,         */
0,      /* user_id                 */
NULL,   /* issuer_cert_id          */
false,  /* is_ca                   */
false,  /* is_proxy                */
0,      /* serialNumber,           */
NULL,   /* organization            */
NULL,   /* organizationalUnitName  */
NULL,   /* commonName              */              
NULL,   /* countryName             */
NULL,   /* localityName            */              
NULL,   /* stateOrProvinceName     */
NULL,   /* Validity_notBefore      */
NULL   /* Validity_notAfter       */
);

/* ***** (5) gwrdifpk-ca Certificate (CA)  */

insert into Certificates 
(certificate_id,           
 user_id,
 issuer_cert_id,
 is_ca,              
 is_proxy,              
 serialNumber,             
 organization,             
 organizationalUnitName,   
 commonName,               
 countryName,              
 localityName,             
 stateOrProvinceName,
 Validity_notBefore,
 Validity_notAfter
)      
values
(
1,               	 /* certificate_id,         */
0,               	 /* user_id                 */
NULL,            	 /* issuer_cert_id          */
true,            	 /* is_ca                   */
false,           	 /* is_proxy                */
1,               	 /* serialNumber,           */
'GWDG',          	 /* organization            */
'gwrdifpk',        	 /* organizationalUnitName  */
'gwrdifpk-ca',   	 /* commonName              */              
'DE',            	 /* countryName             */
'Goettingen',    	 /* localityName            */              
'Niedersachsen', 	 /* stateOrProvinceName     */
'2013-05-03 12:58:26',   /* Validity_notBefore      */
'2033-04-28 12:58:31  '  /* Validity_notAfter       */
);

/* ***** (5) lfinsto certificate */

delete from Certificates where certificate_id = 2;

insert into Certificates 
(certificate_id,           
 user_id,
 issuer_cert_id,
 is_ca,              
 is_proxy,              
 serialNumber,             
 organization,             
 organizationalUnitName,   
 commonName,               
 countryName,              
 localityName,             
 stateOrProvinceName,
 Validity_notBefore,
 Validity_notAfter
)      
values
(
2,               	 /* certificate_id,         */
1,               	 /* user_id                 */
1,              	 /* issuer_cert_id          */
false,            	 /* is_ca                   */
false,           	 /* is_proxy                */
2,               	 /* serialNumber,           */
'GWDG',          	 /* organization            */
'gwrdifpk',        	 /* organizationalUnitName  */
'Laurence Finston',   	 /* commonName              */              
'DE',            	 /* countryName             */
'Goettingen',    	 /* localityName            */              
'Niedersachsen', 	 /* stateOrProvinceName     */
'2013-05-03 15:02:53',   /* Validity_notBefore      */
'2033-04-28 15:02:56'	 /* Validity_notAfter       */
);

/* ***** (5) jdoe certificate */

delete from Certificates where certificate_id = 3;

insert into Certificates 
(certificate_id,           
 user_id,
 issuer_cert_id,
 is_ca,              
 is_proxy,              
 serialNumber,             
 organization,             
 organizationalUnitName,   
 commonName,               
 countryName,              
 localityName,             
 stateOrProvinceName,
 Validity_notBefore,
 Validity_notAfter
)      
values
(
3,               	 /* certificate_id,         */
2,               	 /* user_id                 */
1,              	 /* issuer_cert_id          */
false,            	 /* is_ca                   */
false,           	 /* is_proxy                */
5,               	 /* serialNumber,           */
'GWDG',          	 /* organization            */
'gwrdifpk',        	 /* organizationalUnitName  */
'John Doe',     	 /* commonName              */              
'DE',            	 /* countryName             */
'Goettingen',    	 /* localityName            */              
'Niedersachsen', 	 /* stateOrProvinceName     */
'2013-05-15 11:06:07',   /* Validity_notBefore      */
'2033-05-10 11:06:36'    /* Validity_notAfter       */
);

/* ***** (5) jsmith certificate */

select user_id, username from Users order by user_id\G

delete from Certificates where certificate_id = 4;

insert into Certificates 
(certificate_id,           
 user_id,
 issuer_cert_id,
 is_ca,              
 is_proxy,              
 serialNumber,             
 organization,             
 organizationalUnitName,   
 commonName,               
 countryName,              
 localityName,             
 stateOrProvinceName,
 Validity_notBefore,
 Validity_notAfter
)      
values
(
4,               	 /* certificate_id,         */
3,               	 /* user_id                 */
1,              	 /* issuer_cert_id          */
false,            	 /* is_ca                   */
false,           	 /* is_proxy                */
6,               	 /* serialNumber,           */
'GWDG',          	 /* organization            */
'gwrdifpk',        	 /* organizationalUnitName  */
'Jane Smith',     	 /* commonName              */              
'DE',            	 /* countryName             */
'Goettingen',    	 /* localityName            */              
'Niedersachsen', 	 /* stateOrProvinceName     */
'2013-05-15 11:08:07',   /* Validity_notBefore      */
'2033-05-10 11:08:10'	 /* Validity_notAfter       */
);




/* ***** (5) */

/* **** (4) */

select * from Certificates order by certificate_id\G

/* *** (3) Privileges  */

show tables;

drop table Privileges;

select * from Users\G

create table Privileges
(
    user_id int primary key unique not null references Users(user_id),
    superuser boolean not null default 0,
    delegate boolean not null default 0,
    add_groups boolean not null default 0,
    delete_groups boolean not null default 0,
    delete_handles boolean not null default 0,
    delete_handle_values boolean not null default 0,
    delete_hs_admin_handle_values boolean not null default 0,
    delete_last_hs_admin_handle_value boolean not null default 0,
    undelete_handle_values boolean not null default 0,
    show_user_info boolean not null default 0,
    show_groups boolean not null default 0,
    show_certificates boolean not null default 0,
    show_distinguished_names boolean not null default 0,
    show_privileges boolean not null default 0,

    pull_request_self boolean not null default 0,
    pull_request_group boolean not null default 0,
    pull_request_all boolean not null default 0


);

use gwirdsif;

alter table Privileges add column show_groups boolean not null default 0;
alter table Privileges add column add_groups boolean not null default 0;
alter table Privileges add column delete_groups boolean not null default 0;

alter table Privileges add column delete_handle_values boolean not null default 0;
alter table Privileges add column delete_hs_admin_handle_values boolean not null default 0;
alter table Privileges add column delete_last_hs_admin_handle_value boolean not null default 0;

alter table Privileges add column pull_request_self boolean not null default 0;
alter table Privileges add column pull_request_group boolean not null default 0;
alter table Privileges add column pull_request_all boolean not null default 0;


alter table Privileges add column delete_handles boolean not null default 0;

show columns from Privileges;

grant all on table Privileges to lfinsto;

/* Laurence Finston (lfinsto)  */

replace into Privileges (user_id, 
                         superuser, 
                         delegate, 
                         add_groups,
                         delete_groups,
                         delete_handles,
                         delete_handle_values,
                         delete_hs_admin_handle_values,
                         delete_last_hs_admin_handle_value,
                         undelete_handle_values,
                         show_user_info,
                         show_groups,
                         show_certificates, 
                         show_distinguished_names, 
                         show_privileges,
                         pull_request_self, 
                         pull_request_group,
                         pull_request_all)
values
(1, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true);

update Privileges set superuser = false, delete_handles = false where user_id = 1;

update Privileges set superuser = true, delete_handles = true where user_id = 1;

select * from Privileges where user_id = 1\G

select * from Privileges where user_id = 3\G

/* John Doe  */

replace into Privileges (user_id, 
                         superuser, 
                         delegate, 
                         add_groups,
                         delete_groups,
                         delete_handles,
                         delete_handle_values,
                         delete_hs_admin_handle_values,
                         delete_last_hs_admin_handle_value,
                         undelete_handle_values,
                         show_user_info,
                         show_groups,
                         show_certificates, 
                         show_distinguished_names, 
                         show_privileges)
values
(2, false, false, false, false, false, false, false, false, false, false, false, false, false, false);


update gwirdsif.Privileges set delete_handle_values = true, delete_hs_admin_handle_values = true where user_id = 2;
update gwirdsif.Privileges set delete_handle_values = true, delete_hs_admin_handle_values = true where user_id = 2;
update gwirdsif.Privileges set delete_last_hs_admin_handle_value = false where user_id = 2;
update gwirdsif.Privileges set undelete_handle_values = true where user_id = 2;
update gwirdsif.Privileges set undelete_handle_values = false where user_id = 2;

select * from Privileges where user_id = 2\G

/* Jane Smith  */

replace into Privileges (user_id, 
                         superuser, 
                         delegate, 
                         add_groups,
                         delete_groups,
                         delete_handles,
                         delete_handle_values,
                         delete_hs_admin_handle_values,
                         delete_last_hs_admin_handle_value,
                         undelete_handle_values,
                         show_user_info,
                         show_groups,
                         show_certificates, 
                         show_distinguished_names, 
                         show_privileges)
values
(3, false, false, false, false, false, false, false, false, false, false, false, false, false, false);

update Privileges set delete_handle_values = true, delete_hs_admin_handle_values = true where user_id = 3;
update Privileges set superuser = true where user_id = 3;
update Privileges set superuser = false where user_id = 3;



select U.username, U.distinguished_name, P.superuser, P.delegate, 
       P.add_groups, P.delete_groups, P.delete_handles,
       P.delete_handle_values,
       P.delete_hs_admin_handle_values,
       P.delete_last_hs_admin_handle_value,
       P.undelete_handle_values,
       P.show_user_info, 
       P.show_groups,
       P.show_certificates, P.show_distinguished_names, P.show_privileges
   from Users as U, Privileges as P where U.user_id = P.user_id order by U.user_id\G



select * from Users where user_id > 0 order by user_id\G



select * from Privileges order by user_id\G
show columns from Privileges;

select * from User_Info as UI, Privileges as P where UI.user_id = P.user_id order by P.user_id\G

select * from User_Info as UI, Privileges as P where UI.user_id = P.user_id and P.user_id = 1\G

select * from User_Info as UI, Privileges as P where UI.user_id = P.user_id and P.user_id = 2\G

select distinct UI.user_id, UI.username, UI.certificate_id, UI.serialNumber, 
UI.commonName, UI.organization, UI.organizationalUnitName, 
P.superuser, P.delegate, P.add_groups, P.delete_groups, P.delete_handles,
P.show_user_info, P.show_groups, P.show_certificates,
P.show_distinguished_names, P.show_privileges
from gwirdsif.User_Info as UI, gwirdsif.Privileges as P where UI.user_id = P.user_id 
and P.user_id = 1\G

update gwirdsif.Privileges set superuser = 1 where user_id = 1;
update gwirdsif.Privileges set superuser = 1, show_privileges = 0 where user_id = 1;
update gwirdsif.Privileges set show_privileges = 1 where user_id = 1;
update gwirdsif.Privileges set show_groups = 1 where user_id = 1 or user_id = 2;
update gwirdsif.Privileges set superuser = 0, show_privileges = 0 where user_id = 1;
update gwirdsif.Privileges set delete_handles = 0 where user_id = 1;
update gwirdsif.Privileges set delete_handles = 1 where user_id = 1;
update gwirdsif.Privileges set delete_handles = 1 where user_id = 2;    /* John Doe  */

update handlesystem_standalone.handles set created_by_user_id = 2 where handle = '12345/00001';



select * from handlesystem_standalone.handles where handle = '12345/00001'\G



update Privileges set superuser = 1, delegate = 0 where user_id = 1;
update Privileges set superuser = 0, delegate = 1 where user_id = 1;
update Privileges set superuser = 0, delegate = 0 where user_id = 1;

update Delegates set delegate = 1 where delegate_id = 4;
update Delegates set delegate = 4 where delegate_id = 1;

update Delegates set effective_user_id = 2 where delegate_id = 1;
update Delegates set effective_user_id = 3 where delegate_id = 1;

select * from Privileges where user_id = 1\G

select * from Delegates;

delete from Privileges;

/* *** (3) Groups */

/* **** (4) Groups table*/

show columns from Users;

select user_id, username from Users\G

drop table Groups;

create table Groups
(
    group_id int primary key unique not null,
    creator_id int not null references Users(user_id),
    name varchar(64) unique not null,
    created datetime
);

grant all on table Groups to lfinsto;

delete from Groups;

insert into Groups (group_id, creator_id, name, created)
values
(0, 0, 'NULL_GROUP', 0);

insert into Groups (group_id, creator_id, name, created)
values
(1, 1, 'test_group_0', now());


insert into Groups (group_id, creator_id, name, created)
values
(2, 1, 'test_group_1', now());


select * from Groups order by group_id;

/* **** (4) Groups_Users table */

drop table Groups_Users;



create table Groups_Users
(
    group_id int not null references Groups(group_id),
    user_id  int not null references Users(user_id),
    add_user_priv boolean not null default 0,
    delete_user_priv  boolean not null default 0,
    delete_group_priv boolean not null default 0,
    pull_request_priv boolean not null default 0
);




alter table gwirdsif.Groups_Users add column pull_request_priv boolean not null default 0;

grant all on table Groups_Users to lfinsto;

select * from Groups_Users order by group_id, user_id;

select * from Groups_Users where user_id = 1 order by group_id;

/* Jane Smith, pull_request_priv for group 1  */

update Groups_Users set pull_request_priv = 1 where group_id = 1 and user_id = 3;  /* enable */
update Groups_Users set pull_request_priv = 0 where group_id = 1 and user_id = 3;  /* disable  */


delete from Groups_Users;

insert into Groups_Users (group_id, user_id, add_user_priv, delete_user_priv, delete_group_priv)
values
(0, 0, 0, 0, 0);

/* Add Laurence Finston to test_group_0 and test_group_1 */

insert into Groups_Users (group_id, user_id, add_user_priv, delete_user_priv, delete_group_priv)
values
(1, 1, 1, 1, 1);

insert into Groups_Users (group_id, user_id, add_user_priv, delete_user_priv, delete_group_priv)
values
(2, 1, 0, 1, 1);

/* Add John Doe to test_group_0  and test_group_1 */

replace into Groups_Users (group_id, user_id, add_user_priv, delete_user_priv, delete_group_priv,
pull_request_priv)
values
(1, 2, 0, 0, 0, 0);

insert into Groups_Users (group_id, user_id, add_user_priv, delete_user_priv, delete_group_priv,
pull_request_priv)
values
(2, 2, 1, 0, 0, 0);

select * from Groups_Users where group_id > 0 and user_id > 0 order by group_id, user_id;

/* Add Jane Smith to test_group_0 with pull_request_priv */

insert into Groups_Users (group_id, user_id, add_user_priv, delete_user_priv, delete_group_priv, 
pull_request_priv)
values
(1, 3, 0, 0, 0, 1);

/* **** (4) View Group_Info */


show columns from Groups;
show columns from Users;
show columns from Group_Info;

select * from Group_Info where group_id = 1 order by user_id\G

select * from Group_Info where pull_request_priv = 1 order by group_id, user_id\G

drop view Group_Info;

create view Group_Info as select 
   GU.group_id, G.name as group_name, 
   GU.user_id, U.username as 'username', 
   GU.add_user_priv, GU.delete_user_priv, GU.delete_group_priv,
   GU.pull_request_priv,
   G.creator_id, UU.username as creator_name, G.created
from Groups as G, Users as U, Groups_Users as GU, Users as UU
where G.group_id = GU.group_id and U.user_id = GU.user_id
and G.creator_id = UU.user_id
order by G.group_id, GU.user_id;

select * from Group_Info order by group_id, user_id\G


select group_id, group_name, user_id, username, add_user_priv,      
delete_user_priv, delete_group_priv, creator_id, creator_name, created from  
gwirdsif.Group_Info where group_id > 0 order by group_id, user_id\G   

select unix_timestamp(created) from Group_Info;

/* ** (2) */

show variables like 'time_zone';

-- set time_zone = '+0:00'; /* Don't use this!  LDF 2013.07.15.  */

select * from handlesystem_standalone.handles where handle like('12345/000__') order by handle\G

select * from handlesystem_standalone.handles where handle = '12345/00001' order by handle\G

update handlesystem_standalone.handles set deleted = 1, last_modified = '2013-07-15 12:37:46' where handle_id = 56;

update handlesystem_standalone.handles set deleted = 0, last_modified = '0000-00-00 00:00:00' where handle_id = 56;

select handle_id, handle, last_modified, unix_timestamp(last_modified) from 
handlesystem_standalone.handles where deleted = 1 and unix_timestamp(last_modified) <> 0 
and unix_timestamp(last_modified) < 1373904750;


/* **** (4) Pull_Requests table */


drop table Pull_Requests;

create table Pull_Requests
(
    pull_request_id int primary key,
    user_id int not null default 0 references Users(user_id),
    server_hostname varchar(128) not null default '',    
    server_ip_address varchar(64) not null default '',
    client_hostname varchar(128) not null default '',    
    client_ip_address varchar(64) not null default '',
    client_port int unsigned not null default 0,
    pull_interval int not null default 0,
    latest_pull datetime not null default 0,
    created datetime not null default 0,
    last_modified datetime not null default 0
);


alter table Pull_Requests modify column pull_interval int not null default 0;


grant all on table Pull_Requests to lfinsto;

show columns from Pull_Requests;

select P.pull_request_id, U.user_id, U.username, U.Distinguished_Name,
U.irods_homedir, U.irods_zone, U.irods_default_resource,
P.client_hostname, P.client_ip_address, P.pull_interval, 
P.latest_pull, P.created, P.last_modified
from Pull_Requests as P, Users as U 
where P.user_id = U.user_id order by pull_request_id\G

select P.pull_request_id, U.user_id, U.username, U.Distinguished_Name,
U.irods_homedir, U.irods_zone, U.irods_default_resource,
P.client_hostname, P.client_ip_address, P.pull_interval, 
P.latest_pull, P.created, P.last_modified
from Pull_Requests as P, Users as U 
where P.pull_request_id > 0
and P.user_id = U.user_id order by pull_request_id\G



insert into Pull_Requests
(pull_request_id, user_id, server_hostname, server_ip_address, client_hostname, client_ip_address, 
client_port, pull_interval, latest_pull, created, last_modified)
values
(0, 0, '', '', '', '', 0, 0, 0, 0, 0);

replace into  Pull_Requests (pull_request_id, user_id, server_hostname, server_ip_address, 
              client_hostname, client_ip_address, client_port,
              pull_interval, latest_pull, created, last_modified) 
              values (1, 1, 'pcfinston.gwdg.de', '134.76.5.25', 'pcfinston.gwdg.de', '134.76.5.25', 
                     5558, 86400, 0, now(), 0);


delete from Pull_Requests where pull_request_id > 0;


update Pull_Requests set latest_pull = now() where pull_request_id = 1;

update Pull_Requests set latest_pull = timestampadd(second, -86500, now()) where pull_request_id = 1;



select * from Pull_Requests where pull_request_id > 0\G


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

