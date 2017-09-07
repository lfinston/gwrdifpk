;;;; autoloads_cweb.el
;;;; Created by Laurence D. Finston (LDF).

;;;; * (1) Copyright and License.

;;;; This file is part of GNU 3DLDF, a package for three-dimensional drawing.  
;;;; Copyright (C) 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017 The Free Software Foundation

;;;; GNU 3DLDF is free software; you can redistribute it and/or modify 
;;;; it under the terms of the GNU General Public License as published by 
;;;; the Free Software Foundation; either version 3 of the License, or 
;;;; (at your option) any later version.  

;;;; GNU 3DLDF is distributed in the hope that it will be useful, 
;;;; but WITHOUT ANY WARRANTY; without even the implied warranty of 
;;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
;;;; GNU General Public License for more details.  

;;;; You should have received a copy of the GNU General Public License 
;;;; along with GNU 3DLDF; if not, write to the Free Software 
;;;; Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

;;;; GNU 3DLDF is a GNU package.  
;;;; It is part of the GNU Project of the  
;;;; Free Software Foundation 
;;;; and is published under the GNU General Public License. 
;;;; See the website http://www.gnu.org 
;;;; for more information.   
;;;; GNU 3DLDF is available for downloading from 
;;;; http://www.gnu.org/software/3dldf/LDF.html.


;;;; Please send bug reports to Laurence.Finston@gmx.de
;;;; The mailing list help-3dldf@gnu.org is available for people to 
;;;; ask other users for help.  
;;;; The mailing list info-3dldf@gnu.org is for sending 
;;;; announcements to users. To subscribe to these mailing lists, send an 
;;;; email with ``subscribe <email-address>'' as the subject.  

;;;; The author can be contacted at: 

;;;; Laurence D. Finston 		   
;;;; c/o Free Software Foundation, Inc. 
;;;; 51 Franklin St, Fifth Floor 	   
;;;; Boston, MA  02110-1301  	   
;;;; USA                                

;;;; Laurence.Finston@gmx.de

;;;; This file contains functions for CWEB.

(autoload 'run-make "cweb_functions"
    "run-make runs make."
    t)


;; START HERE.  LDF 2003.11.30.  Rewrite description strings.
(autoload 'run-cmpl "cweb_functions"
  "run-cmpl runs \"make 3dldf\"."
  t)

(autoload 'run-3dldf "cweb_functions"
  "run-3dldf runs \"make 3DLDFput.mp\"."
  t)

(autoload 'run-ldfr "cweb_functions"
  "run-ldfr runs the shell script ldfr."
  t)

;; End of START HERE.  LDF 2003.11.30.

(autoload 'temp "cweb_functions"
  "temp is a temporary function for running ctangle and make on
my program in ~/skand/wordlists/CWEB/."
  t)	


(autoload 'comment-cweb "cweb_functions"
  "comment-cweb puts in a comment using \"@q\" and \"@>\" for cweb files.
It uses tgdf. See documentation for that function 
for more information."
  t)

(autoload 'section-title-cweb "cweb_functions"
  "cweb-section-title puts in a section title using \"@<\" and \"@>\".
For cweb files.
It uses tgdf. See documentation for that function 
for more information."
  t)

(autoload 'cweave "cweb_functions"
  "cweave makes a shell and runs the shell command cweave on the file 
associated with
the current buffer, or the value of the buffer-local-variable 
run-cweave-on-file. I could
make it so that I log onto the gwdu20, if I'm not already on it. If there's no
prefix argument, tex is run on the resulting tex file. Otherwise, if there
is a prefix argument, it's not."
  t)

(autoload 'ctangle "cweb_functions"
  "ctangle makes a shell and runs the shell command ctangle on the file 
associated with
the current buffer, or the value of the buffer-local-variable 
run-ctangle-on-file. I could
make it so that I log onto the gwdu20, if I'm not already on it. 
If a prefix argument is used, the resulting C program is compiled. At the moment,
I just use gcc -lm as the compile command. I haven't programmed any way of using make or
compiling a different file."
  t)

(autoload 'file-section-cweb "cweb_functions"
  "file-section-cweb inserts @( and @> in CWEB files. 
It uses tgdf. See the documentation for that
function for more information."
  t)

(autoload 'tt-cweb "cweb_functions"
  "tt-cweb inserts \\.{ and } in CWEB files for typewriter type.
It uses tgdf. See the documentation for that
function for more information."
  t)	

;; Local Variables:
;; mode:Emacs-Lisp
;; End:
