;;;; This is ~/Emacs/cweb-tex-keymap.el
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

;;;; * (1)

(setq cweb-tex-keymap t)
(defvar cweb-tex-mode-map nil
  "Keymap for cweb-tex files.")

(if cweb-tex-mode-map ()
  (setq cweb-tex-mode-map 
	(nconc (make-sparse-keymap) cweb-mode-map)))

  ;; Some of the S-<function-key>s are set either globally or
  ;; using the tex-mode-hook in ldfemacs.el.
  (define-key cweb-tex-mode-map [f1] 'simple-tex-macro)
  (define-key cweb-tex-mode-map [S-f1] '[ESC])
  (define-key cweb-tex-mode-map [C-f1] 'suffix)
  (define-key cweb-tex-mode-map [f2] 'write-tex)
  (define-key cweb-tex-mode-map [S-f2] 'italics)
  (define-key cweb-tex-mode-map [C-f2] 'subscript)
  (define-key cweb-tex-mode-map [f3] 'write-mf)  
  (define-key cweb-tex-mode-map [S-f3] 'tt)
  (define-key cweb-tex-mode-map [C-f3] 'superscript)
  (define-key cweb-tex-mode-map [f4] 'verbatim)
  (define-key cweb-tex-mode-map [S-f4] 'macro)
  (define-key cweb-tex-mode-map [C-f4] 'macrule)
  (define-key cweb-tex-mode-map [S-f5] 'variable)
  ;; C-f5 is set to query-replace-regexp
  (define-key cweb-tex-mode-map [S-f6] 'ustroke)
  (define-key cweb-tex-mode-map [C-f6] 'command)
  (define-key cweb-tex-mode-map [S-f8] 'filename)
  (define-key cweb-tex-mode-map [f9] 'eplain-verbatim)
  (define-key cweb-tex-mode-map [S-f10] 'type)
  (define-key cweb-tex-mode-map [S-f11] 'english)
  (define-key cweb-tex-mode-map [S-f12] 'lisp)

  ;; These are for the terminals at the Skand. dept.
  (define-key cweb-tex-mode-map [kp-f2] 'write-tex)
  (define-key cweb-tex-mode-map [kp-f3] 'write-mf)

  (define-key cweb-tex-mode-map "\C-c." 'ldots)
  
  ;; These are for the terminals in the Skandinavian dept., where the
  ;; umlauted letters on the keyboard don't work.
  (define-key cweb-tex-mode-map "\C-ca" 'a-umlaut)
  (define-key cweb-tex-mode-map "\C-co" 'o-umlaut)
  (define-key cweb-tex-mode-map "\C-cu" 'u-umlaut)
  (define-key cweb-tex-mode-map "\C-cA" 'A-umlaut)
  (define-key cweb-tex-mode-map "\C-cO" 'O-umlaut)
  (define-key cweb-tex-mode-map "\C-cU" 'U-umlaut)
    (define-key cweb-tex-mode-map "\C-cs" 'scharf-s)
  (define-key cweb-tex-mode-map "\C-cb" 'begin-comment)
  (define-key cweb-tex-mode-map "\C-cd" 'eth)
  (define-key cweb-tex-mode-map "\C-cf" 'insular-f)
  (define-key cweb-tex-mode-map "\C-cp" 'putontop)
  (define-key cweb-tex-mode-map "\C-ct" 'thorn)
  (define-key cweb-tex-mode-map "\C-cy" 'Thorn)

  ;; sets C-c i to "icelandic-dotless i"
  (define-key cweb-tex-mode-map "\C-c<" 'angle-braces)
  (define-key cweb-tex-mode-map "\C-c\C-s" 'make-tex-showthe)
  (define-key cweb-tex-mode-map "\C-c\C-l" 'pounds)
  (define-key cweb-tex-mode-map "\C-xaa" 'ae)
  (define-key cweb-tex-mode-map "\C-xab" 'begin-division)
  (define-key cweb-tex-mode-map "\C-xaf" 'footnote)
  (define-key cweb-tex-mode-map "\C-xam" 'make-tex-message)
  (define-key cweb-tex-mode-map "\C-xav" 'verbatim)
  ;; This is for my paper using mft. I won't won't C-xm set
  ;; to mft for normal papers.
  (define-key cweb-tex-mode-map "\C-xm" 'mft)
  (define-key cweb-tex-mode-map "\C-xnm" 'marginal-note)
  (define-key cweb-tex-mode-map "\C-xns" 'make-tex-show)
  (define-key cweb-tex-mode-map "\C-x4l" 'slong)
  (define-key cweb-tex-mode-map "\C-x4s" 'sshort)

;  ;; These set the umlauted letter keys and the s-zet to the corresponding 
;  ;; defuns. 
;  (define-key cweb-tex-mode-map [228] 'a-umlaut)
;  (define-key cweb-tex-mode-map [196] 'A-umlaut)
;  (define-key cweb-tex-mode-map [246] 'o-umlaut)
;  (define-key cweb-tex-mode-map [214] 'O-umlaut)
;  (define-key cweb-tex-mode-map [252] 'u-umlaut)
;  (define-key cweb-tex-mode-map [220] 'U-umlaut)
;  (define-key cweb-tex-mode-map [223] 'scharf-s)

  (define-prefix-command 'umlaut-keymap)
  (define-key cweb-tex-mode-map "\C-c\"" 'umlaut-keymap)
  (define-key umlaut-keymap "a"
    (lambda () "See documentation for umlaut"
      (interactive) (umlaut "a")))
  (define-key umlaut-keymap "A"
    (lambda () "See documentation for umlaut"
      (interactive) (umlaut "A")))
    (define-key umlaut-keymap "e"
    (lambda () "See documentation for umlaut"
      (interactive) (umlaut "E")))
    (define-key umlaut-keymap "i"
    (lambda () "See documentation for umlaut"
      (interactive) (umlaut "\\i")))
      (define-key umlaut-keymap "I"
    (lambda () "See documentation for umlaut"
      (interactive) (umlaut "I")))
    (define-key umlaut-keymap "o"
    (lambda () "See documentation for umlaut"
      (interactive) (umlaut "o")))
  (define-key umlaut-keymap "O"
    (lambda () "See documentation for umlaut"
      (interactive) (umlaut "O")))
      (define-key umlaut-keymap "u"
    (lambda () "See documentation for umlaut"
      (interactive) (umlaut "u")))
  (define-key umlaut-keymap "U"
    (lambda () "See documentation for umlaut"
      (interactive) (umlaut "U")))
  (define-key umlaut-keymap "y"
    (lambda () "See documentation for umlaut"
      (interactive) (umlaut "y")))
  (define-key umlaut-keymap "s"
    (lambda () "I use \"umlaut-s\" to make es-zet."
      (interactive) (scharf-s)))
  (define-prefix-command 'acute-keymap)
  (define-key cweb-tex-mode-map "\C-c'" 'acute-keymap)
  (define-key acute-keymap "a" (lambda () "See documentation for acute" 
				 (interactive) (acute "a")))
  (define-key acute-keymap "e" (lambda () "See documentation for acute"
				 (interactive) (acute "e")))
  (define-key acute-keymap "i" (lambda () "See documentation for acute" 
				 (interactive) (acute "i")))
  (define-key acute-keymap "o" (lambda () "See documentation for acute" 
				 (interactive) (acute "o")))
  (define-key acute-keymap "u" (lambda () "See documentation for acute" 
				 (interactive) (acute "u")))
  (define-key acute-keymap "y" (lambda () "See documentation for acute" 
				 (interactive) (acute "y")))
  (define-key acute-keymap "A" (lambda () "See documentation for acute" 
				 (interactive) (acute "A")))
  (define-key acute-keymap "E" (lambda () "See documentation for acute" 
				 (interactive) (acute "E")))
  (define-key acute-keymap "I" (lambda () "See documentation for acute" 
				 (interactive) (acute "I")))
  (define-key acute-keymap "O" (lambda () "See documentation for acute" 
				 (interactive) (acute "O")))
  (define-key acute-keymap "U" (lambda () "See documentation for acute" 
				 (interactive) (acute "U")))
  (define-key acute-keymap "Y" (lambda () "See documentation for acute" 
				 (interactive) (acute "Y")))
  (define-key acute-keymap " " (lambda () "See documentation for acute" 
				 (interactive) (acute "")
				 (set-mark-command nil)(backward-char 1)
				 (message "Mark set after closing brace")
				 (sit-for 1.5)
				 (message nil)
				 ))
  

(defvar cweb-tex-mode-abbrev-table nil
  "Abbrev table used while in cweb-tex-mode, which doesn't really exist.")

(define-abbrev-table 'cweb-tex-mode-abbrev-table '())










