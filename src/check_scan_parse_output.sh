#! /bin/bash

#### check_scan_parse_output.sh
#### [...]/Finston/gwrdifpk/src/check_scan_parse_output.sh

#### Created by Laurence D. Finston (LDF) Sun May 19 16:48:34 CEST 2013

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
#### Gesellschaft fuer wissenschaftliche Datenverarbeitung mbH Goettingen 
#### Am Fassberg 11 	   
#### 37077 Goettingen  	   
#### Germany                                

#### Laurence.Finston@gwdg.de


#echo "Arg 1 == $1"
#echo "Arg 2 == $2"

if test -e "$2"
then
   echo "$2 exists"
   diff --brief --ignore-all-space --ignore-blank-lines \
        --ignore-matching-lines='^[[:space:]]*\(#line\|/\*\)' $1 $2 
   r=$?
   if test $r -eq 1
   then
      echo "$2 has changed."
      mv $1 $2
   else
      echo "$2 is unchanged."
   fi
else
   echo "$2 does not exist"
   mv $1 $2
fi 

exit 0
