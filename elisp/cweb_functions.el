;;;; This is ~/Emacs/cweb_functions.el
;;;; Created by Laurence D. Finston (LDF).  Date unknown.

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


(defun run-make (arg)
  "run-make runs make."
  (interactive "P")
  (save-buffer)
  (save-some-buffers t)
  (delete-other-windows)
  (make-comint "make-shell" "/bin/ksh" nil "-i")
  (switch-to-buffer-other-window "*make-shell*")
  (insert "clear")
  (comint-send-input)
  (insert "cd $METAP/perspective; make")
  (comint-send-input)
  ) ;; Matches defun run-make


;; START HERE.  LDF 2003.11.30.  Rewrite descriptions and revise comments.
(defun run-cmpl (arg)
  "run-cmpl runs \"make 3dldf\"."
  (interactive "P")
  (let (shell-buffer-name 
	shell-exists
	shell-name 
	this-buffer 
	)
    (setq this-buffer (get-buffer (current-buffer)))
    (save-buffer)
    (save-some-buffers t)
    (delete-other-windows)
    (setq shell-name "3DLDF-shell")
    (setq shell-buffer-name (concat "*" shell-name "*"))
    (make-comint shell-name "/bin/ksh" nil "-i")
    (switch-to-buffer-other-window shell-buffer-name)
    (insert "clear")
    (comint-send-input)
    (insert "cd ~/metafont/metapost/perspective/")
    (comint-send-input)
    (insert "make 3dldf")
    (comint-send-input)
    (switch-to-buffer-other-window this-buffer)
    )  ;; Matches let
  )  ;; Matches defun run-cmpl

(defun run-3dldf (arg)
  "run-3dldf runs \"make 3DLDFput.mp\"."
  (interactive "P")
  (let (shell-buffer-name 
	shell-exists
	shell-name 
	this-buffer 
	)
    (setq this-buffer (get-buffer (current-buffer)))
    (save-buffer)
    (save-some-buffers t)
    (delete-other-windows)
    (setq shell-name "3DLDF-shell")
    (setq shell-buffer-name (concat "*" shell-name "*"))
    (make-comint shell-name "/bin/ksh" nil "-i")
    (switch-to-buffer-other-window shell-buffer-name)
    (insert "clear")
    (comint-send-input)
    (insert "cd ~/metafont/metapost/perspective/")
    (comint-send-input)
    (insert "make 3DLDFput.mp")
    (comint-send-input)
    (switch-to-buffer-other-window this-buffer)
    )  ;; Matches let
  );; defun run-3dldf


;; Added this defun.
(defun run-ldfr (arg)
  "run-ldfr runs the shell script ldfr."
  (interactive "P")
  (let (shell-buffer-name 
	shell-exists
	shell-name 
	this-buffer 
	)
    (setq this-buffer (get-buffer (current-buffer)))
    (save-buffer)
    (save-some-buffers t)
    (delete-other-windows)
    (setq shell-name "3DLDF-shell")
    (setq shell-buffer-name (concat "*" shell-name "*"))
    (make-comint shell-name "/bin/ksh" nil "-i")
    (switch-to-buffer-other-window shell-buffer-name)
    (insert "clear")
    (comint-send-input)
    (insert "cd ~/metafont/metapost/perspective/")
    (comint-send-input)
    (insert "ldfr")
    (comint-send-input)
    (switch-to-buffer-other-window this-buffer)
    )  ;; Matches let
  );; defun run-ldfr

;; End of START HERE.  LDF 2003.11.30.


(defun temp (arg)
  "temp is a temporary function for running ctangle and make on
my program in ~/skand/wordlists/CWEB/."
  (interactive "P")
  (save-buffer)
  (save-some-buffers t)
  (delete-other-windows)
  (make-comint "cweb-shell" "/bin/ksh" nil "-i")
  (switch-to-buffer-other-window "*cweb-shell*")
  (insert "clear")
  (comint-send-input)
  (insert "cd $WL/CWEB; ctangle words; ctangle read_data_file")
  (comint-send-input)
  (cond ((not arg)
	 (insert "make")
	 (comint-send-input))
	) ;; Matches cond
  ) ;; Matches defun temp
  


(defun comment-cweb (arg)
  "comment-cweb puts in a comment using \"@q\" and \"@>\" for cweb files.
It uses tgdf. See documentation for that function 
for more information."
  (interactive "P")
  (tgdf "@q " "@>" "What's your comment? " arg)
  ) ;; Matches defun comment-cweb


(defun section-title-cweb (arg)
  "section-title-cweb puts in a section title using \"@<\" and \"@>\".
For cweb files.
It uses tgdf. See documentation for that function 
for more information."
  (interactive "P")
  (tgdf "@<" "@>" "What's your section title? " arg)
  ) ;; Matches defun section-title-cweb

(defun cweave (arg)
  "cweave makes a shell and runs the shell command cweave on the file 
associated with
the current buffer, or the value of the buffer-local-variable 
run-cweave-on-file. I could
make it so that I log onto the gwdu20, if I'm not already on it. If there's no
prefix argument, tex is run on the resulting tex file. Otherwise, if there
is a prefix argument, it's not."
  (interactive "P")
  (let (a current-name default-name
	  (this-buffer (get-buffer (current-buffer)))
	  current-dir
	  current-cweave-file
	  ;; Matches let-list
	  )
    (setq current-dir (file-name-directory
		       (buffer-file-name
			this-buffer)))
    ;; If the buffer local variable run-cweave-on-file is non-nil,
    ;; then current-cweave-file is set to it. Else, if the buffer
    ;; local variable run-cweb-on-file is non-nil, current-cweave-file
    ;; is set to it. Else, current-cweave-file is set to the current
    ;; filename.
    (cond (run-cweave-on-file
	   (setq current-cweave-file run-cweave-on-file))
	  (run-cweb-on-file
	   (setq current-cweave-file run-cweb-on-file))
	  (t
	   (setq current-cweave-file
		 (file-name-nondirectory (buffer-file-name
					  this-buffer))))
	  );; Matches cond
    ;; This eliminates the extension of current-cweave-file, if any.
    (let (counter goal temp-name break-flag current-char extension)
      (setq counter 0)
      (setq goal (length current-cweave-file))
      (setq temp-name current-cweave-file)
      (setq current-cweave-file "")
      (setq break-flag nil)
      (while (and (not break-flag)
		  (< counter goal))
	(setq current-char (substring temp-name counter (1+ counter)))
	(if (equal current-char ".")
	    (progn
	      (setq break-flag t)
	      (setq extension (substring temp-name (1+ counter)))
	      );; Matches then progn
	  ;; else
	  (progn
	    (setq current-cweave-file
		  (concat current-cweave-file current-char))
	    (setq counter (1+ counter))
	    );; Matches else progn
	  );; Matches if
	);; Matches while
      );; Matches inner let
    (save-buffer)
    (save-some-buffers t)
    (delete-other-windows)
    (make-comint "cweb-shell" "/bin/ksh" nil "-i")
    (switch-to-buffer-other-window "*cweb-shell*")
    (insert "clear")
    (comint-send-input)
    (insert "cd " current-dir)
    (comint-send-input)
    (insert "cweave " current-cweave-file)
    (if (not arg)
	(progn
	  (insert " && tex " current-cweave-file)
	  ) ;; Matches progn
      ) ;; Matches if
    (comint-send-input)
    (insert "\n")
    (comint-send-input)
    ;; Often, I want to run tex by hand when arg is non-nil, so in this case,
    ;; I don't switch buffers.
    (if (not arg) (switch-to-buffer-other-window this-buffer))
    );; Matches let
  ) ;; Matches defun cweave


(defun ctangle (arg)
  "ctangle makes a shell and runs the shell command ctangle on the file 
associated with
the current buffer, or the value of the buffer-local-variable 
run-ctangle-on-file. Then it compiles the resulting C program,
unless a prefix argument is used. The command used for compiling is in
the variable compile-command. It can be changed, if desired."
  (interactive "P")
  (let (a current-name default-name
	  (this-buffer (get-buffer (current-buffer)))
	  current-dir
	  (current-ctangle-file run-ctangle-on-file)
	  (local-exec-name executable-name)
	  compile-command	  
	  suffix
          (USE-G++ use-g++)
	  ) ;; Matches let-list

    ;; Change this to reflect the fact that I now have a variable cxx, 
    ;; also, when the Gnu compiler is updated, I should make it possible to
    ;; use it instead.
    (cond (USE-G++
	   (if (string-equal (getenv "PLATFORM") "INTEL.FREEBSD")
	       (setq compile-command  "cpp -o ")
	     ;(setq compile-command  "cxx -x cxx -lm -o "))
	     ;; Temporary.
	     (setq compile-command  "cxx -x cxx "))
	   (setq suffix  ".c"))
	  (t
	   (setq compile-command "gcc -lm -g -o ")
	   (setq suffix  ".c")))

    ;; This is a kludge. I should fix the problem below.
    (if (not local-exec-name) (setq local-exec-name "a.out"))
    (setq current-dir (file-name-directory
		       (buffer-file-name
			this-buffer)))
    ;; If the buffer local variable run-ctangle-on-file is non-nil,
    ;; then current-ctangle-file is set to it. Else, if the buffer
    ;; local variable run-cweb-on-file is non-nil, current-ctangle-file
    ;; is set to it. Else, current-ctangle-file is set to the current
    ;; filename.
    (cond (run-ctangle-on-file
	   (setq current-ctangle-file run-ctangle-on-file))
	  (run-cweb-on-file
	   (setq current-ctangle-file run-cweb-on-file))
	  (t
	   (setq current-ctangle-file
		 (file-name-nondirectory (buffer-file-name
					  this-buffer))))
	  );; cond
    ;; This eliminates the extension of current-ctangle-file, if any.
    (let (counter goal temp-name break-flag current-char extension)
      (setq counter 0)
      (setq goal (length current-ctangle-file))
      (setq temp-name current-ctangle-file)
      (setq current-ctangle-file "")
      (setq break-flag nil)
      (while (and (not break-flag)
		  (< counter goal))
	(setq current-char (substring temp-name counter (1+ counter)))
	(if (equal current-char ".")
	    (progn
	      (setq break-flag t)
	      (setq extension (substring temp-name (1+ counter)))
	      );; Matches then progn
	  ;; else
	  (progn
	    (setq current-ctangle-file
		  (concat current-ctangle-file current-char))
	    (setq counter (1+ counter))
	    );; Matches else progn
	  );; Matches if
	);; Matches while
      );; Matches inner let
    (save-buffer)
    (save-some-buffers t)
    (delete-other-windows)
    (make-comint "cweb-shell" "/bin/ksh" nil "-i")
    (switch-to-buffer-other-window "*cweb-shell*")
    (insert "clear")
    (comint-send-input)
    (insert "cd " current-dir)
    (comint-send-input)
    (insert "ctangle " current-ctangle-file)
    (comint-send-input)
    (insert "mv " current-ctangle-file ".c LINUX/" current-ctangle-file
	    ".cxx")
    (comint-send-input)

;;    (cond (arg ;; There was a prefix argument.
;;	   (ignore))

;;	   ;; Temporary.

;;;	   (insert compile-command
;;;		   " " current-ctangle-file  
;;;		   suffix
;;;		   )
;;	  (local-exec-name
;;	   (insert compile-command " -o "
;;		   local-exec-name " " current-ctangle-file  
;;		   suffix)
;;	   (comint-send-input)
;;	   )
;;;	  ((not local-exec-name)
;;;	   (insert "echo \"Running " compile-command 
;;;		   current-ctangle-file suffix "\"")  
;;;	   (comint-send-input)
;;;	   (insert compile-command current-ctangle-file suffix)
;;;	   (comint-send-input)
;;;	   )
;;	  ) ;; Matches cond

    (insert "\n")
    (comint-send-input)
    (switch-to-buffer-other-window this-buffer)
    ) ;; Matches let
  ) ;; Matches defun ctangle


(defun file-section-cweb (arg)
  "file-section-cweb inserts @( and @> in CWEB files. 
It uses tgdf. See the documentation for that
function for more information."
  (interactive "P")
  (tgdf "@(" "@>"
				  "What C file do you want to write to? "
                                   arg)) 
	

(defun tt-cweb (arg)
  "tt-cweb inserts \\.{ and } in CWEB files for typewriter type.
It uses tgdf. See the documentation for that
function for more information."
  (interactive "P")
  (tgdf "\\.{" "}"
				  "What do you want in typewriter type? "
                                   arg)) 
	



;(defun get-rcs-log (arg)
;  (interactive)
;  
;  (ignore)
;  )


;; Local Variables:
;; mode:Emacs-Lisp
;; End:
