#### Makefile.am
#### [...]/gwrdifpk/src/Makefile.am

#### Created by Laurence D. Finston (LDF) Tue Jun 26 10:31:25 CEST 2012

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

#### * (1)

#### ** (2)

#### Automatic Variables.  For more, see Section 10.5.3, "Automatic Variables"
#### of the Make info manual.
#### LDF 2009.12.29.

#### $@:  Target
#### $<:  First prerequisite
#### $^:  The names of all the prerequisites, with spaces between them.
#### $*:  The stem with which an implicit rule matches

#### ** (2)

bin_PROGRAMS = contact$(EXEEXT) genpids$(EXEEXT) gentans$(EXEEXT) \
               gwirdcli$(EXEEXT) gwirdpcl$(EXEEXT) gwirdsif$(EXEEXT) gwrdwbap$(EXEEXT) \
               prbsnflx$(EXEEXT) optpsgen$(EXEEXT) setupdbs$(EXEEXT) \
               sig_test$(EXEEXT)

setupdbs_SOURCES = setupdbs.web glblvrbl.web stparobj.web stpclopt.web \
                   stpcdsif.web stpcdcli.web stpcdhdl.web stpcrdbs.web stpdblcr.web

nodist_setupdbs_c_files = $(setupdbs_SOURCES:.web=.c)
nodist_setupdbs_cpp_files = $(setupdbs_SOURCES:.web=.c++)
setupdbs_object_files = $(setupdbs_SOURCES:.web=.o) otptfnc1.o

contact_SOURCES = contact.cxx

gwrdifpk_CWEB_files = ckietype.web clntactn.web cmdlnopt.web \
                      dcmdsbtp.web dcmtdttp.web dstngnmt.web \
                      ex_rfc2818.web excptntp.web \
                      glblcnst.web gntlsfnc.web gpgkprtp.web grouptp.web \
                      helper.web hndltype.web hndlvltp.web \
                      irdsavtp.web irdsobtp.web \
                      pidfncs.web prsrfncs.web \
                      pullpttp.web pullrqtp.web pullrstp.web \
                      purgarch.web purgdcmd.web purgdtbs.web purgfncs.web \
                      rspercds.web rspnstp.web \
                      scprpmtp.web spptfnc1.web spptfnc2.web srvractn.web \
                      tanfncs.web usrinftp.web utilfncs.web x509cert.web


nodist_gwrdifpk_c_files = $(gwrdifpk_CWEB_files:.web=.c)
nodist_gwrdifpk_cpp_files = $(gwrdifpk_CWEB_files:.web=.c++)
nodist_gwrdifpk_h_files = $(gwrdifpk_CWEB_files:.web=.h) 
nodist_gwrdifpk_hpp_files = $(gwrdifpk_CWEB_files:.web=.h++) 
gwrdifpk_lo_files = $(gwrdifpk_CWEB_files:.web=.lo)

#### Server library gwrdsrlb (libgwrdsrlb.la)

gwrdsrlb_CWEB_files = connect.web exchncli.web exchnsrv.web \
                      listnlcl.web lstnrmta.web lstnrmtx.web \
                      parser.web pullrqst.web \
                      scanner.web sgnlhndl.web 

nodist_gwrdsrlb_c_files = $(gwrdsrlb_CWEB_files:.web=.c)
nodist_gwrdsrlb_cpp_files = $(gwrdsrlb_CWEB_files:.web=.c++)
nodist_gwrdsrlb_h_files = $(gwrdsrlb_CWEB_files:.web=.h)
nodist_gwrdsrlb_hpp_files = $(gwrdsrlb_CWEB_files:.web=.h++)
gwrdsrlb_lo_files = $(gwrdsrlb_CWEB_files:.web=.lo)

#### Client library gwrdcllb (libgwrdcllb.la)

gwrdcllb_CWEB_files = clntfncs.web exchnsrv.web prsrclnt.web prsrcln2.web \
                      pullpttp.web pullrstp.web scnrclnt.web scnrcln2.web 

nodist_gwrdcllb_c_files = $(gwrdcllb_CWEB_files:.web=.c)
nodist_gwrdcllb_cpp_files = $(gwrdcllb_CWEB_files:.web=.c++)
nodist_gwrdcllb_h_files = $(gwrdcllb_CWEB_files:.web=.h)
nodist_gwrdcllb_hpp_files = $(gwrdcllb_CWEB_files:.web=.h++)
gwrdcllb_lo_files = $(gwrdcllb_CWEB_files:.web=.lo)


####

setupdbs_LDADD = libgwrdifpk.la
genpids_LDADD  = libgwrdifpk.la
gwirdsif_LDADD = libgwrdifpk.la libgwrdsrlb.la
gwirdcli_LDADD = libgwrdifpk.la libgwrdcllb.la
gwirdpcl_LDADD = libgwrdifpk.la libgwrdcllb.la
gwrdwbap_LDADD = libgwrdifpk.la libgwrdcllb.la

lib_LTLIBRARIES = libgwrdifpk.la libgwrdsrlb.la libgwrdcllb.la

nodist_libgwrdifpk_la_SOURCES = $(gwrdifpk_cpp_files)
nodist_libgwrdsrlb_la_SOURCES = $(gwrdsrlb_cpp_files)
nodist_libgwrdcllb_la_SOURCES = $(gwrdcllb_cpp_files)

gentans_SOURCES = gentans.web glblcnst.web glblvrbl.web excptntp.web gpgkprtp.web \
                  tanfncs.web utilfncs.web 

genpids_SOURCES = genpids.web glblvrbl.web gpcmlopt.web
                  
gwirdsif_SOURCES = gwirdsif.web glblvrbl.web ex_rfc2818.web

gwirdcli_SOURCES = gwirdcli.web glblvrbl.web ex_rfc2818.web

# parser.web scanner.web exchncli.web connect.web

#### Pull client 'gwirdpcl'

gwirdpcl_SOURCES = gwirdpcl.web glblvrbl.web plclfunc.web pullrspn.web 

gwrdwbap_SOURCES = gwrdwbap.web glblcnst.web glblvrbl.web utlwbfcs.web ex_rfc2818.web


nodist_prbsnflx_SOURCES   = prbsnflx.l++
nodist_prbsnflx_cpp_files = $(prbsnflx_SOURCES:.l++=.c++) 
nodist_prbsnflx_c_files   = $(prbsnflx_SOURCES:.l++=.c) 

sig_test_SOURCES   = sig_test.c++
sig_test_obj_files = $(sig_test_SOURCES:.c++=.o) 

nodist_gentans_cpp_files = $(gentans_SOURCES:.web=.c++) 
nodist_gentans_c_files   = $(gentans_SOURCES:.web=.c) 

nodist_genpids_cpp_files = $(genpids_SOURCES:.web=.c++) 
nodist_genpids_c_files   = $(genpids_SOURCES:.web=.c) 
genpids_obj_files = $(genpids_SOURCES:.web=.o) otptfnc1.o

nodist_gwirdcli_cpp_files = $(gwirdcli_SOURCES:.web=.c++) 
nodist_gwirdcli_c_files   = $(gwirdcli_SOURCES:.web=.c) 
gwirdcli_obj_files = $(gwirdcli_SOURCES:.web=.o) otptfnc1.o

nodist_gwirdpcl_cpp_files = $(gwirdpcl_SOURCES:.web=.c++) 
nodist_gwirdpcl_c_files   = $(gwirdpcl_SOURCES:.web=.c) 
gwirdpcl_obj_files = $(gwirdpcl_SOURCES:.web=.o) otptfnc1.o

nodist_gwirdsif_cpp_files = $(gwirdsif_SOURCES:.web=.c++) 
nodist_gwirdsif_c_files = $(gwirdsif_SOURCES:.web=.c) 
gwirdsif_obj_files = $(gwirdsif_SOURCES:.web=.o) otptfnc1.o

nodist_gwrdwbap_cpp_files = $(gwrdwbap_SOURCES:.web=.c++) 
nodist_gwrdwbap_c_files = $(gwrdwbap_SOURCES:.web=.c) 
gwrdwbap_obj_files = $(gwrdwbap_SOURCES:.web=.o) otptfnc0.o

optpsgen_SOURCES = optpsgen.web optpsgsb.web
nodist_optpsgen_cpp_files = $(optpsgen_SOURCES:.web=.c++) 
nodist_optpsgen_c_files = $(optpsgen_SOURCES:.web=.c) 
optpsgen_object_files = $(optpsgen_SOURCES:.web=.o) 

#### Putting the PDF files into 'BUILT_SOURCES' ensures that they are 
#### built by 'make all'.
####
#### LDF 2013.09.18.

#### Commented-out.  For testing purposes it is very annoying to have them rebuild
#### constantly.
####
#### LDF 2013.11.20.

#BUILT_SOURCES = gwrdifpk.pdf  gwrdwbcw.pdf  optpsgwv.pdf  scnprswv.pdf  stpdbcwv.pdf

EXTRA_DIST = $(gwrdifpk_CWEB_files) $(gwrdsrlb_CWEB_files) $(gwrdcllb_CWEB_files) \
             00INFO 00TODO admin_data.bin certtool_gen_proxy.sh \
             chckmtdt.sh check_scan_parse_output.sh \
             connect.web cpyrtasc.txt cpyrtcpp.txt cpyrtc.txt cpyrtel.txt cpyrtss.txt cpyrttex.txt \
             cpyrtweb.txt cpyrt3DLcpp.txt cwebmac.tex \
             delete_temp_files.sh dummy.txt get_exp.sh gen_x509_cert_key_pair.sh get_exp.sh \
             get_handles.sh get_handles.txt get_metadata_abc_txt.txt .gitignore \
             gpg_key_id.txt gw_imeta.sh gw_irm.sh \
             gwrdcw01.web gwrdcw02.web gwrdifpk.web gwrdifpk.dvi gwrdifpk.ps gwrdifpk.pdf \
             gwrdwbcw.web gwrdwbcw.dvi gwrdwbcw.ps gwrdwbcw.pdf \
             stpdbcwv.web stpdbcwv.dvi stpdbcwv.ps stpdbcwv.pdf \
             kill_gwirdsif.sh kill_gwrdwbap.fcgi.sh kill_sig_test.sh metadata_sample_1.xml \
             mysql_password.gpg.asc \
             optpsgwv.web optpsgwv.dvi optpsgwv.ps optpsgwv.pdf \
             otptfnc0.c++ otptfnc1.c++ output_passphrase.sh \
             parser.output parser.web prbsnflx.l++ prsrclnt.output prsrclnt.web \
             prsrcln2.output prsrcln2.web put_abc_txt.txt \
             rm_abc_txt.txt \
             scanner.web scnrclnt.web scnrcln2.web scnprswv.web \
             setup_ldlib_path.sh setup_logs.sh \
             show_db_tables.sh show_gwirdsif_db.sh show_irods_avus.sh \
             start_gwirdsif_with_passphrase.sh test_input.txt touch_scan_parse_files.sh \
             update_irods_passwd.sh

PURGE_FILES = cweave_test.idx cweave_test.log cweave_test.scn cweave_test.tex cweave_test.toc \
              gwrdifpk.pdf  gwrdwbcw.pdf  scnprswv.pdf  stpdbcwv.pdf \
              gwrdifpk.ps  gwrdwbcw.ps  scnprswv.ps  stpdbcwv.ps \
              gwrdwbcw.dvi  scnprswv.dvi \
              gwrdifpk.dvi gwrdifpk.idx gwrdifpk.log gwrdifpk.scn gwrdifpk.tex gwrdifpk.toc \
              stpdbcwv.dvi stpdbcwv.idx stpdbcwv.log stpdbcwv.scn stpdbcwv.tex stpdbcwv.toc \
              optpsgwv.dvi optpsgwv.idx optpsgwv.log optpsgwv.pdf optpsgwv.ps \
              optpsgwv.scn optpsgwv.tex optpsgwv.toc *.gcda *.gcov \
              texput.dvi texput.log ttemp.dvi ttemp.log ttemp.out

CLEANFILES = $(PURGE_FILES) gwrdifpk.pdf gwrdifpk.ps $(prbsnflx_cpp_files) $(prbsnflx_c_files) \
             stpdbcwv.pdf stpdbcwv.ps \
             $(gwirdcli_cpp_files) $(gwirdcli_c_files) \
             $(gwirdcli_hpp_files) $(gwirdcli_h_files) \
             $(gwirdpcl_cpp_files) $(gwirdpcl_c_files) \
             $(gwirdpcl_hpp_files) $(gwirdpcl_h_files) \
             $(gwirdsif_cpp_files) $(gwirdsif_c_files) \
             $(gwirdsif_hpp_files) $(gwirdsif_h_files) \
             $(gwrdifpk_cpp_files) $(gwrdifpk_c_files) $(gwrdifpk_hpp_files) $(gwrdifpk_h_files) \
             $(gwrdwbap_cpp_files) $(gwrdwbap_c_files) \
             $(gwrdwbap_hpp_files) $(gwrdwbap_h_files) utlwbfcs.h++ \
             $(gwrdsrlb_h_files) $(gwrdsrlb_hpp_files) \
             $(gwrdcllb_h_files) $(gwrdcllb_hpp_files) \
             $(genpids_cpp_files) $(genpids_c_files) \
             $(genpids_hpp_files) $(genpids_h_files) \
             $(gentans_cpp_files) $(gentans_c_files) \
             $(gentans_hpp_files) $(gentans_h_files) \
             genpids.h genpids.h++ gentans.h gentans.h++ \
             glblvrbl.h glblvrbl.h++ gwirdcli.h gwirdcli.h++ gwirdpcl.h gwirdpcl.h++ \
             gwirdsif.h gwirdsif.h++ \
             gwrdwbap.h gwrdwbap.h++ optpsgen.h optpsgen.h++ optpsgsb.h optpsgsb.h++ \
             gwrdwbap.idx gwrdwbap.idx gwrdwbap.log gwrdwbap.scn gwrdwbap.tex \
             gwrdwbap.toc \
             $(optpsgen_c_files) $(optpsgen_cpp_files) $(optpsgen_object_files) *.gcno *.o *.lo

AM_CXXFLAGS = # -pg -fprofile-arcs -ftest-coverage

#### ** (2) Rules

#### *** (3) contact

contact.o: contact.cxx $(gwrdifpk_hpp_files) utlwbfcs.h++
	$(CXXCOMPILE) -c -o $@ $<

contact$(EXEEXT): contact.o 
	@echo "Linking \`contact$(EXEEXT)'"
	$(CXXLINK) $< 

#### *** (3)

libgwrdifpk.la: $(gwrdifpk_hpp_files) $(gwrdifpk_lo_files) 
	$(CXXLINK) -rpath $(libdir) $(gwrdifpk_lo_files) $(LIBS)

libgwrdcllb.la: $(gwrdcllb_hpp_files) $(gwrdcllb_lo_files) 
	$(CXXLINK) -rpath $(libdir) $(gwrdcllb_lo_files) $(LIBS)

libgwrdsrlb.la: $(gwrdsrlb_hpp_files) $(gwrdsrlb_lo_files) 
	$(CXXLINK) -rpath $(libdir) $(gwrdsrlb_lo_files) $(LIBS) 

#### *** (3) Link gwirdsif

#### LDF 2013.01.22.
#### Currently not linking with 'libRodsAPIs.a'.
#### Put back if needed:
####
#### In target:  $(HOME)/iRODS/lib/core/obj/libRodsAPIs.a
#### 
#### In action:  (CXXLINK) $^ $(HOME)/iRODS/lib/core/obj/libRodsAPIs.a $(LIBS)

gwirdsif$(EXEEXT): $(gwrdifpk_hpp_files) $(gwirdsif_obj_files) $(gwirdsif_LDADD) 
	@echo "Linking \`gwirdsif$(EXEEXT)'"
	/bin/sh ../libtool --tag=CXX   --mode=link g++ \
           $(LDFLAGS) \
           -o $@ -rpath $(bindir) $(gwirdsif_obj_files) $(gwirdsif_LDADD) $(LIBS)


#### *** (3) Link gwirdcli

#### LDF 2013.01.22.
#### Currently not linking with 'libRodsAPIs.a'.
#### Put back if needed:
####
# In target: $(HOME)/iRODS/clients/icommands/../../lib/core/obj/libRodsAPIs.a

gwirdcli$(EXEEXT): $(gwrdifpk_hpp_files) $(gwirdcli_obj_files) $(gwirdcli_LDADD) 
	@echo "Linking \`gwirdcli$(EXEEXT)'"
	/bin/sh ../libtool --tag=CXX   --mode=link g++ \
           $(LDFLAGS) \
           -o $@ -rpath $(bindir) $(gwirdcli_obj_files) $(gwirdcli_LDADD) $(LIBS)


#### *** (3) Link gwirdpcl

#### LDF 2013.01.22.
#### Currently not linking with 'libRodsAPIs.a'.
#### Put back if needed:
####
# In target: $(HOME)/iRODS/clients/icommands/../../lib/core/obj/libRodsAPIs.a

gwirdpcl$(EXEEXT): $(gwrdifpk_hpp_files) $(gwirdpcl_obj_files) $(gwirdpcl_LDADD) # libgwrdcllb.la
	@echo "Linking \`gwirdpcl$(EXEEXT)'"
	/bin/sh ../libtool --tag=CXX   --mode=link g++ \
           $(LDFLAGS) \
           -o $@ -rpath $(bindir) $(gwirdpcl_obj_files) $(gwirdpcl_LDADD) $(LIBS)


#### *** (3) Link gwrdwbap

#### LDF 2013.01.22.
#### Currently not linking with 'libRodsAPIs.a'.
#### Put back if needed:
####
#### In target:  $(HOME)/iRODS/lib/core/obj/libRodsAPIs.a
#### 
#### In action:  (CXXLINK) $^ $(HOME)/iRODS/lib/core/obj/libRodsAPIs.a $(LIBS)

gwrdwbap$(EXEEXT): $(gwrdifpk_hpp_files) $(gwrdwbap_obj_files) $(gwrdwbap_LDADD) 
	@echo "Linking \`gwrdwbap$(EXEEXT)'"
	/bin/sh ../libtool --tag=CXX   --mode=link g++ \
           $(LDFLAGS) \
           -o $@ -rpath $(bindir) $(gwrdwbap_obj_files) $(gwrdwbap_LDADD) $(LIBS) -lfcgi -lcurl

#### LDF 2013.05.30.  
#### This rule may be needed if compilation fails because header files
#### are not generated.

.PHONY: headers

headers: $(gwrdifpk_hpp_files) utlwbfcs.h++

#### The following implicit (pattern) rule generates C++ source code and header files 
#### from the '.web' files.
#### This rule calls 'ctangle' and then compares the resulting '.c' and '.h' files
#### with the existing '.c++' and '.h++' files (if present).  Changes only
#### affecting whitespace, comments, and or "#line" directives are ignored.
#### If the '.c' file is otherwise identical to the '.c++' file, nothing further is
#### done with it and the '.c++' file remains unchanged.  
#### The same applies to the '.h' and '.h++' file.  
#### In addition, if the '.c' file has changed, the '.o' files is "touched" to 
#### update its timestamp, so that the '.web' file won't be tested again unless
#### it is changed.  However, it does seem that some unnecessary testing is performed.
####
#### If, however, a change is recognized, the '.c' file is renamed to '.c++'
#### and the '.h' file is renamed to '.h++'.
####
#### Please note that this "algorithm" has the unfortunate consequence
#### that changes to whitespace within strings are also ignored.  In this case, 
#### the corresponding '.o' file must be deleted or
#### some other change must be made to the '.web' file in order to force recompilation.
####
#### LDF 2013.04.11.


%.c++ %.h++ : %.web
	ctangle $<
####
	@cat cpyrtcpp.txt > AAAtmp.txt
	@echo >> AAAtmp.txt
	@cat $*.c >> AAAtmp.txt
	@mv AAAtmp.txt $*.c
####
	@if test -e $*.c++; \
        then \
        echo "$*.c++ exists"; \
        diff -q -w -B -I '^[[:space:]]*\(#line\|/\*\)' \
        $*.c++ $*.c > diff_c.res; \
           if test -s diff_c.res; \
           then \
              echo "$*.c++ has changed."; \
              mv $*.c $*.c++; \
           else \
              echo "$*.c++ is unchanged."; \
	      if test -s $*.o; \
	         then \
	         touch $*.o; \
	      fi; \
           fi; \
        else \
        echo "$*.c++ does not exist"; \
        mv $*.c $*.c++; \
        fi; 
####
	@if test -e $*.h; \
        then \
        cat cpyrtcpp.txt > AAAtmp.txt; \
        echo >> AAAtmp.txt; \
        cat $*.h >> AAAtmp.txt; \
        mv AAAtmp.txt $*.h; \
        fi;     
####
	@if test -e $*.h++; \
        then \
        echo "$*.h++ exists"; \
        diff -q -w -B -I '^[[:space:]]*\(#line\|/\*\)' \
        $*.h++ $*.h > diff_h.res; \
           if test -s diff_h.res; \
           then \
              echo "$*.h++ has changed."; \
              mv $*.h $*.h++; \
           else \
              echo "$*.h++ is unchanged."; \
           fi; \
        else \
        echo "$*.h++ does not exist"; \
        if test -e $*.h; then \
        mv $*.h $*.h++; fi; \
        fi; 
	@rm -f diff_c.res diff_h.res 

#### *** (3) 

#### These files need special rules (without actions) to ensure that one or more prequisites
#### are built.
#### 
#### LDF 2013.08.23.

ckietype.c++: excptntp.h++ glblcnst.h++ glblvrbl.h++ utilfncs.h++

clntactn.c++: dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ excptntp.h++ glblcnst.h++ glblvrbl.h++ grouptp.h++ \
              helper.h++ hndltype.h++ hndlvltp.h++ irdsavtp.h++ irdsobtp.h++ parser.h++ \
              pidfncs.h++ prsrfncs.h++ rspnstp.h++ scanner.h++ scprpmtp.h++ tanfncs.h++ \
              usrinftp.h++ utilfncs.h++ x509cert.h++

clntfncs.c++: dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ ex_rfc2818.h++ exchnsrv.h++ \
              excptntp.h++ glblcnst.h++ glblvrbl.h++ gntlsfnc.h++ grouptp.h++ helper.h++ \
              hndltype.h++ hndlvltp.h++ irdsavtp.h++ irdsobtp.h++ prsrclnt.h++ prsrcln2.h++ \
              rspnstp.h++ scnrclnt.h++ scnrcln2.h++ scprpmtp.h++ utilfncs.h++ x509cert.h++

connect.c++: exchncli.h++

ex_rfc2818.c++: glblcnst.h++ glblvrbl.h++ gntlsfnc.h++ utilfncs.h++ x509cert.h++

hndltype.c++: rspercds.h++

prsrfncs.c++:  prsrclnt.h++ scnrclnt.h++

#### *** (3) 

otptfnc0.o: otptfnc0.c++ 
	$(CXXCOMPILE) -c -o $@ $<

otptfnc1.o: otptfnc1.c++ 
	$(CXXCOMPILE) -c -o $@ $<


#### *** (3) 

prsrfncs.o: prsrfncs.c++ prsrfncs.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ \
            glblcnst.h++ glblvrbl.h++ grouptp.h++ \
            hndltype.h++ hndlvltp.h++ \
            irdsavtp.h++ irdsobtp.h++ \
            parser.h++ prsrclnt.h++ pidfncs.h++ pullrqtp.h++ \
            rspercds.h++ rspnstp.h++ scanner.h++ scnrclnt.h++ scprpmtp.h++ \
            tanfncs.h++ usrinftp.h++ utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<


purgarch.o: purgarch.c++ purgarch.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ \
            rspercds.h++ glblcnst.h++ glblvrbl.h++ grouptp.h++ \
            hndltype.h++ hndlvltp.h++ irdsavtp.h++ irdsobtp.h++ \
            parser.h++ pullrqtp.h++ rspnstp.h++ scanner.h++ scprpmtp.h++ \
            usrinftp.h++ utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<

purgdcmd.o: purgdcmd.c++ purgdcmd.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ excptntp.h++ \
            glblcnst.h++ glblvrbl.h++ grouptp.h++ hndltype.h++ hndlvltp.h++ \
            irdsavtp.h++ irdsobtp.h++ parser.h++ pullrqtp.h++ rspnstp.h++ \
            scanner.h++ scprpmtp.h++ usrinftp.h++ utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<

purgdtbs.o: purgdtbs.c++ purgdtbs.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ \
            rspercds.h++ glblcnst.h++ glblvrbl.h++ grouptp.h++ \
            hndltype.h++ hndlvltp.h++ irdsavtp.h++ irdsobtp.h++ \
            parser.h++ pullrqtp.h++ rspnstp.h++ scanner.h++ scprpmtp.h++ \
            usrinftp.h++ utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<

purgfncs.o: purgfncs.c++ purgfncs.h++ rspercds.h++ glblcnst.h++ glblvrbl.h++ utilfncs.h++ 
	$(CXXCOMPILE) -c -o $@ $<



#### *** (3) prbsnflx

#### prbsnflx is used for removing C-style comments from the output of CWEB 
#### in order to create valid input files for Flex and GNU Bison.
####
#### LDF 2011.08.10.

prbsnflx$(EXEEXT): prbsnflx.c++ 
	$(CXX) -o prbsnflx prbsnflx.c++

prbsnflx.c++: prbsnflx.l++
	$(LEX) -o $@ $<
	@cat cpyrt3DLcpp.txt > AAAtmp.txt
	@echo >> AAAtmp.txt
	@cat $@ >> AAAtmp.txt
	@mv AAAtmp.txt $@

#### *** (3)

.PHONY: sp

sp: parser.o prsrclnt.o scanner.o scnrclnt.o


.PHONY: rmsp

rmsp: 
	rm -f parser.y++ prsrclnt.y++ scanner.l++ scnrclnt.l++ scnrcln2.l++ \
              parser.c prsrclnt.c prsrcln2.c scanner.c scnrclnt.c scnrcln2.c \
              parser.c++ prsrclnt.c++ prsrcln2.c++ scanner.c++ scnrclnt.c++ scnrcln2.c++ \
              parser.cxx prsrclnt.cxx prsrcln2.cxx scanner.cxx scnrclnt.cxx scnrcln2.cxx \
              parser.h prsrclnt.h prsrcln2.h scanner.h scnrclnt.h scnrcln2.h  \
              parser.h++ prsrclnt.h++ prsrcln2.h++ scanner.h++ scnrclnt.h++ scnrcln2.h++ \
              parser.o prsrclnt.o prsrcln2.o scanner.o scnrclnt.o scnrcln2.o

parser.y++ : parser.web prbsnflx$(EXEEXT)
	ctangle $<
	./prbsnflx$(EXEEXT) parser.c parser.yxx
	rm parser.c
	@cat cpyrtcpp.txt > AAAtmp.txt
	@echo >> AAAtmp.txt
	@cat parser.yxx >> AAAtmp.txt
	@mv AAAtmp.txt parser.yxx
	./check_scan_parse_output.sh parser.yxx parser.y++

parser.c++ parser.h++ : parser.y++ 
	$(YACC) --debug -d -o parser.cxx $<
####
	@cat cpyrtcpp.txt > AAAtmp.txt
	@echo >> AAAtmp.txt
	@echo -e "/* Please note:  The license for the skeleton" \
		 "parser generated by GNU Bison appears below,\n" \
                 "  along with a special \"exception\".\n" \
		 "  That exception does not apply to this file, \`parser.c++'.\n" \
		 "  The GNU General Public License applies without exceptions to this file.  */\n" \
           >>   AAAtmp.txt
	@cat parser.cxx >> AAAtmp.txt
	@mv AAAtmp.txt parser.cxx
####
	@cat cpyrtcpp.txt > AAAtmp.txt
	@echo >> AAAtmp.txt
	@echo -e "/* Please note:  The license for the skeleton" \
		 "parser generated by GNU Bison appears below,\n" \
                 "  along with a special \"exception\".\n" \
		 "  That exception does not apply to this file, \`parser.h++'.\n" \
		 "  The GNU General Public License applies without exceptions to this file.  */\n" \
           >>   AAAtmp.txt
	@cat parser.hxx >> AAAtmp.txt
	@mv AAAtmp.txt parser.hxx
####
	@cat cpyrtasc.txt > AAAtmp.txt
	@echo >> AAAtmp.txt
	@cat parser.output >> AAAtmp.txt
	@mv AAAtmp.txt parser.output
####
	./check_scan_parse_output.sh parser.cxx parser.c++
	./check_scan_parse_output.sh parser.hxx parser.h++

parser.o: parser.c++ parser.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ \
                                glblcnst.h++ glblvrbl.h++ grouptp.h++ \
                                hndltype.h++ hndlvltp.h++ \
                                irdsavtp.h++ irdsobtp.h++ \
                                pidfncs.h++ prsrfncs.h++ pullrqtp.h++ \
                                rspercds.h++ rspnstp.h++ scanner.h++ scprpmtp.h++ \
                                tanfncs.h++ usrinftp.h++ utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<


#### *** (3)

scanner.o: scanner.c++ scanner.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ \
                       glblcnst.h++ glblvrbl.h++ grouptp.h++ \
                       hndltype.h++ hndlvltp.h++ \
                       irdsavtp.h++ irdsobtp.h++ parser.h++ pullrqtp.h++ \
                       rspercds.h++ rspnstp.h++ \
                       scprpmtp.h++ utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<

scanner.c++ scanner.h++ : scanner.l++ 
	$(LEX) -o scanner.cxx $<
####
	@cat cpyrtcpp.txt > AAAtmp.txt
	@echo >> AAAtmp.txt
	@cat scanner.cxx >> AAAtmp.txt
	@mv AAAtmp.txt scanner.cxx 
####
	@cat cpyrtcpp.txt > AAAtmp.txt
	@echo >> AAAtmp.txt
	@cat scanner.hxx >> AAAtmp.txt
	@mv AAAtmp.txt scanner.hxx 
####
	./check_scan_parse_output.sh scanner.cxx scanner.c++
	./check_scan_parse_output.sh scanner.hxx scanner.h++

scanner.l++ : scanner.web prbsnflx$(EXEEXT)
	ctangle scanner.web
	./prbsnflx$(EXEEXT) scanner.c scanner.lxx
	rm scanner.c
####
	@cat cpyrtcpp.txt | tr -d '\014' > AAAtmp.txt
	@echo >> AAAtmp.txt
	@cat scanner.lxx >> AAAtmp.txt
	@mv AAAtmp.txt scanner.lxx 
####
	./check_scan_parse_output.sh scanner.lxx scanner.l++

#### *** (3)

prsrclnt.y++ : prsrclnt.web prbsnflx$(EXEEXT)
	ctangle $<
	./prbsnflx$(EXEEXT) prsrclnt.c prsrclnt.yxx
	rm prsrclnt.c
	@cat cpyrtcpp.txt > AAAtmp.txt
	@echo >> AAAtmp.txt
	@cat prsrclnt.yxx >> AAAtmp.txt
	@mv AAAtmp.txt prsrclnt.yxx
	./check_scan_parse_output.sh prsrclnt.yxx prsrclnt.y++

prsrclnt.c++ prsrclnt.h++ : prsrclnt.y++ 
	$(YACC) --debug -d -o prsrclnt.cxx $<
####
	@cat cpyrtcpp.txt > AAAtmp.txt
	@echo >> AAAtmp.txt
	@echo -e "/* Please note:  The license for the skeleton" \
		 "parser generated by GNU Bison appears below,\n" \
                 "  along with a special \"exception\".\n" \
		 "  That exception does not apply to this file, \`prsrclnt.c++'.\n" \
		 "  The GNU General Public License applies without exceptions to this file.  */\n" \
           >>   AAAtmp.txt
	@cat prsrclnt.cxx >> AAAtmp.txt
	@mv AAAtmp.txt prsrclnt.cxx
####
	@cat cpyrtcpp.txt > AAAtmp.txt
	@echo >> AAAtmp.txt
	@echo -e "/* Please note:  The license for the skeleton" \
		 "parser generated by GNU Bison appears below,\n" \
                 "  along with a special \"exception\".\n" \
		 "  That exception does not apply to this file, \`prsrclnt.h++'.\n" \
		 "  The GNU General Public License applies without exceptions to this file.  */\n" \
           >>   AAAtmp.txt
	@cat prsrclnt.hxx >> AAAtmp.txt
	@mv AAAtmp.txt prsrclnt.hxx
####
	@cat cpyrtasc.txt > AAAtmp.txt
	@echo >> AAAtmp.txt
	@cat prsrclnt.output >> AAAtmp.txt
	@mv AAAtmp.txt prsrclnt.output
####
	./check_scan_parse_output.sh prsrclnt.cxx prsrclnt.c++
	./check_scan_parse_output.sh prsrclnt.hxx prsrclnt.h++

prsrclnt.o: prsrclnt.c++ prsrclnt.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ rspercds.h++ \
                         glblcnst.h++ glblvrbl.h++ gpgkprtp.h++ grouptp.h++ \
                         hndltype.h++ hndlvltp.h++ \
                         irdsavtp.h++ irdsobtp.h++ pidfncs.h++ prsrfncs.h++ rspnstp.h++ \
                         scnrclnt.h++ scprpmtp.h++ tanfncs.h++ usrinftp.h++ utilfncs.h++ \
                         x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<

#### *** (3)

scnrclnt.o: scnrclnt.c++ scnrclnt.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ \
                         glblcnst.h++ glblvrbl.h++ grouptp.h++ \
                         hndltype.h++ hndlvltp.h++ \
                         irdsavtp.h++ irdsobtp.h++ prsrclnt.h++ pullrqtp.h++ \
                         rspercds.h++ rspercds.h++ rspnstp.h++ \
                         scprpmtp.h++ utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<

scnrclnt.c++ scnrclnt.h++ : scnrclnt.l++ 
	$(LEX) -o scnrclnt.cxx $<
####
	@cat cpyrtcpp.txt > AAAtmp.txt
	@echo >> AAAtmp.txt
	@cat scnrclnt.cxx >> AAAtmp.txt
	@mv AAAtmp.txt scnrclnt.cxx 
####
	@cat cpyrtcpp.txt > AAAtmp.txt
	@echo >> AAAtmp.txt
	@cat scnrclnt.hxx >> AAAtmp.txt
	@mv AAAtmp.txt scnrclnt.hxx 
####
	./check_scan_parse_output.sh scnrclnt.cxx scnrclnt.c++
	./check_scan_parse_output.sh scnrclnt.hxx scnrclnt.h++

scnrclnt.l++ : scnrclnt.web prbsnflx$(EXEEXT)
	ctangle scnrclnt.web
	./prbsnflx$(EXEEXT) scnrclnt.c scnrclnt.lxx
	rm scnrclnt.c
####
	@cat cpyrtcpp.txt | tr -d '\014' > AAAtmp.txt
	@echo >> AAAtmp.txt
	@cat scnrclnt.lxx >> AAAtmp.txt
	@mv AAAtmp.txt scnrclnt.lxx 
####
	./check_scan_parse_output.sh scnrclnt.lxx scnrclnt.l++

#### *** (3)

scnrcln2.o: scnrcln2.c++ scnrcln2.h++ glblcnst.h++ glblvrbl.h++ utilfncs.h++ \
                         prsrcln2.h++
	$(CXXCOMPILE) -c -o $@ $<

scnrcln2.c++ scnrcln2.h++ : scnrcln2.l++ 
	$(LEX) -o scnrcln2.cxx $<
####
	@cat cpyrtcpp.txt > AAAtmp.txt
	@echo >> AAAtmp.txt
	@cat scnrcln2.cxx >> AAAtmp.txt
	@mv AAAtmp.txt scnrcln2.cxx 
####
	@cat cpyrtcpp.txt > AAAtmp.txt
	@echo >> AAAtmp.txt
	@cat scnrcln2.hxx >> AAAtmp.txt
	@mv AAAtmp.txt scnrcln2.hxx 
####
	./check_scan_parse_output.sh scnrcln2.cxx scnrcln2.c++
	./check_scan_parse_output.sh scnrcln2.hxx scnrcln2.h++

scnrcln2.l++ : scnrcln2.web prbsnflx$(EXEEXT)
	ctangle scnrcln2.web
	./prbsnflx$(EXEEXT) scnrcln2.c scnrcln2.lxx
	rm scnrcln2.c
####
	@cat cpyrtcpp.txt | tr -d '\014' > AAAtmp.txt
	@echo >> AAAtmp.txt
	@cat scnrcln2.lxx >> AAAtmp.txt
	@mv AAAtmp.txt scnrcln2.lxx 
####
	./check_scan_parse_output.sh scnrcln2.lxx scnrcln2.l++

#### *** (3)

prsrcln2.y++ : prsrcln2.web prbsnflx$(EXEEXT)
	ctangle $<
	./prbsnflx$(EXEEXT) prsrcln2.c prsrcln2.yxx
	rm prsrcln2.c
	@cat cpyrtcpp.txt > AAAtmp.txt
	@echo >> AAAtmp.txt
	@cat prsrcln2.yxx >> AAAtmp.txt
	@mv AAAtmp.txt prsrcln2.yxx
	./check_scan_parse_output.sh prsrcln2.yxx prsrcln2.y++

prsrcln2.c++ prsrcln2.h++ : prsrcln2.y++ 
	$(YACC) --debug -d -o prsrcln2.cxx $<
####
	@cat cpyrtcpp.txt > AAAtmp.txt
	@echo >> AAAtmp.txt
	@echo -e "/* Please note:  The license for the skeleton" \
		 "parser generated by GNU Bison appears below,\n" \
                 "  along with a special \"exception\".\n" \
		 "  That exception does not apply to this file, \`prsrcln2.c++'.\n" \
		 "  The GNU General Public License applies without exceptions to this file.  */\n" \
           >>   AAAtmp.txt
	@cat prsrcln2.cxx >> AAAtmp.txt
	@mv AAAtmp.txt prsrcln2.cxx
####
	@cat cpyrtcpp.txt > AAAtmp.txt
	@echo >> AAAtmp.txt
	@echo -e "/* Please note:  The license for the skeleton" \
		 "parser generated by GNU Bison appears below,\n" \
                 "  along with a special \"exception\".\n" \
		 "  That exception does not apply to this file, \`prsrcln2.h++'.\n" \
		 "  The GNU General Public License applies without exceptions to this file.  */\n" \
           >>   AAAtmp.txt
	@cat prsrcln2.hxx >> AAAtmp.txt
	@mv AAAtmp.txt prsrcln2.hxx
####
	@cat cpyrtasc.txt > AAAtmp.txt
	@echo >> AAAtmp.txt
	@cat prsrcln2.output >> AAAtmp.txt
	@mv AAAtmp.txt prsrcln2.output
####
	./check_scan_parse_output.sh prsrcln2.cxx prsrcln2.c++
	./check_scan_parse_output.sh prsrcln2.hxx prsrcln2.h++

prsrcln2.o: prsrcln2.c++ prsrcln2.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ \
            glblcnst.h++ glblvrbl.h++ grouptp.h++ hndltype.h++ hndlvltp.h++ \
            irdsavtp.h++ irdsobtp.h++ \
            prsrcln2.h++ pullpttp.h++ pullrstp.h++ pullrqtp.h++ \
            rspercds.h++ rspnstp.h++ \
            scnrcln2.h++ scprpmtp.h++ usrinftp.h++ utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<

#### *** (3) Compile source files for 'gwirdsif', 'gwirdcli' and `gwirdpcl'

clntactn.o: clntactn.c++ $(gwrdifpk_hpp_files) 
	$(CXXCOMPILE) -c -o $@ $<

clntfncs.o: clntfncs.c++ clntfncs.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ \
                         ex_rfc2818.h++ excptntp.h++ exchnsrv.h++ \
                         glblcnst.h++ glblvrbl.h++ gntlsfnc.h++ grouptp.h++ \
                         helper.h++ hndltype.h++ hndlvltp.h++ irdsavtp.h++ irdsobtp.h++ \
                         parser.h++ pidfncs.h++ prsrclnt.h++ pullrqtp.h++ \
                         rspercds.h++ rspnstp.h++ scanner.h++ scnrclnt.h++ \
                         scprpmtp.h++ tanfncs.h++ usrinftp.h++ utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<

cmdlnopt.o: cmdlnopt.c++ cmdlnopt.h++ rspercds.h++ glblcnst.h++ glblvrbl.h++ parser.h++ prsrclnt.h++ \
                         scanner.h++ scnrclnt.h++ utilfncs.h++
	$(CXXCOMPILE) -c -o $@ $<

connect.o: connect.c++ connect.h++ exchncli.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ \
                       excptntp.h++ \
                       glblcnst.h++ glblvrbl.h++ grouptp.h++ hndltype.h++ hndlvltp.h++ \
                       irdsavtp.h++ irdsobtp.h++ parser.h++ pullrqtp.h++ \
                       rspercds.h++ rspnstp.h++ scanner.h++ scprpmtp.h++ utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<



dcmdsbtp.o: dcmdsbtp.c++ dcmdsbtp.h++ dcmtdttp.h++ rspercds.h++ glblcnst.h++ glblvrbl.h++ hndlvltp.h++ \
                                      parser.h++ rspercds.h++ rspnstp.h++ scanner.h++ utilfncs.h++
	$(CXXCOMPILE) -c -o $@ $<

dcmtdttp.o: dcmtdttp.c++ dcmtdttp.h++ dcmdsbtp.h++ rspercds.h++ glblcnst.h++ glblvrbl.h++ hndlvltp.h++ \
                                      parser.h++ rspercds.h++ rspnstp.h++ scanner.h++ utilfncs.h++
	$(CXXCOMPILE) -c -o $@ $<

dstngnmt.o: dstngnmt.c++ dstngnmt.h++ dcmdsbtp.h++ dcmtdttp.h++ rspercds.h++ excptntp.h++ glblcnst.h++ glblvrbl.h++ \
            hndltype.h++ hndlvltp.h++ irdsavtp.h++ irdsobtp.h++ parser.h++ rspnstp.h++ \
            scanner.h++ utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<

exchncli.o: exchncli.c++ exchncli.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ \
                         excptntp.h++ glblcnst.h++ glblvrbl.h++ \
                         grouptp.h++ helper.h++ hndltype.h++ hndlvltp.h++ \
                         irdsavtp.h++ irdsobtp.h++ parser.h++ \
                         pidfncs.h++ pullrqtp.h++ rspercds.h++ rspnstp.h++ scanner.h++ scprpmtp.h++ \
                         utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<

exchnsrv.o: exchnsrv.c++ exchnsrv.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ \
                         excptntp.h++ glblcnst.h++ glblvrbl.h++ \
                         grouptp.h++ helper.h++ hndltype.h++ hndlvltp.h++ irdsavtp.h++ irdsobtp.h++ \
                         prsrclnt.h++ pullrqtp.h++ pidfncs.h++ rspercds.h++ rspnstp.h++ \
                         scnrclnt.h++ scprpmtp.h++ tanfncs.h++ utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<

ex_rfc2818.o: ex_rfc2818.c++ ex_rfc2818.h++ rspercds.h++ \
                             glblcnst.h++ glblvrbl.h++ gntlsfnc.h++ utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<

excptntp.o: excptntp.c++ rspercds.h++ glblcnst.h++ glblvrbl.h++
	$(CXXCOMPILE) -c -o $@ $<

glblcnst.o: glblcnst.c++ glblcnst.h++
	$(CXXCOMPILE) -c -o $@ $<

ckietype.o: ckietype.c++ ckietype.h++ rspercds.h++ excptntp.h++ glblcnst.h++ glblvrbl.h++ utilfncs.h++
	$(CXXCOMPILE) -c -o $@ $<


glblvrbl.o: glblvrbl.c++ glblcnst.h++ glblvrbl.h++ 
	$(CXXCOMPILE) -c -o $@ $<

gntlsfnc.o: gntlsfnc.c++ gntlsfnc.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ \
                                      excptntp.h++ glblcnst.h++ glblvrbl.h++ \
                                      grouptp.h++ hndltype.h++ hndlvltp.h++ irdsavtp.h++ irdsobtp.h++ \
                                      parser.h++ pullrqtp.h++ rspercds.h++ rspnstp.h++ \
                                      scanner.h++ scprpmtp.h++ \
                                      utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<


## parser.h++ scanner.h++ 

gpgkprtp.o: gpgkprtp.c++ gpgkprtp.h++ glblcnst.h++ glblvrbl.h++ utilfncs.h++
	$(CXXCOMPILE) -c -o $@ $<

grouptp.o: grouptp.c++ grouptp.h++ rspercds.h++ glblcnst.h++ glblvrbl.h++ utilfncs.h++ 
	$(CXXCOMPILE) -c -o $@ $<

gwirdcli.o: gwirdcli.c++ clntfncs.h++ cmdlnopt.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ \
                         excptntp.h++ glblcnst.h++ glblvrbl.h++ grouptp.h++ hndltype.h++ hndlvltp.h++ \
                         irdsavtp.h++ irdsobtp.h++ \
                         pidfncs.h++ prsrclnt.h++ prsrcln2.h++ pullpttp.h++ pullrstp.h++ \
                         pullrqtp.h++ purgfncs.h++ \
                         rspercds.h++ rspnstp.h++ \
                         scanner.h++ scnrclnt.h++ scnrcln2.h++ scprpmtp.h++ tanfncs.h++ \
                         usrinftp.h++ utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<

gwirdpcl.o: gwirdpcl.c++ cmdlnopt.h++ clntfncs.h++ connect.h++ dcmdsbtp.h++ \
	    dcmtdttp.h++ dstngnmt.h++ ex_rfc2818.h++ exchncli.h++ excptntp.h++ \
	    glblcnst.h++ glblvrbl.h++ gntlsfnc.h++ grouptp.h++ hndltype.h++ \
	    hndlvltp.h++ irdsavtp.h++ irdsobtp.h++ \
	    plclfunc.h++ prsrclnt.h++ prsrcln2.h++ \
            pullpttp.h++ pullrqtp.h++ pullrspn.h++ pullrstp.h++ \
            purgfncs.h++ \
            rspercds.h++ rspnstp.h++ \
            scnrclnt.h++ scnrcln2.h++ scprpmtp.h++ usrinftp.h++ utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<


gwirdsif.o: gwirdsif.c++ clntfncs.h++ cmdlnopt.h++ connect.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ \
                         excptntp.h++ glblcnst.h++ glblvrbl.h++ grouptp.h++ \
                         hndltype.h++ hndlvltp.h++ irdsavtp.h++ irdsobtp.h++ \
                         listnlcl.h++ lstnrmta.h++ lstnrmtx.h++ \
                         parser.h++ pullpttp.h++ pullrqst.h++ pullrqtp.web pullrstp.h++ \
                         purgarch.h++ purgdcmd.h++ purgdtbs.h++ purgfncs.h++ \
                         rspercds.h++ rspnstp.h++ \
                         scanner.h++ scprpmtp.h++ sgnlhndl.h++ \
                         usrinftp.h++ utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<


helper.o: helper.c++ helper.h++ glblcnst.h++ glblvrbl.h++ utilfncs.h++
	$(CXXCOMPILE) -c -o $@ $<



irdsobtp.o: irdsobtp.c++ irdsobtp.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ rspercds.h++ excptntp.h++ \
                                      glblcnst.h++ glblvrbl.h++ grouptp.h++ hndltype.h++ hndlvltp.h++ \
                                      irdsavtp.h++ parser.h++ pullrqtp.h++ rspercds.h++ rspnstp.h++ \
                                      scanner.h++ scprpmtp.h++ \
                                      usrinftp.h++ utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<

irdsavtp.o: irdsavtp.c++ irdsavtp.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ rspercds.h++ excptntp.h++ \
                                      glblcnst.h++ glblvrbl.h++ \
                                      grouptp.h++ hndltype.h++ hndlvltp.h++ irdsobtp.h++ \
                                      parser.h++ pullrqtp.h++ rspnstp.h++ \
                                      scanner.h++ scprpmtp.h++ usrinftp.h++ utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<

hndltype.o: hndltype.c++ hndltype.h++ rspercds.h++ excptntp.h++ glblcnst.h++ glblvrbl.h++ hndlvltp.h++ \
                         irdsavtp.h++ irdsobtp.h++ parser.h++ rspercds.h++ rspnstp.h++ \
                         scanner.h++ utilfncs.h++
	$(CXXCOMPILE) -c -o $@ $<

hndlvltp.o: hndlvltp.c++ hndlvltp.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ excptntp.h++ \
                         glblcnst.h++ glblvrbl.h++ grouptp.h++ irdsavtp.h++ \
                         irdsobtp.h++ parser.h++ pullrqtp.h++ rspercds.h++ rspnstp.h++ \
                         scanner.h++ scprpmtp.h++ usrinftp.h++ utilfncs.h++ \
                         x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<

listnlcl.o: listnlcl.c++ listnlcl.h++ connect.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ \
                                      excptntp.h++ \
                                      glblcnst.h++ glblvrbl.h++ grouptp.h++ hndltype.h++ hndlvltp.h++ \
                                      irdsavtp.h++ irdsobtp.h++ parser.h++ pullrqtp.h++ \
                                      rspercds.h++ rspnstp.h++ scanner.h++ scprpmtp.h++ \
                                      utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<

lstnrmta.o: lstnrmta.c++ lstnrmta.h++ clntfncs.h++ connect.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ \
                                      excptntp.h++ \
                                      glblcnst.h++ glblvrbl.h++ grouptp.h++ \
                                      helper.h++ hndltype.h++ hndlvltp.h++ \
                                      irdsavtp.h++ irdsobtp.h++ parser.h++ pullrqtp.h++ \
                                      rspercds.h++ rspnstp.h++ scanner.h++ scprpmtp.h++ \
                                      utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<

lstnrmtx.o: lstnrmtx.c++ lstnrmtx.h++ clntfncs.h++ connect.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ \
                                      ex_rfc2818.h++ excptntp.h++ \
                                      glblcnst.h++ glblvrbl.h++ gntlsfnc.h++ grouptp.h++ \
                                      hndltype.h++ hndlvltp.h++ \
                                      irdsavtp.h++ irdsobtp.h++ \
                                      parser.h++ pullrqtp.h++ \
                                      rspercds.h++ rspnstp.h++ scanner.h++ scprpmtp.h++ \
                                      usrinftp.h++ utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<

pidfncs.o: pidfncs.c++ pidfncs.h++ excptntp.h++ glblcnst.h++ glblvrbl.h++ \
                       hndltype.h++ hndlvltp.h++ \
                       irdsavtp.h++ irdsobtp.h++ rspercds.h++ rspnstp.h++ utilfncs.h++ 
	$(CXXCOMPILE) -c -o $@ $<

plclfunc.o: plclfunc.c++ plclfunc.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ \
			 ex_rfc2818.h++ exchnsrv.h++ excptntp.h++ glblcnst.h++ \
			 glblvrbl.h++ gntlsfnc.h++ grouptp.h++ helper.h++ \
			 hndltype.h++ hndlvltp.h++ irdsavtp.h++ irdsobtp.h++ \
			 prsrclnt.h++ pullrqtp.h++ rspnstp.h++ scnrclnt.h++ scprpmtp.h++ \
			 usrinftp.h++ utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<

pullrqst.o: pullrqst.c++ pullrqst.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ \
			 ex_rfc2818.h++ excptntp.h++ glblcnst.h++ glblvrbl.h++ \
			 gntlsfnc.h++ grouptp.h++ helper.h++ hndltype.h++ \
			 hndlvltp.h++ irdsavtp.h++ irdsobtp.h++ parser.h++ pullrqtp.h++ \
			 rspnstp.h++ scanner.h++ scprpmtp.h++ usrinftp.h++ \
			 utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<

pullrqtp.o: pullrqtp.c++ pullrqtp.h++ dstngnmt.h++ ex_rfc2818.h++ excptntp.h++ \
                                      glblcnst.h++ glblvrbl.h++ gntlsfnc.h++ helper.h++ \
                         parser.h++ scanner.h++ utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<

pullpttp.o: pullpttp.c++ pullpttp.h++ dstngnmt.h++ ex_rfc2818.h++ excptntp.h++ \
                                      glblcnst.h++ glblvrbl.h++ gntlsfnc.h++ helper.h++ \
                         parser.h++ scanner.h++ utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<

pullrstp.o: pullrstp.c++ pullrstp.h++ dstngnmt.h++ ex_rfc2818.h++ excptntp.h++ \
                                      glblcnst.h++ glblvrbl.h++ gntlsfnc.h++ grouptp.h++ \
                                      hndltype.h++ hndlvltp.h++ helper.h++ \
                                      irdsavtp.h++ irdsobtp.h++ \
                                      parser.h++ pullpttp.h++ pullrqtp.h++ \
                                      rspnstp.h++ \
                                      scanner.h++ scprpmtp.h++ \
                                      utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<


pullrspn.o: pullrspn.c++ pullrspn.h++ clntfncs.h++ dcmdsbtp.h++ dcmtdttp.h++ \
			 dstngnmt.h++ ex_rfc2818.h++ excptntp.h++ glblcnst.h++ \
			 glblvrbl.h++ gntlsfnc.h++ grouptp.h++ helper.h++ \
			 hndltype.h++ hndlvltp.h++ irdsavtp.h++ irdsobtp.h++ \
			 parser.h++ plclfunc.h++ pullpttp.h++ pullrqtp.h++ pullrstp.h++ \
                         rspercds.h++ rspnstp.h++ scanner.h++ \
			 scprpmtp.h++ usrinftp.h++ utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<


rspercds.o: rspercds.c++ rspercds.h++
	$(CXXCOMPILE) -c -o $@ $<

rspnstp.o: rspnstp.c++ rspnstp.h++ glblcnst.h++ glblvrbl.h++ hndltype.h++ hndlvltp.h++ \
                                   irdsavtp.h++ irdsobtp.h++ rspercds.h++ 
	$(CXXCOMPILE) -c -o $@ $<


scprpmtp.o: scprpmtp.c++ scprpmtp.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ rspercds.h++ excptntp.h++ \
                         glblcnst.h++ glblvrbl.h++ grouptp.h++ \
                         helper.h++ hndltype.h++ hndlvltp.h++ irdsavtp.h++ irdsobtp.h++ \
                         parser.h++ pidfncs.h++ pullpttp.h++ pullrqtp.h++ pullrstp.h++ rspnstp.h++ \
                         scanner.h++ tanfncs.h++ \
                         usrinftp.h++ utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<

sgnlhndl.o: sgnlhndl.c++ sgnlhndl.h++ cmdlnopt.h++ excptntp.h++ glblcnst.h++ glblvrbl.h++ \
                                      pullrqtp.h++ rspercds.h++ scprpmtp.h++ utilfncs.h++ 
	$(CXXCOMPILE) -c -o $@ $<


spptfnc1.o: spptfnc1.c++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ excptntp.h++ glblcnst.h++ glblvrbl.h++ \
                         grouptp.h++ helper.h++ hndltype.h++ hndlvltp.h++ irdsavtp.h++ irdsobtp.h++ \
                         parser.h++ pidfncs.h++ pullrqtp.h++ \
                         rspercds.h++ rspnstp.h++ scanner.h++ scprpmtp.h++ \
                         tanfncs.h++ usrinftp.h++ utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<

spptfnc2.o: spptfnc2.c++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ \
                         excptntp.h++ glblcnst.h++ glblvrbl.h++ \
                         grouptp.h++ helper.h++ hndltype.h++ hndlvltp.h++ irdsavtp.h++ irdsobtp.h++ \
                         parser.h++ pidfncs.h++ \
                         pullpttp.h++ pullrqtp.h++ pullrstp.h++ \
                         rspercds.h++ rspnstp.h++ \
                         scanner.h++ scprpmtp.h++ \
                         tanfncs.h++ usrinftp.h++ utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<


srvractn.o: srvractn.c++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ excptntp.h++ \
                         glblcnst.h++ glblvrbl.h++ grouptp.h++ \
                         helper.h++ hndltype.h++ hndlvltp.h++ irdsavtp.h++ irdsobtp.h++ \
                         parser.h++ pidfncs.h++ prsrfncs.h++ pullrqtp.h++ \
                         rspercds.h++ rspnstp.h++ scanner.h++ scprpmtp.h++ \
                         tanfncs.h++ usrinftp.h++ utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<

tanfncs.o: tanfncs.c++ tanfncs.h++ rspercds.h++ excptntp.h++ glblcnst.h++ glblvrbl.h++ \
                       hndltype.h++ hndlvltp.h++ \
                       irdsavtp.h++ irdsobtp.h++ utilfncs.h++
	$(CXXCOMPILE) -c -o $@ $<

usrinftp.o: usrinftp.c++ usrinftp.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ excptntp.h++ \
            glblcnst.h++ glblvrbl.h++ \
            grouptp.h++ helper.h++ hndltype.h++ hndlvltp.h++ irdsavtp.h++ irdsobtp.h++ \
            parser.h++ pidfncs.h++ pullrqtp.h++ rspercds.h++ rspnstp.h++ \
            scanner.h++ scprpmtp.h++ tanfncs.h++ utilfncs.h++ \
            x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<


utilfncs.o: utilfncs.c++ utilfncs.h++ excptntp.h++ glblcnst.h++ glblvrbl.h++ gpgkprtp.h++
	$(CXXCOMPILE) -c -o $@ $<




x509cert.o: x509cert.c++ x509cert.h++ dcmdsbtp.h++ dcmtdttp.h++ excptntp.h++ glblcnst.h++ glblvrbl.h++ \
                                      hndltype.h++ hndlvltp.h++ irdsavtp.h++ \
                                      irdsobtp.h++ parser.h++ rspercds.h++ rspnstp.h++ \
                                      scanner.h++ utilfncs.h++
	$(CXXCOMPILE) -c -o $@ $<      

#### *** (3) Rebuild iRODS API library and icommand 'ils'.

#### LDF 2013.01.22.
#### Currently not linking with 'libRodsAPIs.a'.
#### Put back if needed:
####
#### In target:  $(HOME)/iRODS/lib/core/obj/libRodsAPIs.a
#### 
#### In action:  (CXXLINK) $^ $(HOME)/iRODS/lib/core/obj/libRodsAPIs.a $(LIBS)

#### *** (3) Rebuild iRODS API library and icommand 'ils'.

#### LDF 2013.01.22.
#### Currently not linking with 'libRodsAPIs.a'.  Uncomment if needed again.

#### (HOME)/iRODS/lib/core/obj/libRodsAPIs.a: $(HOME)/iRODS/lib/core/src/lsUtil.c \
####                                          $(HOME)/iRODS/lib/core/include/lsUtil.h
#### rm -f $(HOME)/iRODS/clients/icommands/bin/ils
#### $(MAKE) -C $(HOME)/iRODS/lib -f $(HOME)/iRODS/lib/Makefile
#### $(MAKE) -C $(HOME)/iRODS/clients/icommands -f $(HOME)/iRODS/clients/icommands/Makefile

#### *** (3) Compile and link 'genpids'.

genpids.o: genpids.c++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ excptntp.h++ glblcnst.h++ \
                       glblvrbl.h++ gpcmlopt.h++ grouptp.h++ helper.h++ hndltype.h++ \
                       hndlvltp.h++ irdsavtp.h++ irdsobtp.h++ parser.h++ \
                       pidfncs.h++ rspercds.h++ rspnstp.h++ scanner.h++ \
                       scprpmtp.h++ tanfncs.h++ usrinftp.h++ utilfncs.h++ \
                       x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<

gpcmlopt.o: gpcmlopt.c++ gpcmlopt.h++ hndlvltp.h++ glblcnst.h++ glblvrbl.h++
	$(CXXCOMPILE) -c -o $@ $<

genpids$(EXEEXT): $(genpids_obj_files) optpsgen$(EXEEXT) $(genpids_LDADD)
	@echo "Linking \`genpids$(EXEEXT)'"
	/bin/sh ../libtool --tag=CXX   --mode=link g++ \
           $(LDFLAGS) \
           -o $@ -rpath $(bindir) $(genpids_obj_files) $(genpids_LDADD) $(LIBS)

.PHONY: run-p

# --listen-client-port=5559

run-p: gwirdpcl$(EXEEXT)
	echo "update Pull_Requests set latest_pull = timestampadd(second, -86500, now()) " \
             "where pull_request_id = 1; " \
             "update gwirdcli.Pull_Responses set latest_pull = timestampadd(second, -86500, now()) " \
             "where pull_response_id = 1" | mysql --user=root --password=root gwirdsif
	gpg --decrypt lfinsto.gpg.asc | ./$< `hostname --long` \
           --suppress-prompt --save-temp-files \
           --cert-filename "lfinsto_cert.pem" --key-filename "lfinsto_key.pem" \
           --config-dir /home/lfinsto/irods_proj/irods_master/Finston/gwrdifpk/src \
           --input-filename=test_input.txt \
           --mysql-password-filename=gwirdcli_lfinsto_mysql_password_with_passphrase.gpg.asc \
           --gpg-passphrase \
           --listen-client-port=5560 \
           --gpg-homedir=/home/lfinsto/irods_proj/irods_master/Finston/gwrdifpk/src/.gnupg_gwirdcli \
           --mysql-password-filename=gwirdcli_lfinsto_mysql_password_with_passphrase.gpg.asc 






#run-p: genpids$(EXEEXT)
#	./$< "0" 12345 zzzz 

.PHONY: run-pv

run-pv: genpids$(EXEEXT)
	./$< 00001 zzzz ABC

#### *** (3) Compile and link 'gentans'.

gentans.o: gentans.c++ rspercds.h++ excptntp.h++ glblcnst.h++ glblvrbl.h++ tanfncs.h++ utilfncs.h++
	$(CXXCOMPILE) -c -o $@ $<

gentans$(EXEEXT): gentans.o glblcnst.o glblvrbl.o gpgkprtp.o excptntp.o \
                     tanfncs.o utilfncs.o optpsgen$(EXEEXT)
	@echo "Linking \`gentans$(EXEEXT)'"
	$(CXX) -o $@ gentans.o glblcnst.o glblvrbl.o excptntp.o gpgkprtp.o otptfnc1.c++ \
                      tanfncs.o utilfncs.o -lmysqlclient 

# -fprofile-arcs -ftest-coverage


.PHONY: run-gentans

run-gentans: gentans$(EXEEXT)
	./$<	

.PHONY: run-z  #### Must be executed as 'root'.

run-z:
	./kill_gwrdwbap.fcgi.sh
	rm -f /tmp/gwrdwbap.*
	$(MAKE) install-gwrdwbap 
	chown -R lfinsto:users /home/lfinsto/irods_proj/irods/
	su lfinsto -c "$(MAKE) run"

#### *** (3) optpsgen

optpsgen$(EXEEXT): optpsgen.o optpsgsb.o
	@echo "Linking \`optpsgen$(EXEEXT)'"
	$(CXXLINK) $^ $(LIBS)

optpsgen.o: optpsgen.c++ optpsgsb.h++
	$(CXXCOMPILE) -c -o $@ $<


optpsgsb.o: optpsgsb.c++ 
	$(CXXCOMPILE) -c -o $@ $<

.PHONY: run-o

run-o: optpsgen
	./$< 


utlwbfcs.o: utlwbfcs.c++ utlwbfcs.h++ ckietype.h++ clntfncs.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ \
            excptntp.h++ glblcnst.h++ glblvrbl.h++ grouptp.h++ \
            hndltype.h++ hndlvltp.h++ irdsavtp.h++ irdsobtp.h++ pidfncs.h++ pullrqtp.h++ \
            rspercds.h++ rspnstp.h++ scprpmtp.h++ \
            tanfncs.h++ utilfncs.h++ x509cert.h++
	$(CXXCOMPILE) -c -o $@ $<

#### LDF 2013.01.22.
#### Currently not linking with 'libRodsAPIs.a'.  Put back if needed:
#### In target:  $(HOME)/iRODS/clients/icommands/../../lib/core/obj/libRodsAPIs.a

gwrdwbap.o: gwrdwbap.c++ pullrqtp.h++ utlwbfcs.h++ 
	$(CXXCOMPILE) -c -o $@ $<

INSTALL_GWRDWBAP_COMMAND = rm -f /srv/www/fcgi-bin/gwrdwbap$(EXEEXT).fcgi \
	                     && cp `pwd`/gwrdwbap$(EXEEXT) /srv/www/fcgi-bin/gwrdwbap$(EXEEXT).fcgi \
                             && chown :www /srv/www/fcgi-bin/gwrdwbap$(EXEEXT).fcgi
.PHONY: install-gwrdwbap

install-gwrdwbap: gwrdwbap$(EXEEXT)
	su - --command="$(INSTALL_GWRDWBAP_COMMAND)"


#### *** (3) Run gwirdsif

.PHONY: run-s

# gwirdsif$(EXEEXT) 

#### LOG
####
#### On 'vfu-irods.gwdg.de', the environment variable 'HOSTNAME' is empty
#### during the run of 'make'.  I therefore have to pass it 'gwirdsif'
#### using 'env'.  It's used in |Scan_Parse_Parameter_Type::get_user|
#### in 'scprpmtp.web'.  This was not necessary on 'pcfinston.gwdg.de'.
####
#### LDF 2012.09.11.
####
#### ENDLOG

#### As of this date, most commands have not yet been implemented using
#### functions from the iRODS package, so 'icommands' must be 'true' 
#### in 'gwirdsif'.  I therefore pass the '--icommands' option to it
#### in the 'make run-s' and 'make run-sb' rules.
#### LDF 2012.11.30.

# --end-server-enable 
# --purge-logs-interval=0 
# --save-temp-files
# --end-server-enable 
# --sleep-server-enable
# --server-test-enable 
# --flex-trace --bison-trace
# --signal-server-enable
# --signal-client-enable 
# --sleep-client-enable
# --save-temp-files
# --purge-database-interval 0 --purge-database-limit 0 
# --purge-irods-archive-interval 0 --purge-irods-archive-limit 0 
# 604800 == 1 week    (* 60 60 24 7)
#            --gpg-key-id=C3482EF6

#### The file 'mysql_password_no_passphrase.gpg.asc',
#### which is the argument to the option '--mysql-password-filename' used below,
#### contains the MySQL password encrypted using the key 
#### C3482EF6, GWDG iRODS Interface Server (gwirdsif) <lfinsto@gwdg.de>
####
#### 'mysql_password_no_passphrase.gpg.asc' was created using this command:
####
#### echo <password> | gpg --encrypt -a -r irods -o mysql_password_no_passphrase.gpg.asc
####
#### LDF 2013.09.26.

##### If the option 
##### --mysql-password-filename=mysql_password_no_passphrase.gpg.asc
##### is used without the option --gpg-passphrase, 'gwirdsif' blocks.
##### If it's used and --gpg-passphrase is used, a non-empty passphrase must be entered,
##### or 'gwirdsif' exits with an error.  However, if a dummy passphrase is entered,
##### an error occurs later on.
#####
##### This rule should therefore be used if the use of GPG is _not_ desired.
#### !! TODO: 
##### I will have to test the various possibilities of using GPG or not at a later date.
####
##### LDF 2013.10.04.

#### GPG key ID C3482EF6:  GWDG iRODS Interface Server (gwirdsif) <lfinsto@gwdg.de>
####
#### LDF 2013.11.22.

# --bison-trace --flex-trace 
# --save-temp-files 

run-s: gwirdsif$(EXEEXT) gwirdcli$(EXEEXT) 
	env HOSTNAME=`hostname` \
           ./$< --purge-logs-interval=0 --save-temp-files \
            --sleep-server-enable --sleep-client-enable --end-server-enable \
            --irods-server-directory /home/lfinsto/iRODS \
            --config-dir /home/lfinsto/irods_proj/irods_master/Finston/gwrdifpk/src \
            --purge-database-interval=0 --purge-database-limit=604800 \
            --purge-irods-archive-interval=0 --purge-irods-archive-limit=5 \
            --purge-dc-metadata-interval=0 --purge-dc-metadata-limit=5 \
            --gpg-key-id=C3482EF6 \
            --mysql-username=root --mysql-password-filename=mysql_password_no_passphrase.gpg.asc 


#### run-sd is the same as run-s, except that --purge-dc-metadata-interval=10.
####
#### LDF 2013.12.05.

.PHONY: run-sd

run-sd: gwirdsif$(EXEEXT) gwirdcli$(EXEEXT) 
	env HOSTNAME=`hostname` \
           ./$< --purge-logs-interval=0 \
            --sleep-server-enable --save-temp-files --sleep-client-enable --end-server-enable \
            --irods-server-directory /home/lfinsto/irods_proj/irods_master/Finston/iRODS \
            --config-dir /home/lfinsto/irods_proj/irods_master/Finston/gwrdifpk/src \
            --purge-database-interval=0 --purge-database-limit=604800 \
            --purge-irods-archive-interval=0 --purge-irods-archive-limit=5 \
            --purge-dc-metadata-interval=10 --purge-dc-metadata-limit=5 \
            --gpg-key-id=C3482EF6 \
            --mysql-username=root --mysql-password-filename=mysql_password_no_passphrase.gpg.asc 

#### !! Please note:  'start_gwirdsif_with_passphrase.sh' is just for testing, 
#### because the passphrase will appear the in /proc/[PID]/cmdline' entry for the 'echo' 
#### command used in the shellscript.
####  
#### For production use, the passphrase should be decrypted and the output of 'gpg' should
#### be piped to 'gwirdsif', e.g.,
####
#### gpg --decrypt lfinsto.gpg.asc | ./gwirdsif [...]
####
#### It doesn't matter what key pair is used to encrypt the passphrase.
####
#### LDF 2013.09.26.

.PHONY: run-sg

run-sg: gwirdsif$(EXEEXT) gwirdcli$(EXEEXT) 
	env HOSTNAME=`hostname` start_gwirdsif_with_passphrase.sh 

# .PHONY: run-sd

# run-sd: gwirdsif$(EXEEXT) gwirdcli$(EXEEXT) 
# 	gpg --decrypt lfinsto.gpg.asc | ./$< --purge-logs-interval=0 \
#             --sleep-server-enable --save-temp-files --sleep-client-enable --end-server-enable \
#             --irods-server-directory /home/lfinsto/irods_proj/irods_master/Finston/iRODS \
#             --config-dir /home/lfinsto/irods_proj/irods_master/Finston/gwrdifpk/src \
#             --purge-database-interval 0 --purge-database-limit 604800 \
#             --purge-irods-archive-interval 0 --purge-irods-archive-limit 0 \
#             --mysql-username=root --mysql-password-filename=mysql_password.gpg.asc \
#             --gpg-passphrase --gpg-key-id=CA0E93A2 

.PHONY: run-sp

#### run-sp is the same as run-s, except that the "pull request" thread is started.
#### LDF 2014.01.31.

# "update gwirdcli.Pull_Paths set checksum_sha224 = 'xxx' " \
# "where pull_path_id in (1, 2); " \
#

run-sp: gwirdsif$(EXEEXT) gwirdcli$(EXEEXT) 
	echo "update Pull_Requests set latest_pull = timestampadd(second, -86500, now()) " \
             "where pull_request_id = 1; " \
             "update gwirdcli.Pull_Responses set latest_pull = timestampadd(second, -86500, now()) " \
             "where pull_response_id = 1" | mysql --user=root --password=root gwirdsif
	env HOSTNAME=`hostname` \
           ./$< --purge-logs-interval=0 --save-temp-files \
            --sleep-server-enable --sleep-client-enable --end-server-enable \
            --irods-server-directory /home/lfinsto/iRODS \
            --config-dir /home/lfinsto/irods_proj/irods_master/Finston/gwrdifpk/src \
            --purge-database-interval=0 --purge-database-limit=604800 \
            --purge-irods-archive-interval=0 --purge-irods-archive-limit=5 \
            --purge-dc-metadata-interval=0 --purge-dc-metadata-limit=5 \
            --gpg-key-id=C3482EF6 \
            --mysql-username=root --mysql-password-filename=mysql_password_no_passphrase.gpg.asc \
            --pull-request-interval=5


# --save-temp-files

# run-sp: gwirdsif$(EXEEXT) gwirdcli$(EXEEXT) 
# 	env HOSTNAME=`hostname` \
#            ./$< --save-temp-files \
#             --sleep-server-enable --sleep-client-enable --end-server-enable \
#             --irods-server-directory /home/lfinsto/irods_proj/irods_master/Finston/iRODS \
#             --config-dir /home/lfinsto/irods_proj/irods_master/Finston/gwrdifpk/src \
#             --purge-logs-interval=0 \
#             --purge-irods-archive-interval=0 --purge-irods-archive-limit=0 \
#             --purge-database-interval=10000 --purge-database-limit=0

# --purge-irods-archive-interval 0 
# --purge-database-interval=0 
# --purge-irods-archive-interval 10 --purge-irods-archive-limit 5

#### Run 'gwirdsif' and redirect standard output and error to files.
####
#### LDF 2013.04.18.

.PHONY: run-sr

## 2>> ~/.gwirdsif/gwirdsif.stderr 

run-sr: gwirdsif$(EXEEXT) 
	env HOSTNAME=`hostname` ./$< >> ~/.gwirdsif/gwirdsif.stdout 


.PHONY : run-sb

run-sb: gwirdsif$(EXEEXT) gwirdcli$(EXEEXT) 
	env HOSTNAME=`hostname` \
           ./$< --purge-logs-interval=0 \
            --sleep-server-enable --save-temp-files --sleep-client-enable --end-server-enable \
            --irods-server-directory /home/lfinsto/irods_proj/irods_master/Finston/iRODS \
            --config-dir /home/lfinsto/irods_proj/irods_master/Finston/gwrdifpk/src \
            --purge-database-interval 0 --purge-database-limit 604800 \
            --purge-irods-archive-interval 0 --purge-irods-archive-limit 0 --gpg-key-id=C3482EF6 \
            --mysql-username=root --mysql-password-filename=mysql_password_no_passphrase.gpg.asc \
            --bison-trace

# --flex-trace

.PHONY : run-st

run-st: gwirdsif$(EXEEXT) 
	env HOSTNAME=`hostname` ./$< --save-temp-files

.PHONY : run-i

run-i: gwirdsif$(EXEEXT) 
	env HOSTNAME=`hostname` ./$< 


.PHONY : run-ib

run-ib: gwirdsif$(EXEEXT) 
	env HOSTNAME=`hostname` ./$< --bison-trace


#### Run 'gwirdcli'

.PHONY : run-c

# --sleep-client-disable
# -echo "delete from gwirdcli.handles where handle = '12345/00001'" | mysql --user=root gwirdcli

run-c: gwirdcli$(EXEEXT)
	./$< --input-filename=test_input.txt 

.PHONY : run-dm

run-dm: gwirdcli$(EXEEXT)
	./$< --input-filename=dummy.txt

.PHONY : run-cs
run-cs: gwirdcli$(EXEEXT)
	./$< --input-filename=sleep.txt &
	./$< --input-filename=test_input.txt 

.PHONY : run-slp
run-slp: gwirdcli$(EXEEXT)
	./$< --input-filename=sleep.txt


#### *** (3) put

#### Use this rule to delete database items, etc., and 'put' 'abc.txt'.
#### LDF 2013.01.31.

.PHONY : run-put

# echo "delete from handles where handle like('12345/0%');" \
#      "update pid_counters set pid_counter = 0 where prefix = '12345'; " \
#    | mysql --user=root handlesystem_standalone

# "delete from Irods_Objects where irods_object_path = '/tempZone/home/lfinsto/abc.txt';" 
# "delete from Irods_Objects_Handles where irods_object_id > 0;"

# $(MAKE) run-d

run-put: gwirdcli$(EXEEXT)
	gpg --decrypt lfinsto.gpg.asc | ./$< `hostname --long` \
           --suppress-prompt \
           --cert-filename "lfinsto_cert.pem" --key-filename "lfinsto_key.pem" \
           --config-dir /home/lfinsto/irods_proj/irods_master/Finston/gwrdifpk/src \
           --input-filename=put_abc_txt.txt \
           --gpg-passphrase \
           --mysql-password-filename=gwirdcli_lfinsto_mysql_password_with_passphrase.gpg.asc



#### *** (3) rm

#### Use this rule to rm 'abc.txt'.
#### LDF 2013.08.07.

.PHONY : run-rm

run-rm: gwirdcli$(EXEEXT)
	./$< --input-filename=rm_abc_txt.txt `hostname --long` --cert-filename "lfinsto_cert.pem" \
           --key-filename "lfinsto_key.pem" 

#### *** (3) un (undelete)

.PHONY : run-un

run-un: gwirdcli$(EXEEXT)
	./$< --input-filename=undelete_abc_txt.txt `hostname --long` --cert-filename "lfinsto_cert.pem" \
           --key-filename "lfinsto_key.pem" 


#### *** (3) Use this rule to 'add metadata' for 'abc.txt' (without "putting" 'abc.txt' first) .
####         LDF 2013.01.31.

.PHONY : run-cm

run-cm: gwirdcli$(EXEEXT)
	-echo "delete from Irods_Objects where " \
             "irods_object_path like('/tempZone/home/lfinsto/metadata_sample_%.xml')" \
              | mysql --user=root --password="root" gwirdsif
	-env irodsEnvFile=/home/lfinsto/.irods/.irodsEnv.lfinsto \
             irodsAuthFileName=/home/lfinsto/.irods/.irodsA.lfinsto \
	   irm metadata_sample_1.xml metadata_sample_2.xml metadata_sample_3.xml metadata_sample_4.xml
	-echo -e "rmw -d abc.txt DC_METADATA_PID %\n" \
                 "rmw -d abc.txt DC_METADATA_IRODS_OBJECT_REF %\n" \
                 "rmw -d abc.txt DC_METADATA_IRODS_OBJECT_PID %" \
           | env irodsEnvFile=/home/lfinsto/.irods/.irodsEnv.lfinsto \
             irodsAuthFileName=/home/lfinsto/.irods/.irodsA.lfinsto \
             imeta 
	-echo "delete from Dublin_Core_Metadata where dublin_core_metadata_id > 0;" \
              "delete from Dublin_Core_Metadata_Sub where dublin_core_metadata_id > 0;" \
              "delete from Dublin_Core_Attributes;" \
              "delete from Irods_Objects " \
              "where irods_object_path like('/tempZone/home/lfinsto/metadata_sample_%.xml');" \
              "delete from Irods_Objects where irods_object_id > 2;" \
              "delete from Irods_Objects_Handles where irods_object_id > 2;" \
                   | mysql --user=root --password="root" gwirdsif
	-echo "delete from handles where handle = '12345/00002' " \
             "or handle = '12345/00003' or handle = '12345/00004' or handle = '12345/00005' " \
             "or handle = '12345/00006' or handle = '12345/00007' or handle = '12345/00008' " \
             "delete from handles where handle = '12345/00001' and type like('DC_METADATA_%');" \
             "update pid_counters set pid_counter = 1 where prefix = '12345'; " \
             | mysql --user=root --password="root" handlesystem_standalone
	./$< --input-filename=add_metadata_abc_txt.txt

#### I am not sure what this is for.  LDF 2013.05.24.

.PHONY: run-add

run-add: gwirdcli$(EXEEXT)
	-env irodsEnvFile=/home/lfinsto/.irods/.irodsEnv.lfinsto \
             irodsAuthFileName=/home/lfinsto/.irods/.irodsA.lfinsto \
             imeta rm -d abc.txt DC_METADATA_PID 12345/00004
	-echo "delete from handles where handle = '12345/00004' " \
             | mysql --user=root --password="root" handlesystem_standalone
	-echo "delete from Dublin_Core_Metadata where dublin_core_metadata_id > 1;" \
             "delete from Dublin_Core_Metadata_Sub where dublin_core_metadata_id > 1;" \
             "delete from Dublin_Core_Attributes where dublin_core_metadata_id > 1;" \
             "delete from Irods_Objects " \
             "where irods_object_path = '/tempZone/home/lfinsto/metadata_sample_2.xml';" \
             | mysql --user=root --password="root" gwirdsif
	./$< --input-filename=add_metadata_abc_txt.txt

.PHONY : run-cq

run-cq: gwirdcli$(EXEEXT)
	./$< --input-filename test_input.txt 2>/dev/null

.PHONY : run-cb

run-cb: gwirdcli$(EXEEXT)
	./$< --bison-trace --flex-trace --input-filename test_input.txt


#### Remote connection with authentication/authorization using X.509 certificates
#### LDF 2013.05.08.

.PHONY : run-g

# --sleep-client-enable
# --scanner-trace
# --scanner-trace --parser-trace
# --commands "whoami"
# --no-terminate 
# --save-temp-files 

# $(MAKE) run-d

##### This rule is for running `gwirdcli' without having to type in a passphrase 
##### or pass it to the program via a pipe.
##### Without the option
##### --mysql-password-filename=gwirdcli_lfinsto_mysql_password_no_passphrase.gpg.asc
##### 'gwirdcli' would use the default encrypted MySQL password file, which 
##### is currently 'mysql_password.gpg.asc'.  The keypair used to encrypt this file 
##### has a passphrase.
##### 
##### LDF 2013.10.04.

run-g: gwirdcli$(EXEEXT)
	./$< `hostname --long` \
           --cert-filename "lfinsto_cert.pem" --key-filename "lfinsto_key.pem" \
           --config-dir /home/lfinsto/irods_proj/irods_master/Finston/gwrdifpk/src \
           --input-filename=test_input.txt \
           --mysql-password-filename=gwirdcli_lfinsto_mysql_password_no_passphrase.gpg.asc

.PHONY : run-gj

# --sleep-client-enable
# --scanner-trace
# --scanner-trace --parser-trace
# --commands "whoami"
# --no-terminate 
# --save-temp-files 

# $(MAKE) run-d

#### If the passphrase is passed to 'gwirdcli' via a pipe,
#### the option --suppress-prompt should be used.
#### Otherwise, the user will be prompted for the passphrase.
#### In this case, typing <RETURN> will get rid of the prompt and
#### cause no other ill effects.  However, it's less confusing if 
#### it's simply suppressed. 
####
#### LDF 2013.10.04.

run-gj: gwirdcli$(EXEEXT)
	echo "lfinsto" | ./$< `hostname --long` --suppress-prompt \
           --cert-filename "jdoe_cert.pem"  --key-filename "jdoe_key.pem" \
           --config-dir /home/lfinsto/irods_proj/irods_master/Finston/gwrdifpk/src \
           --input-filename=test_input.txt \
           --gpg-passphrase --mysql-username jdoe \
           --mysql-password-filename=gwirdcli_jdoe_mysql_password_with_passphrase.gpg.asc



#### 'gwirdcli_lfinsto_mysql_password_with_passphrase.gpg.asc'
#### was encrypted with key CA0E93A2:
####
#### user: "lfinsto (gwrdifpk) (Laurence Finston) <noone@nowhere.de>"
#### 2048-bit RSA key, ID 4C30EEFB, created 2013-09-20 (main key ID CA0E93A2)

.PHONY: run-gd

# --bison-trace --flex-trace 
# --save-temp-files 
# $(MAKE) run-d

# irm def.txt

# iput -f abc.txt

# --gpg-homedir=/home/lfinsto/irods_proj/irods_master/Finston/gwrdifpk/src/.gnupg_gwirdcli 

# -iget -f abc.txt.gpg  
# -iget -f abc.txt.gpg.sig
# -gpg --verify abc.txt.gpg.sig abc.txt.gpg

# -echo "delete from gwirdsif.GPG_Key_Pairs where gpg_key_pair_id = 1" | 
# mysql --user=root --password=root gwirdsif

# --cert-filename "lfinsto_cert.pem" --key-filename "lfinsto_key.pem" 
# --cert-filename "jsmith_cert.pem" --key-filename "jsmith_key.pem"

#"delete from Pull_Responses where pull_response_id > 0;" \
#	echo "delete from Pull_Paths where pull_path_id > 0;" \
#       | mysql --user=root --password=root gwirdcli 

# --read-client-command-file="client_commands.txt"

run-gd: gwirdcli$(EXEEXT)
	gpg --decrypt lfinsto.gpg.asc | ./$< `hostname --long` \
           --suppress-prompt --save-temp-files \
           --config-dir /home/lfinsto/irods_proj/irods_master/Finston/gwrdifpk/src \
           --input-filename=test_input.txt \
           --cert-filename "lfinsto_cert.pem" --key-filename "lfinsto_key.pem" \
           --gpg-passphrase \
           --gpg-homedir=/home/lfinsto/irods_proj/irods_master/Finston/gwrdifpk/src/.gnupg_gwirdcli \
           --mysql-password-filename=gwirdcli_lfinsto_mysql_password_with_passphrase.gpg.asc \
           --read-client-command-file="client_commands.txt"

.PHONY: run-gp

# --bison-trace --flex-trace 
# --save-temp-files 


run-gp: gwirdcli$(EXEEXT)
	gpg --decrypt lfinsto.gpg.asc | ./$< `hostname --long` \
           --suppress-prompt --save-temp-files \
           --cert-filename "lfinsto_cert.pem" --key-filename "lfinsto_key.pem" \
           --config-dir /home/lfinsto/irods_proj/irods_master/Finston/gwrdifpk/src \
           --input-filename=test_input.txt \
           --gpg-passphrase \
           --gpg-homedir=/home/lfinsto/irods_proj/irods_master/Finston/gwrdifpk/src/.gnupg_gwirdcli \
           --mysql-password-filename=gwirdcli_lfinsto_mysql_password_with_passphrase.gpg.asc \
           --x509-port 5558


## echo "put abc.txt" | gwirdcli pcfinston.gwdg.de --cert-filename "lfinsto_cert.pem" 
##   --key-filename "lfinsto_key.pem" --config-dir /home/lfinsto/irods_proj/irods_master/Finston/gwrdifpk/src 

## echo "get handle pid 12345/00001" | gwirdcli pcfinston.gwdg.de --cert-filename "lfinsto_cert.pem" 
##   --key-filename "lfinsto_key.pem" --config-dir /home/lfinsto/irods_proj/irods_master/Finston/gwrdifpk/src 

.PHONY : run-gc

# --commands "whoami"

run-gc: gwirdcli$(EXEEXT)
	./$< `hostname --long` --cert-filename "lfinsto_cert.pem" \
           --key-filename "lfinsto_key.pem" --save-temp-files --sleep-client-enable \
           --no-terminate 


.PHONY : run-ga

run-ga: gwirdcli$(EXEEXT)
	./$< --input-filename=test_input.txt --anonymous `hostname --long`


.PHONY : run-gx

run-gx: gwirdcli$(EXEEXT)
	./$< --input-filename=test_input.txt `hostname --long` --cert-filename "lfinsto_expired_cert.pem" \
        --key-filename "lfinsto_expired_key.pem"


.PHONY : run-gq

run-gq: gwirdcli$(EXEEXT)
	./$< --input-filename test_input.txt `hostname --long` # --anonymous 2>/dev/null

