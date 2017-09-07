;;;; cweb-mode.el. 
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
 
;;; Code:

(setq cweb-mode t)

(defvar cweb-mode-syntax-table nil
  "Syntax table used while in CWEB mode.")

(if cweb-mode-syntax-table
    ()
;; else
  (setq cweb-mode-syntax-table (make-syntax-table))
;  (modify-syntax-entry ?\" ".   " cweb-mode-syntax-table)
;  (modify-syntax-entry ?\\ ".   " cweb-mode-syntax-table)
;  (modify-syntax-entry ?' "w   " cweb-mode-syntax-table)
;  (modify-syntax-entry ?% "<   " cweb-mode-syntax-table)
)

(defvar cweb-mode-abbrev-table nil
  "Abbrev table used while in CWEB mode.")

(define-abbrev-table 'cweb-mode-abbrev-table '(
    ))

(defvar cweb-mode-map nil
  "Keymap for CWEB mode.")


(if cweb-mode-map ()
  (setq cweb-mode-map (nconc (make-sparse-keymap) c-mode-map))


  (define-key cweb-mode-map "\"" 'self-insert-command)
  (define-key cweb-mode-map "\t" 'c-indent-command)
  (define-key cweb-mode-map "{" 'self-insert-command)
  (define-key cweb-mode-map "}" 'self-insert-command)



  ;; This is ä (a-umlaut).


  (define-key cweb-mode-map [f3] 'goto-line)	 
  (define-key cweb-mode-map [S-f3] '(lambda () (interactive)(insert "@")))
  (define-key cweb-mode-map [kp-f3] 'temp)	

  (define-key cweb-mode-map [f4] 'call-last-kbd-macro)	 
  (define-key cweb-mode-map [S-f4] 'bold-face)
 
  (define-key cweb-mode-map [C-f1] 'outline-next-heading)
  (define-key cweb-mode-map [C-f2] 'outline-next-visible-heading)
  (define-key cweb-mode-map [C-f3] 'outline-forward-same-level)	 
  (define-key cweb-mode-map [C-f4] 'outline-previous-visible-heading)	 
  (define-key cweb-mode-map [C-f5] 'outline-backward-same-level)	 
  (define-key cweb-mode-map [C-f6] 'outline-up-heading)	      




  (define-key cweb-mode-map [228] '(lambda () (interactive)(insert "@")))
  (define-key cweb-mode-map [f1] 'simple-tex-macro)
 
  (define-key cweb-mode-map [f2] 'write-tex)	 

  (define-key cweb-mode-map [S-f2] 'italics)	 



  (define-key cweb-mode-map [f5] 'revert-buffer) 
  (define-key cweb-mode-map [S-f5] 'query-replace-regexp)
  (define-key cweb-mode-map [C-f7] 'tags-query-replace)	 
  (define-key cweb-mode-map [S-f8] 'unexpand-abbrev)	 
  (define-key cweb-mode-map [C-f8] 'tags-search)	 
  (define-key cweb-mode-map [f9] 'make-verticals)	 
  (define-key cweb-mode-map [S-f9] 'square-brackets)	 
  (define-key cweb-mode-map [C-f9] 'mp-file)	 
  (define-key cweb-mode-map [f10] 'copy-region-as-kill)
  (define-key cweb-mode-map [S-f10] 'tex-insert-braces)	 
  (define-key cweb-mode-map [C-f10] 'occur)	 
  (define-key cweb-mode-map [f11] 'filename)
  (define-key cweb-mode-map [C-f11] 'tt)
  (define-key cweb-mode-map [f12] 'indent-region)
  (define-key cweb-mode-map [S-f12] 'get-rcs-log)
  (define-key cweb-mode-map [C-f12] '(lambda () (interactive)
				       (let (c)
					 (setq c (read-char))
					 (insert-register c t)
					 ) ;; let
				       ) ;; lambda
    ) ;; define-key
  

  (define-key cweb-mode-map [C-pause] 'revert-buffer-no-query)
 
  (define-key cweb-mode-map [print] 'cweb-literal-c)
  (define-key cweb-mode-map [S-print] 'syntax-item)
  (define-key cweb-mode-map [C-print] '(lambda () (interactive) (insert "@;")))

  (define-key cweb-mode-map [C-prior] 'expand-abbrev)



  

  ;; Control-Keypad-2
  (define-key cweb-mode-map [C-kp-down] 'run-cmpl) 

  ;; Control-Keypad-4
  (define-key cweb-mode-map [C-kp-begin] 'run-3dldf) 

  (define-key cweb-mode-map [C-kp-up] 'run-ldfr)

  (define-key cweb-mode-map [C-kp-left] 'revert-buffer-no-query)

  (define-key cweb-mode-map [C-kp-add] 'vc-diff) 

  (define-key cweb-mode-map [C-kp-multiply] 'insert-buffer) 
  



  ;; LDF 2002.12.13.  These are for recompiling 3dldf.


;; These are temporary.


				 
(define-key cweb-mode-map [f14] '(lambda () (interactive)
				     (search-forward "//")    
				     (backward-char 2)
				     (delete-char 2)
				     (insert "/* ")
				     ))

  ;; Key definitions using C (Control)
  (define-key cweb-mode-map [67108905] 'blink-matching-open)

  ;; Key definitions using C-c
  
;; LDF 2002.4.7.
;; For some reason, C-c" doesn't work, at least not when I'm
;; on the gwdu70 by means of ssh from the Linux terminal.
;; Therefore, I'm using C-c' to put in double quotes.  But I'm not 
;; happy about it.
(define-key cweb-mode-map "\C-c\'" 'put-in-normal-quotes)

(define-key cweb-mode-map "\C-c$" 'dollars)
(define-key cweb-mode-map "\C-c<" 'angle-braces)
  

   (define-key cweb-mode-map "\C-cb" 'begin-comment)
  
  ;; These are for the terminals in the Skandinavian dept., where the
  ;; umlauted letters on the keyboard don't work.
  (define-key cweb-mode-map "\C-ca" 'a-umlaut)
  (define-key cweb-mode-map "\C-co" 'o-umlaut)
  (define-key cweb-mode-map "\C-cu" 'u-umlaut)
  (define-key cweb-mode-map "\C-cA" 'A-umlaut)
  (define-key cweb-mode-map "\C-cO" 'O-umlaut)
  (define-key cweb-mode-map "\C-cU" 'U-umlaut)
  (define-key cweb-mode-map "\C-cs" 'scharf-s)

  ;; Key definitions with C-c   Be careful that I don't redefine keys for the
  ;; German letters above!
  (define-key cweb-mode-map "\C-cf" 'file-section-cweb)	 
  (define-key cweb-mode-map "\C-cl" 'cweb-literal-c)	 
  (define-key cweb-mode-map "\C-ct" 'ctangle)	 
  (define-key cweb-mode-map "\C-cw" 'cweave)

  ;;(define-key cweb-mode-map "\C-cp" 'c-make-printf)
   (define-key cweb-mode-map "\C-cp" 'c++-cerr)
   (define-key cweb-mode-map "\C-cq"  'put-in-tex-quotes)
   (define-key cweb-mode-map "\C-c." 'ldots)
  (define-key cweb-mode-map "\C-c," 'tt-cweb)
  (define-key cweb-mode-map "\C-c(" 'make-parentheses)
  (define-key cweb-mode-map "\C-c[" 'square-brackets)
  (define-key cweb-mode-map "\C-c{" 'insert-braces-c)

  ;; sets C-c TAB to indent-region.
  (define-key cweb-mode-map [3 9] 'indent-region)

  ;; Key definitions using C-x
  ;; C-xa definitions below.
  (define-key cweb-mode-map "\C-xm" 'my-compile)
  ;; C-xn definitions below.
  ;; 
  ;; (define-key cweb-mode-map "\C-xp" 'printf-this-is)
  (define-key cweb-mode-map "\C-xp" 'c++-cerr-this-is)
  (define-key cweb-mode-map "\C-xq" 'comment-cweb)
  (define-key cweb-mode-map "\C-x<" 'section-title-cweb)

  ;; Key definitions using C-x C-<something>
  (define-key cweb-mode-map "\C-x\C-a" 'toggle-auto-fill-mode)

  ;; Key definitions using C-xa
  (define-key cweb-mode-map "\C-xac" 'copyright-symbol)
  (define-key cweb-mode-map "\C-xaf" 'filename)

  ;; Key definitions using C-xn
  (define-key cweb-mode-map "\C-xnf" 'footnote)
  (define-key cweb-mode-map "\C-xnm" 'simple-tex-macro) ; For Skand. Sem.
  ;;
  ;; These rebind the umlauted characters to self-insert-command.
  ;;
  ;; ä
  (define-key cweb-mode-map [228] 'self-insert-command)
  ;; Ä
  (define-key cweb-mode-map [196] 'self-insert-command)
  ;; ö		
  (define-key cweb-mode-map [246] 'self-insert-command)
  ;; Ö
  (define-key cweb-mode-map [214] 'self-insert-command)
  ;; ü
  (define-key cweb-mode-map [252] 'self-insert-command)
  ;; Ü (U-umlaut)
  (define-key cweb-mode-map [220] 'self-insert-command)
  ;; ß
  (define-key cweb-mode-map [223] 'self-insert-command)
  ;;
  ;; These are for my menu-bar.
  ;;
  (define-key cweb-mode-map [menu-bar] (make-sparse-keymap))
  (define-key cweb-mode-map [menu-bar cweb]
  (cons "CWEB" (make-sparse-keymap "CWEB")))
  (define-key cweb-mode-map [menu-bar cweb comment]
    '("Comment" . comment-cweb))
  (define-key cweb-mode-map [menu-bar cweb ctangle]
    '("ctangle" . ctangle))
  (define-key cweb-mode-map [menu-bar cweb cweave]
    '("cweave" . cweave))
  )

(defun cweb-mode ()
  "Major mode for editing CWEB programs.
Special commands:
\\{cweb-mode-map}
Turning on CWEB mode calls the value of the variable `cweb-mode-hook',
if that value is non-nil."
  (interactive)
  (kill-all-local-variables)
  (use-local-map cweb-mode-map)
  (setq mode-name "CWEB")
  (setq major-mode 'cweb-mode)
  (setq local-abbrev-table cweb-mode-abbrev-table)
  (set-syntax-table cweb-mode-syntax-table)
  (make-local-variable 'comment-start)
  (make-local-variable 'comment-end)
  (setq comment-start "/* ")
  (setq comment-end " */")
  (make-local-variable 'indent-line-function)
  (setq indent-line-function 'c-indent-line)
  (run-hooks 'cweb-mode-hook)
  ;;(setq outline-regexp "\@q *\\*+\\|\@\\*[0-9]*")
  (setq outline-regexp "\@q *\\*+")
  (setq indent-tabs-mode nil)
  );; Matches defun cweb-mode.


;;; cweb-mode.el ends here






;; Local Variables:
;; mode:Emacs-Lisp
;; End:
