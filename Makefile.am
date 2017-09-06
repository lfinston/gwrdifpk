#### Makefile.am
#### Top-level Makefile.am

#### Created by Laurence D. Finston (LDF) Tue Jun 26 10:26:32 CEST 2012

#### Copyright (C) 2012, 2013 Gesellschaft fuer wissenschaftliche Datenverarbeitung mbH

#### * (1) Copyright and License.

#### This file is part of gwrdifpk, a package for long-term archiving.  
#### Copyright (C) 2012, 2013 Gesellschaft fuer wissenschaftliche Datenverarbeitung mbH Goettingen  

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

#### * (1) Top

ACLOCAL_AMFLAGS = -I m4

#### ** (2) bin_PROGRAMS 

bin_PROGRAMS = gwrdifpk$(EXEEXT) 

gwrdifpk_SOURCES = gwrdifpk.c


#### ** (2) Variables for subdirectories.
#### 
#### LDF 2008.06.23.

CRYPTODIR = crypto
DATABASEDIR = database
HANDLESDIR = handles
SOURCEDIR = src
DOCDIR = doc
ELISPDIR = elisp
GPG_KEYS_DIR = gpg_keys
GPGME_TEST_DIR = gpgme_test


export CRYPTODIR
export HANDLESDIR
export DATABASEDIR
export SOURCEDIR
export DOCDIR
export ELISPDIR
export GPG_KEYS_DIR
export GPGME_TEST_DIR

SUBDIRS = $(CRYPTODIR) $(DATABASEDIR) $(HANDLESDIR) $(SOURCEDIR) $(ELISPDIR) $(GPG_KEYS_DIR) \
          $(GPGME_TEST_DIR) $(DOCDIR)

export abs_top_builddir

#### ** (2)

#### *** (3) EXTRA_DIST 
####        (additional files to be included in the distribution)

EXTRA_DIST = .gitignore pcfinston_master_config.sh rebuild.sh

#### ** (2) Rules

#### *** (3) clean-local

# clean-local:
# 	@rm -f rplcvars.c++ rplcvars.l++ rplcvars.tex rplcvars.dvi \
#                rplcvars.ps rplcvars.pdf \
#                rplcvars.idx rplcvars.log rplcvars.scn rplcvars.toc

# all-local: rplcvars.tex rplcvars.dvi rplcvars.ps rplcvars.pdf 

# mostlyclean-local: 
# 	@rm -f rplcvars.c++ rplcvars.l++ \
#                rplcvars.idx rplcvars.log rplcvars.scn rplcvars.toc

#### *** (3) 'run' targets

.PHONY: run-i

run-i:
	$(MAKE) run-i -C $(SOURCEDIR)

.PHONY: run-c

run-c:
	$(MAKE) run-c -C $(SOURCEDIR)

#### *** (3) query

.PHONY: query

query: 
	@echo "CXXCOMPILE == $(CXXCOMPILE)"
	@echo "CXXLINK == $(CXXLINK)"
	$(MAKE) query -C $(SOURCEDIR)
	$(MAKE) query -C $(GPGME_TEST_DIR)
#	echo "BUFFER_SIZE == $(BUFFER_SIZE)"
#	$(MAKE) query -C $(SOURCEDIR)
#	@echo "abs_top_builddir == $(abs_top_builddir)"
#	@echo "abs_builddir == $(abs_builddir)"
# 	@echo "FC == $(FC)"
# 	@echo "F77 == $(F77)"
# 	@echo "CC == $(CC)"
# 	@echo "QUALI_SEND_TO_ADDRESS == $(QUALI_SEND_TO_ADDRESS)"
# 	@echo "QUALI_SEND_TO_ADDRESS == @QUALI_SEND_TO_ADDRESS@"
# 	@echo "POSTGRESQL_FLAGS == $(POSTGRESQL_FLAGS)"
# 	@echo "POSTGRESQL_FLAGS == @POSTGRESQL_FLAGS@"
# 	@echo "CTANGLE == $(CTANGLE)"
# 	@echo "CWEAVE == $(CWEAVE)"
# 	@echo "cweave == "`type cweave`
# 	$(MAKE) query -C $(WEBSERVERDIR)
#	$(MAKE) query -C $(USERADMINDIR)


#### *** (3)

#### ** (2) End of top-level `Makefile.am'

#### * (1) Local variables for Emacs

#### Local Variables:
#### mode:Makefile
#### abbrev-mode:t
#### eval:(read-abbrev-file)
#### eval:(outline-minor-mode t)
#### outline-regexp:"#### [*\\f]+[ \\t]+([0-9]+)"
#### End:
