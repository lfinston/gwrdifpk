#### Makefile.am
#### [...]/gwrdifpk/doc/Makefile.am

#### Created by Laurence D. Finston (LDF) Wed Mar 13 13:09:25 CET 2013

#### * (1) Top

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

#### * (1)

#### Automatic Variables.  For more, see Section 10.5.3, "Automatic Variables"
#### of the Make info manual.
#### LDF 2009.12.29.

#### $@:  Target
#### $<:  First prerequisite
#### $^:  The names of all the prerequisites, with spaces between them.

SOURCES_MANUAL := auxprogs.texi concidx.texi dblncrtp.texi dttypidx.texi elispfls.texi funcidx.texi \
                  getstart.texi glblvrcn.texi gpgkprtp.texi gpl.texi grouptp.texi \
                  gwrdcldb.texi gwrdifpk.texi gwrdsfdb.texi gwrdwbap.texi \
                  hndlsdb.texi hndltyps.texi install.texi intro.texi invoking.texi irdstyps.texi \
                  misctyps.texi nnclsfnc.texi \
                  proftest.texi pullarch.texi pullrqtp.texi pullrstp.texi rspnstp.texi \
                  sahdlsrv.texi scprpmtp.texi scrtcnsd.texi slscutil.texi \
                  usingcli.texi usingsif.texi usrcmdcl.texi usrcmnds.texi usrgrpmn.texi usrinftp.texi \
                  x509cert.texi varidx.texi


EXTRA_DIST = $(SOURCES_MANUAL) 00INFO .gitignore gwrdifpk.dvi gwrdifpk.ps gwrdifpk.pdf \
             texinfo.tex Makefile_1 fdl.texi fdl.txt

all: gwrdifpk.dvi gwrdifpk.ps gwrdifpk.pdf gwrdifpk.info gwrdifpk.html html-split

.PHONY: dvn

dvn: dvi info

#### *** (3) DVI, PS and PDF Output

.PHONY: dvi

dvi: gwrdifpk.dvi

.PHONY: ps

ps: gwrdifpk.ps

.PHONY: pdf

pdf: gwrdifpk.pdf

gwrdifpk.pdf: gwrdifpk.ps
	ps2pdf $< $@ 

gwrdifpk.ps: gwrdifpk.dvi
	dvips -o $@ $<

gwrdifpk.dvi: $(SOURCES_MANUAL)
	texi2dvi gwrdifpk.texi

#### *** (3) Info output

.PHONY: info

info: gwrdifpk.info

gwrdifpk.info: $(SOURCES_MANUAL)
	makeinfo --force gwrdifpk.texi

#### *** (3) HTML Output, no split 

.PHONY: html

html: gwrdifpk.html

gwrdifpk.html: $(SOURCES_MANUAL)
	makeinfo --html --no-split --force gwrdifpk.texi

#### *** (3) Split HTML Output 

.PHONY : html-split

html-split: $(SOURCES_MANUAL)
	makeinfo --html --force gwrdifpk.texi

#### ** (2) Tags

.PHONY: tags

tags: TAGS

TAGS: $(SOURCES_MANUAL)
	etags $(SOURCES_MANUAL)

#### ** (2) Purge and Clean

PURGE_FILES := gwrdifpk.aux gwrdifpk.cp gwrdifpk.dvi gwrdifpk.fn gwrdifpk.html gwrdifpk.info \
               gwrdifpk.ky gwrdifpk.log gwrdifpk.pdf gwrdifpk.pg gwrdifpk.ps gwrdifpk.toc \
               gwrdifpk.tp gwrdifpk.vr 

.PHONY: purge


purge: 
	rm $(PURGE_FILES)

CLEANFILES := $(PURGE_FILES)

clean-local:
	-rm -rf gwrdifpk

#### ** (2) End of `[...]/gwrdifpk/doc/Makefile.am'

#### * (1) Local variables for Emacs

#### Local Variables:
#### mode:Makefile
#### abbrev-mode:t
#### eval:(read-abbrev-file)
#### eval:(outline-minor-mode t)
#### outline-regexp:"#### [*\\f]+[ \\t]+([0-9]+)"
#### End:
