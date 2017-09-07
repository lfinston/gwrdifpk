#### Makefile.am
#### [...]/gwrdifpk/elisp/Makefile.am

#### Created by Laurence D. Finston (LDF) Wed Sep 18 15:59:13 CEST 2013

#### * (1) Top

#### * (1) Copyright and License.

#### This file is part of gwrdifpk, a package for long-term archiving.  
#### Copyright (C) 2013, 2014, 2015, 2016, 2017 Gesellschaft fuer wissenschaftliche Datenverarbeitung mbH Goettingen  

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

#### * (1)

#### Automatic Variables.  For more, see Section 10.5.3, "Automatic Variables"
#### of the Make info manual.
#### LDF 2009.12.29.

#### $@:  Target
#### $<:  First prerequisite
#### $^:  The names of all the prerequisites, with spaces between them.

ELISP_FILES = autoloads_cweb.el cweb_functions.el cweb-mode.el \
             cweb-tex-keymap.el tex-functions.el

EXTRA_DIST = Makefile.am $(ELISP_FILES)

#### ** (2) Tags

.PHONY: tags

tags: TAGS

TAGS: $(ELISP_FILES)
	etags $^





#### ** (2) End of `[...]/gwrdifpk/elisp/Makefile.am'

#### * (1) Local variables for Emacs

#### Local Variables:
#### mode:Makefile
#### abbrev-mode:t
#### eval:(read-abbrev-file)
#### eval:(outline-minor-mode t)
#### outline-regexp:"#### [*\\f]+[ \\t]+([0-9]+)"
#### End:
