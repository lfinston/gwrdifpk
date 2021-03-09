#! /bin/bash

#### set_irods_user.sh
#### [...]/Finston/gwrdifpk/src/set_irods_user.sh

#### Created by Laurence D. Finston (LDF) Thu Jun  6 10:19:17 CEST 2013

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

#### This shellscript sets the iRODS user.  
#### It depends on certain conventions applying to user configuration
#### files for iRODS.
####
#### LDF 2013.06.06.

#### Usage:  No argument:  Sets iRODS user to $USER
####
####         Argument '1' (i.e., the numeral one --- need not be quoted!):  
####              Sets iRODS user to 'rods' (the default name for the iRODS admin)
####
####         Any other argument:  Sets iRODS user to the argument, e.g., 
####              'jdoe', 'jsmith', etc.  Quotes normally not needed, 
####              unless the username contains characters with a special
####              meaning for the shell.
####
#### LDF 2013.06.06.

if test $# -eq 0
then
   IRODS_USER=$USER
elif test "$1" = "1"
then
   IRODS_USER=rods
else 
   IRODS_USER="$1"
fi


echo "cp $HOME/.irods/.irodsEnv.$IRODS_USER $HOME/.irods/.irodsEnv"
cp $HOME/.irods/.irodsEnv.$IRODS_USER $HOME/.irods/.irodsEnv

r=$?

if test $r -eq 0
then
   echo "Set iRODS user to $IRODS_USER"
else
   echo "ERROR!  Failed to set iRODS user to $IRODS_USER"
   echo "Exiting \`set_irods_user.sh' unsuccessfully with exit status 1"
   exit 1
fi

exit 0