.PHONY : run-gb

run-gb: gwirdcli$(EXEEXT)
	./$< --input-filename=test_input.txt `hostname --long` --cert-filename "lfinsto_cert.pem" \
        --key-filename "lfinsto_key.pem" --sleep-client-enable --bison-trace --flex-trace


.PHONY : run-w

# $(MAKE) install-gwrdwbap

# --cookie cookies_send.txt

#### --X, -request <command>:  curl options for sending other requests to web application.  
####                           LDF 2012.07.25.


#### *** (3) Sending requests to 'gwrdwbap' via curl

#### Currently, the contents of only one file should be sent as POST data and
#### without a variable name.  See '00INFO' in this directory 
#### for more information about this issue.
#### LDF 2012.07.27.

CURL_ARGS =  --dump-header header_dump.txt \
             --include \
             --data-urlencode @test_input.txt \
             --insecure --cert /home/lfinsto/usercert.pem \
             --key /home/lfinsto/userkey.pem https://pcfinston.gwdg.de/fcgi-bin/gwrdwbap$(EXEEXT).fcgi


#### **** (4) run-w:  Send cookies.  

#### LDF 2012.07.23.

run-w: 
	curl --cookie cookies_send.txt --cookie-jar cookies_save.txt $(CURL_ARGS)
             
.PHONY : run-x

#### **** (4) run-x:  Don't send cookies.

#### LDF 2012.07.23.

### commands@test_input.txt

run-x: 
	curl --cookie-jar cookies_save.txt $(CURL_ARGS)


#### **** (4) run-ww:  Call curl twice, first acquiring a cookie and then sending it back.
####                   This tests the use of the session ID cookie.

#### First, 'curl' is called without sending any cookies.  This causes 'gwrdwbap$(EXEEXT).fcgi'
#### to generate a cookie containing a "session ID" and send it back to 'curl'.  'curl'
#### stores the cookie (and any others) in 'cookies_save.txt'.
#### Then, this file is renamed to 'cookies_send.txt' and 'curl' is called again,
#### this time sending the cookie.  The cookies returned are again saved in 'cookies_save.txt'.
####
#### LDF 2012.07.23.

.PHONY: run-ww

run-ww:
	curl --cookie-jar cookies_save.txt $(CURL_ARGS)
	mv cookies_save.txt cookies_send.txt
	curl --cookie cookies_send.txt --cookie-jar cookies_save.txt $(CURL_ARGS)


.PHONY : prog

prog: $(bin_PROGRAMS)

.PHONY : gprg

gprg: gwirdcli$(EXEEXT) gwirdsif$(EXEEXT) 

#### *** (3) Test libxml

# -I/usr/include/libxml2  #### Does not need to be specified, since it is in the search path
                          #### for header files.
                          #### LDF 2012.12.14.

.PHONY : run-l1


run-l1: test_libxml_1 story.xml
	test_libxml_1 story.xml


test_libxml_1: test_libxml_1.o
	$(CXXLINK) -o $@  -lxml2 -lz -lm $<

test_libxml_1.o: test_libxml_1.c
	$(CXXCOMPILE) -c -o $@  -lxml2 -lz -lm $<


.PHONY : run-l2

run-l2: test_libxml_2 story.xml
	test_libxml_2 story.xml


test_libxml_2: test_libxml_2.o
	$(CXXLINK) -o $@  -lxml2 -lz -lm $<

test_libxml_2.o: test_libxml_2.c
	$(CXXCOMPILE) -c -o $@  -lxml2 -lz -lm $<

.PHONY : run-l3

run-l3: test_libxml_3 metadata_sample_1.xml
	test_libxml_3 metadata_sample_1.xml

test_libxml_3: test_libxml_3.o
	$(CXXLINK) -o $@  -lxml2 -lz -lm $<

test_libxml_3.o: test_libxml_3.c++
	$(CXXCOMPILE) -c -o $@  -lxml2 -lz -lm $<


#### *** (3) Delete data from database

#### Delete "Dublin Core" and "Irods_Objects" entries from from database 'gwirdsif' 
#### and "handle" entries from 'handlesystem_standalone' where 'handle' is like '12345/0%'.
#### Delete from "Irods_Objects" and "Irods_Objects_Handles"
#### Reset 'handlesystem_standalone.pid_counters.pid_counter' to 0 where prefix = '12345'.
#### 
#### LDF 2012.12.21.

.PHONY : run-d

run-d: 
	-env irodsEnvFile=/home/lfinsto/.irods/.irodsEnv.lfinsto \
             irodsAuthFileName=/home/lfinsto/.irods/.irodsA.lfinsto \
            irm -f abc.txt abc.txt abc.txt.gpg abc.txt.gpg.sig abc.txt.gpg.asc.sig \
                   abc.txt.asc abc.txt.bz2 abc.txt.gz def.txt def.bz2 def.gz \
                   def.txt.gpg def.txt.gpg.sig def.tar.gz def.tar.bz2 \
                   def.tar.gz.gpg def.tar.gz.asc def.tar.gz.gpg.sig \
                   ghi.txt ghi.txt.gpg ghi.txt.asc ghi.txt.gpg.gz ghi.txt.gpg.bz2 \
                   ghi.txt.gz ghi.txt.bz2 \
                   jkl.txt jkl.txt.gpg jkl.txt.asc jkl.txt.gpg.gz jkl.txt.gpg.bz2 \
                   jkl.txt.gz jkl.txt.bz2 \
                   metadata_sample_1.xml metadata_sample_2.xml metadata_sample_3.xml \
                xxx/abc.txt xxx/yyy/abc.txt aaaa/abc.txt subdir_1/abc.txt
	echo "delete from Dublin_Core_Metadata where dublin_core_metadata_id > 0;" \
        "delete from Irods_Objects_Dublin_Core_Metadata where irods_object_id > 0 " \
        "or dublin_core_metadata_id > 0;" \
	"delete from Dublin_Core_Metadata_Sub where dublin_core_metadata_id > 0;" \
	"delete from Dublin_Core_Attributes;" \
        "delete from Irods_Objects where irods_object_id > 0;" \
        "delete from Irods_AVUs where irods_avu_id > 0;" \
        "delete from Irods_Objects_Handles where irods_object_id > 0" \
        | mysql --user=root gwirdsif --password="root" 
	echo "delete from handles where handle like('12345/0%');" \
             "delete from handles where handle like('00001/0%');" \
             "delete from handles where handle = '12345/11111';" \
             "update pid_counters set pid_counter = 0 where prefix = '12345' or prefix = '00001'" \
           | mysql --user=root --password="root" handlesystem_standalone


### *** (3) Get metadata

.PHONY : run-gm

run-gm: gwirdcli$(EXEEXT)
	./$< --input-filename get_metadata_abc_txt.txt


### *** (3) Get handles

.PHONY : run-gh

run-gh: gwirdcli$(EXEEXT)
	./$< --input-filename get_handles.txt 

#### *** (3) Show data from database

#### **** (4) Show handles

.PHONY: show-h

# ttl_type, ttl, timestamp, from_unixtime(timestamp),
# refs, admin_read, admin_write, pub_read, pub_write,  
# created, last_modified,  
# created_by_user_id, 

show-h:
	echo "select handle, idx, type, data, irods_object_id, handle_id, handle_value_id, " \
             "marked_for_deletion " \
             "from handles " \
             "where type <> 'HS_ADMIN' and handle like('12345/0____') order by handle, idx\G" \
             "select prefix, pid_counter from pid_counters" | \
           mysql --user=root --password=root handlesystem_standalone

#### **** (4) Show metadata

#### ***** (5) Dublin_Core_Metadata table entries only

.PHONY: show-m

show-m:
	echo "select * from Dublin_Core_Metadata where dublin_core_metadata_id > 0 " \
             "order by dublin_core_metadata_id\G" | \
           mysql --user=root --password=root gwirdsif 

#### ***** (5) Dublin_Core_Metadata and Dublin_Core_Metadata_Sub table entries

.PHONY: show-ms

show-ms:
	echo "select * from Dublin_Core_Metadata as DC, Dublin_Core_Metadata_Sub as DCS" \
             "where DC.dublin_core_metadata_id > 0 and DCS.dublin_core_metadata_id > 0 " \
             "and DCS.dublin_core_metadata_sub_id > 0 " \
             "order by DC.dublin_core_metadata_id, DCS.dublin_core_metadata_sub_id\G" | \
           mysql --user=root --password=root gwirdsif

#### ***** (5) 

#### **** (4) Show iRODS objects

#### (5) AVUs

.PHONY: show-a

show-a:
	echo "select IA.irods_object_id, IO.user_id, U.username, " \
	     "IO.irods_server_id, ISRV.irods_server_name, IO.irods_object_path, " \
	     "IO.marked_for_deletion_from_archive, " \
             "IO.deleted_from_archive, " \
	     "IO.delete_from_archive_timestamp, " \
	     "IO.marked_for_deletion_from_gwirdsif_db, " \
	     "IO.delete_from_gwirdsif_db_timestamp, " \
	     "IO.created, IO.last_modified, " \
             "IA.irods_avu_id, IA.attribute, IA.value, " \
             "IA.units, IA.time_set " \
             "from Irods_AVUs as IA, Irods_Objects as IO, Irods_Servers as ISRV, Users as U " \
             "where IA.irods_avu_id > 0 and IA.irods_object_id > 0 " \
             "and IA.irods_object_id = IO.irods_object_id " \
             "and IO.user_id = U.user_id " \
             "and IO.irods_server_id = ISRV.irods_server_id " \
             "order by irods_object_id, irods_avu_id\G" | \
             mysql --user=root --password=root gwirdsif

#### (5) Irods_Objects

.PHONY: show-i

show-i:
	echo "select * from Irods_Objects where irods_object_id > 0 order by irods_object_id\G" | \
           mysql --user=root --password=root gwirdsif


#### **** (4) Show metadata (AVUs)

.PHONY: show-md

# @echo ""
# env irodsEnvFile=/home/lfinsto/.irods/.irodsEnv.lfinsto 
#      irodsAuthFileName=/home/lfinsto/.irods/.irodsA.lfinsto 
#   imeta ls -d metadata_sample_1.xml

show-md:
	-env irodsEnvFile=/home/lfinsto/.irods/.irodsEnv.lfinsto \
             irodsAuthFileName=/home/lfinsto/.irods/.irodsA.lfinsto \
          echo -e "ls -d abc.txt\nls -d def.tar.gz\nls -d def.tar.gz.gpg\n" \
                  "ls -d metadata_sample_1.xml" \
          | imeta 

.PHONY show-av:

show-av:
	bash show_irods_avus.sh

#### **** (4) Show all

.PHONY: show-all

show-all:
	$(MAKE) show-h
	$(MAKE) show-m
	$(MAKE) show-ms
	$(MAKE) show-a
	$(MAKE) show-i
	$(MAKE) show-md

#### *** (3) CWEB documentation

.PHONY : pdf ps dvi tex

tex: optpsgwv.tex gwrdifpk.tex scnprswv.tex gwrdwbcw.tex stpdbcwv.tex gwrdcw01.tex gwrdcw02.tex
dvi: optpsgwv.dvi gwrdifpk.dvi scnprswv.dvi gwrdwbcw.dvi stpdbcwv.dvi gwrdcw01.dvi gwrdcw02.dvi
ps:  optpsgwv.ps gwrdifpk.ps scnprswv.ps gwrdwbcw.ps stpdbcwv.ps gwrdcw01.ps gwrdcw02.ps
pdf: optpsgwv.pdf gwrdifpk.pdf scnprswv.pdf gwrdwbcw.pdf stpdbcwv.pdf gwrdcw01.pdf gwrdcw02.pdf

#### This can be used to extract the last page, containing the table of contents,
#### from one of the PDF files.  Please note that this only works if
#### the table of contents doesn't extend over more than one page.
####
#### !! TODO:  The rule for creating 'combined.pdf' could be refined!
####
#### LDF 2013.10.02.
####
#### pdftk A=gwrdifpk.pdf cat Aend output ttemp.pdf

combined.pdf: gwrdifpk.pdf scnprswv.pdf gwrdwbcw.pdf stpdbcwv.pdf optpsgwv.pdf 
	if test $(HAVE_PDFTK) -eq 1; then pdftk $^ output $@; else touch $@;fi

optpsgwv.pdf: optpsgwv.ps
	@echo "Running \`ps2pdf'"
	ps2pdf $<

optpsgwv.ps: optpsgwv.dvi
	dvips $<

optpsgwv.dvi optpsgwv.log: optpsgwv.tex cwebmac.tex 
	tex $<

optpsgwv.tex: optpsgwv.web $(optpsgen_SOURCES) 
	cweave $<

gwrdcw01.pdf: gwrdcw01.ps
	ps2pdf gwrdcw01.ps gwrdcw01.pdf 2>/dev/null

gwrdcw01.ps: gwrdcw01.dvi
	dvips -o gwrdcw01.ps gwrdcw01.dvi

gwrdcw01.dvi: gwrdcw01.tex
	tex gwrdcw01.tex

gwrdcw01.tex: gwrdcw01.web cwebmac.tex $(gwirdsif_SOURCES) $(gwirdcli_SOURCES) \
                                       $(gwrdwbap_SOURCES) $(genpids_SOURCES) $(gwrdifpk_CWEB_files) \
                                       $(gwrdsrlb_CWEB_files) $(gwrdcllb_CWEB_files) $(setupdbs_SOURCES)
	cweave gwrdcw01.web 

gwrdcw02.pdf: gwrdcw02.ps
	ps2pdf gwrdcw02.ps gwrdcw02.pdf 2>/dev/null

gwrdcw02.ps: gwrdcw02.dvi
	dvips -o gwrdcw02.ps gwrdcw02.dvi

gwrdcw02.dvi: gwrdcw02.tex
	tex gwrdcw02.tex

gwrdcw02.tex: gwrdcw02.web cwebmac.tex $(gwirdsif_SOURCES) $(gwirdcli_SOURCES) \
                                       $(gwrdwbap_SOURCES) $(genpids_SOURCES) $(gwrdifpk_CWEB_files) \
                                       $(gwrdsrlb_CWEB_files) $(gwrdcllb_CWEB_files) $(setupdbs_SOURCES)
	cweave gwrdcw02.web 


gwrdifpk.pdf: gwrdifpk.ps
	ps2pdf gwrdifpk.ps gwrdifpk.pdf 2>/dev/null

gwrdifpk.ps: gwrdifpk.dvi
	dvips -o gwrdifpk.ps gwrdifpk.dvi

gwrdifpk.dvi: gwrdifpk.tex
	tex gwrdifpk.tex

