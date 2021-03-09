#! /bin/bash

#### setup_ldlib_path.sh

#### Created by Laurence D. Finston (LDF) Tue Mar 20 15:36:47 CET 2012

#### * (1) Copyright and License.

#### This file is part of gwrdifpk, a package for long-term archiving.  
#### Copyright (C) 2013, 2014 Gesellschaft fuer wissenschaftliche Datenverarbeitung mbH Goettingen  

#### gwrdifpk is free software; you can redistribute it and/or modify 
#### it under the terms of the GNU General Public License as published by 
#### the Free Software Foundation; either version 3 of the License, or 
#### (at your option) any later version.  

#### gwrdifpk is distributed in the hope that it will be useful, 
#### but WITHOUT ANY WARRANTY; without even the implied warranty of 
#### MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
#### GNU General Public License for more details.  

#### You should have received a copy of the GNU General Public License 
#### along with gwrdifpk; if not, write to the Free Software 
#### Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

#### gwrdifpk is available for downloading via Git from 
#### https://github.com/gwdg/gwrdifpk.git.

#### Please send bug reports to Laurence.Finston@gwdg.de

#### The author can be contacted at: 

#### Laurence D. Finston 		   
#### Kreuzbergring 41 	   
#### 37075 Goettingen  	   
#### Germany                                

#### Laurence.Finston@gwdg.de


#### For use on pcfinston.

#### Run in shells (with . or source) before calling optdbsrv or optdbcli_1.
#### This is a temporary measure, until these programs work with 
#### more up-to-date versions of GNUTLS and the various libraries
#### the latter depends on.
####
#### This shellscript should not be called in .bashrc!  If it is, it causes
#### me to be logged out immediately after being logged in.
####
#### LDF 2012.03.20.

#### With '-q' as the first argument, output the values of the environment
#### variables PATH, LD_LIBRARY_PATH and IRODS_SERVER_DIR and exit.
####
#### LDF 2013.11.27.

if test $# -gt 0 -a "$1" = "-q"
then
   echo "PATH:"
   echo "$PATH" | tr ":" "\n"
   echo
   echo "LD_LIBRARY_PATH:"
   echo "$LD_LIBRARY_PATH" | tr ":" "\n"
   echo
   echo "IRODS_SERVER_DIR:"
   echo "$IRODS_SERVER_DIR" | tr ":" "\n"
   exit 0
fi
LDF_PATH="/home/lfinsto/gcc-4.8.2/bin:"
LDF_PATH+="/home/lfinsto/autoconf-2.69-install/bin:"
LDF_PATH+="/home/lfinsto/automake-1.14-install/bin:"
LDF_PATH+="/home/lfinsto/texinfo-install/bin:"
LDF_PATH+="$PATH"

export PATH="$LDF_PATH"

LDF_LD_LIBRARY_PATH="/home/lfinsto/glibc-install/lib64:"
LDF_LD_LIBRARY_PATH+="/home/lfinsto/gcc-4.8.2/lib64:"
LDF_LD_LIBRARY_PATH+="/home/lfinsto/irods_proj/irods_master/Finston/gwrdifpk/src/.libs:"
LDF_LD_LIBRARY_PATH+="/home/lfinsto/gpgme-1.4.3-install/lib64:"
LDF_LD_LIBRARY_PATH+="/usr/lib64:/usr/lib:/home/old-system/usr/lib64:"
LDF_LD_LIBRARY_PATH+="/home/old-system/usr/lib:"
LDF_LD_LIBRARY_PATH+="/home/lfinsto/libgcrypt-1.4.6/lib:"
LDF_LD_LIBRARY_PATH+="$LD_LIBRARY_PATH"

export LD_LIBRARY_PATH="$LDF_LD_LIBRARY_PATH"

export IRODS_SERVER_DIR=$HOME/iRODS

if test $# -gt 0
then
   echo "PATH              == $PATH"
   echo "LD_LIBRARY_PATH   == $LD_LIBRARY_PATH" 
   echo "IRODS_SERVER_DIR  == $IRODS_SERVER_DIR"
else
   echo "Set PATH, LD_LIBRARY_PATH and IRODS_SERVER_DIR"
fi

#### Don't exit!  This shellscript must be called with 'source' or '.',
#### otherwise it has no effect.
#### LDF 2013.09.13.