gwrdifpk.tex: gwrdifpk.web cwebmac.tex $(gwirdsif_SOURCES) $(gwirdcli_SOURCES) \
                                       $(gwrdwbap_SOURCES) $(genpids_SOURCES) $(gwrdifpk_CWEB_files) \
                                       $(gwrdsrlb_CWEB_files) $(gwrdcllb_CWEB_files) $(setupdbs_SOURCES)
	cweave gwrdifpk.web 


stpdbcwv.pdf: stpdbcwv.ps
	ps2pdf stpdbcwv.ps stpdbcwv.pdf 2>/dev/null

stpdbcwv.ps: stpdbcwv.dvi
	dvips -o stpdbcwv.ps stpdbcwv.dvi

stpdbcwv.dvi: stpdbcwv.tex
	tex stpdbcwv.tex

stpdbcwv.tex: $(setupdbs_SOURCES)
	cweave stpdbcwv.web

scnprswv.pdf: scnprswv.ps
	ps2pdf scnprswv.ps scnprswv.pdf 2>/dev/null

scnprswv.ps: scnprswv.dvi
	dvips -o scnprswv.ps scnprswv.dvi

scnprswv.dvi: scnprswv.tex
	tex scnprswv.tex

scnprswv.tex: scnprswv.web cwebmac.tex parser.web prsrclnt.web scanner.web scnrclnt.web
	cweave scnprswv.web 


gwrdwbcw.pdf: gwrdwbcw.ps
	ps2pdf gwrdwbcw.ps gwrdwbcw.pdf 2>/dev/null

gwrdwbcw.ps: gwrdwbcw.dvi
	dvips -o gwrdwbcw.ps gwrdwbcw.dvi

gwrdwbcw.dvi: gwrdwbcw.tex
	tex gwrdwbcw.tex

gwrdwbcw.tex: gwrdwbcw.web cwebmac.tex parser.web prsrclnt.web scanner.web scnrclnt.web
	cweave gwrdwbcw.web 


#### *** (3) setupdbs

setupdbs$(EXEEXT): $(setupdbs_object_files) $(setupdbs_LDADD)
	@echo "Linking \`setupdbs$(EXEEXT)'"
	/bin/sh ../libtool --tag=CXX   --mode=link g++ \
           $(LDFLAGS) \
           -o $@ -rpath $(bindir) $(setupdbs_object_files) $(setupdbs_LDADD) $(LIBS)

setupdbs.o: setupdbs.c++ stparobj.h++ stpclopt.h++ stpcdsif.h++ stpcdcli.h++ stpcdhdl.h++ stpcrdbs.h++ \
            stpdblcr.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ excptntp.h++ glblcnst.h++ \
            glblvrbl.h++ grouptp.h++ helper.h++ hndltype.h++ hndlvltp.h++ \
            irdsavtp.h++ irdsobtp.h++ parser.h++ pidfncs.h++ pullrqtp.h++ rspercds.h++ \
            rspnstp.h++ scanner.h++ scprpmtp.h++ tanfncs.h++ usrinftp.h++ \
            utilfncs.h++ x509cert.h++ 
	$(CXXCOMPILE) -c -o $@ $<

stpclopt.o: stpclopt.c++ stpclopt.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ excptntp.h++ glblcnst.h++ \
            glblvrbl.h++ grouptp.h++ helper.h++ hndltype.h++ hndlvltp.h++ \
            irdsavtp.h++ irdsobtp.h++ parser.h++ pidfncs.h++ pullrqtp.h++ rspercds.h++ \
            rspnstp.h++ scanner.h++ scprpmtp.h++ tanfncs.h++ usrinftp.h++ \
            utilfncs.h++ x509cert.h++ 
	$(CXXCOMPILE) -c -o $@ $<

stpcdsif.o: stpcdsif.c++ stpcdsif.h++ stpclopt.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ excptntp.h++ \
            glblcnst.h++ glblvrbl.h++ grouptp.h++ helper.h++ hndltype.h++ hndlvltp.h++ \
            irdsavtp.h++ irdsobtp.h++ parser.h++ pidfncs.h++ pullrqtp.h++ rspercds.h++ \
            rspnstp.h++ scanner.h++ scprpmtp.h++ tanfncs.h++ usrinftp.h++ \
            utilfncs.h++ x509cert.h++ 
	$(CXXCOMPILE) -c -o $@ $<

stparobj.o: stparobj.c++ stparobj.h++ stpclopt.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ excptntp.h++ \
            glblcnst.h++ glblvrbl.h++ grouptp.h++ helper.h++ hndltype.h++ hndlvltp.h++ \
            irdsavtp.h++ irdsobtp.h++ parser.h++ pidfncs.h++ pullrqtp.h++ rspercds.h++ \
            rspnstp.h++ scanner.h++ scprpmtp.h++ tanfncs.h++ usrinftp.h++ \
            utilfncs.h++ x509cert.h++ 
	$(CXXCOMPILE) -c -o $@ $<


stpcdcli.o: stpcdcli.c++ stpcdcli.h++ stpclopt.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ excptntp.h++ \
            glblcnst.h++ glblvrbl.h++ grouptp.h++ helper.h++ hndltype.h++ hndlvltp.h++ \
            irdsavtp.h++ irdsobtp.h++ parser.h++ pidfncs.h++ pullrqtp.h++ rspercds.h++ \
            rspnstp.h++ scanner.h++ scprpmtp.h++ tanfncs.h++ usrinftp.h++ \
            utilfncs.h++ x509cert.h++ 
	$(CXXCOMPILE) -c -o $@ $<

stpcdhdl.o: stpcdhdl.c++ stpcdhdl.h++ stpclopt.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ excptntp.h++ \
            glblcnst.h++ glblvrbl.h++ grouptp.h++ helper.h++ hndltype.h++ hndlvltp.h++ \
            irdsavtp.h++ irdsobtp.h++ parser.h++ pidfncs.h++ pullrqtp.h++ rspercds.h++ \
            rspnstp.h++ scanner.h++ scprpmtp.h++ tanfncs.h++ usrinftp.h++ \
            utilfncs.h++ x509cert.h++ 
	$(CXXCOMPILE) -c -o $@ $<

stpdblcr.o: stpdblcr.c++ stpdblcr.h++ stpclopt.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ excptntp.h++ \
            glblcnst.h++ glblvrbl.h++ grouptp.h++ helper.h++ hndltype.h++ hndlvltp.h++ \
            irdsavtp.h++ irdsobtp.h++ parser.h++ pidfncs.h++ pullrqtp.h++ rspercds.h++ \
            rspnstp.h++ scanner.h++ scprpmtp.h++ tanfncs.h++ usrinftp.h++ \
            utilfncs.h++ x509cert.h++ 
	$(CXXCOMPILE) -c -o $@ $<


stpcrdbs.o: stpcrdbs.c++ stpcrdbs.h++ stpclopt.h++ dcmdsbtp.h++ dcmtdttp.h++ dstngnmt.h++ excptntp.h++ \
            glblcnst.h++ glblvrbl.h++ grouptp.h++ helper.h++ hndltype.h++ hndlvltp.h++ \
            irdsavtp.h++ irdsobtp.h++ parser.h++ pidfncs.h++ pullrqtp.h++ rspercds.h++ \
            rspnstp.h++ scanner.h++ scprpmtp.h++ tanfncs.h++ usrinftp.h++ \
            utilfncs.h++ x509cert.h++ 
	$(CXXCOMPILE) -c -o $@ $<

#### ** (2)

.PHONY: run-sdb

# --gwirdsif-database-name YYY --gwirdcli-database-name ZZZ
# 

#### *** (3) run-sdb ("Set up databases, do not drop")

run-sdb: setupdbs$(EXEEXT)
	./$< --handles-database-name XXX --server-database-name YYY \
             --client-database-name ZZZ --prefix 12345 --prefix 66666 \
             --institute "YYYY:GWDG Test Institute 1" \
             --institute "ZZZZ:GWDG Test Institute 2" \
             --admin lfinsto --user jdoe --user jsmith \
             --group test_group_1 test_group_2

# --prefix 00001 --prefix 66666

#### *** (3) run-sdbd ("Set up databases, drop")

# show_db_tables.sh YYY

# --prefix 12345 
# --no-standalone
# echo "select * from nas" | mysql --user=root XXX

run-sdbd: setupdbs$(EXEEXT)
	./$< --drop --handles-database-name XXX --server-database-name YYY \
             --client-database-name ZZZ \
             --institute "YYYY:GWDG Test Institute 1" \
             --institute "ZZZZ:GWDG Test Institute 2" \
             --admin lfinsto --user jdoe --user jsmith --prefix 12345 --prefix 66666 \
             --group test_group_1 --group test_group_2 
	@show_db_tables.sh ZZZ


.PHONY: purge-sdb

purge-sdb:
	rm -rf setupdbs.c setupdbs.c++ setupdbs.o stpcdcli.c stpcdcli.c++ stpcdcli.h \
               stpcdcli.h++ stpcdcli.o \
               stpcdhdl.c stpcdhdl.c++ stpcdhdl.h stpcdhdl.h++ stpcdhdl.o \
               stpdblcr.c stpdblcr.c++ stpdblcr.h stpdblcr.h++ stpdblcr.o \
               stpcdsif.c stpcdsif.c++ stpcdsif.h stpcdsif.h++ stpcdsif.o \
               stparobj.c stparobj.c++ stparobj.h stparobj.h++ stparobj.o \
               stpclopt.c stpclopt.c++ stpclopt.h stpclopt.h++ stpclopt.o stpcrdbs.c \
               stpcrdbs.c++ stpcrdbs.h stpcrdbs.h++ stpcrdbs.o stpdbcwv.c stpdbcwv.c++ \
               stpdbcwv.h stpdbcwv.h++ stpdbcwv.o

#### ** (2) listing

.PHONY: run-l

run-l: listing.pdf

listing.pdf: listing.ps
	ps2pdf $< $@

listing.ps: listing.dvi
	dvips -o $@ $<

listing.dvi: listing.tex
	tex $<

#### *** (3) cweave_test

.PHONY: cwt

cwt: cweave_test.dvi

cweave_test.pdf: cweave_test.ps
	ps2pdf $<

cweave_test.ps: cweave_test.dvi
	dvips $<

cweave_test.dvi: cweave_test.tex
	tex $<

cweave_test.tex: cweave_test.web
	cweave $<


#### *** (3) tags

# clean-local:
# 	rm -f $(CLEANFILES)

.PHONY: tags

tags: $(contact_SOURCES) $(gentans_SOURCES) $(genpids_SOURCES) $(gwirdsif_SOURCES) $(gwirdcli_SOURCES) \
      $(gwrdwbap_SOURCES) $(gwrdifpk_CWEB_files) $(gwrdcllb_CWEB_files) $(gwrdsrlb_CWEB_files) \
      $(setupdbs_SOURCES)
	etags $^

ttest: ttest.o
	g++ -o ttest ttest.o -lm -pthread

ttest.o: ttest.cxx
	g++ -c -o ttest.o ttest.cxx

.PHONY: run-t

run-t: ttest
	./ttest


#### *** (3) purge


.PHONY: purge

purge: 
	rm -rf $(PURGE_FILES)



#### *** (3) sig_test

.PHONY: run-sig

run-sig: sig_test$(EXEEXT)
	sig_test

sig_test$(EXEEXT): $(sig_test_obj_files)
	$(CXX) -o $@ $^ -pthread 

sig_test.o: sig_test.c++
	$(CXX) -c -o $@ $< -lm -pthread 

#### *** (3) query

.PHONY: query

query: 
	@echo "CXXCOMPILE == $(CXXCOMPILE)"
	@echo "CXXLINK == $(CXXLINK)"
# echo "BUFFER_SIZE == $(BUFFER_SIZE)"
# @echo "HAVE_PDFTK == $(HAVE_PDFTK)"
# @echo "LIBS == $(LIBS)"
# @echo "LDFLAGS == $(LDFLAGS)"
# @echo "libdir == $(libdir)"
# @echo "gwrdwbap_object_files == $(gwrdwbap_object_files)"
# @echo "gwrdwbap_SOURCES == $(gwrdwbap_SOURCES)"
# @echo "gwrdwbap_LDADD == $(gwrdwbap_LDADD)"
# @echo "gwrdwbap_obj_files == $(gwrdwbap_obj_files)"
#	@echo "lib_LTLIBRARIES == $(lib_LTLIBRARIES)"
#	@echo "gwirdsif_LDADD == $(gwirdsif_LDADD)"
#	@echo "libgwrdifpk_la_SOURCES == $(libgwrdifpk_la_SOURCES)"
#	@echo "gwrdifpk_cpp_files == $(gwrdifpk_cpp_files)"
#	@echo "LIBS == $(LIBS)"
#	@echo "LDFLAGS == $(LDFLAGS)"
#	@echo "bindir == $(bindir)"
#	@echo "LEX == $(LEX)"
#	@echo "AM_CFLAGS == $(AM_CFLAGS)"
#	@echo "AM_LDFLAGS == $(AM_LDFLAGS)"
#	@echo "CLEANFILES == $(CLEANFILES)"
#	@echo "HOSTNAME == $(HOSTNAME)"
#	@echo "Result of calling \`hostname':"
#	@hostname        
#	@echo "gwdirdsif_OBJECTS == $(gwdirdsif_OBJECTS)"
#	@echo "INSTALL_GWRDWBAP_COMMAND == $(INSTALL_GWRDWBAP_COMMAND)"
#	@echo "SOURCEDIR == $(SOURCEDIR)"
#       @echo "CXXCOMPILE == $(CXXCOMPILE)"
#	@echo "CXXLINK == $(CXXLINK)"
#	@echo "LIBS == $(LIBS)"
#	@echo "LD_LIBRARY_PATH == $(LD_LIBRARY_PATH)"
#	@echo "INSTALL_GWRDWBAP_COMMAND == $(INSTALL_GWRDWBAP_COMMAND)"
#	@echo "SOURCEDIR == $(SOURCEDIR)"
#	@echo "CXXCOMPILE == $(CXXCOMPILE)"
#	@echo "CXXLINK == $(CXXLINK)"
#	@echo "LIBS == $(LIBS)"
#	@echo "LD_LIBRARY_PATH == $(LD_LIBRARY_PATH)"
#	@echo "CXX == $(CXX)"

#### ** (2) End of `[...]/gwrdifpk/src/Makefile.am'

#### * (1) Local variables for Emacs

#### Local Variables:
#### mode:Makefile
#### abbrev-mode:t
#### eval:(read-abbrev-file)
#### eval:(outline-minor-mode t)
#### outline-regexp:"#### [*\\f]+[ \\t]+([0-9]+)"
#### End:
