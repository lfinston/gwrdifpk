#### configure.ac
#### Created by Laurence D. Finston (LDF) Tue Jun 26 10:23:54 CEST 2012

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

.# Process this file with autoconf to produce a configure script.
AC_INIT(gwrdifpk, 1.0, Laurence.Finston@gwdg.de, gwrdifpk-1.0.tar.gz)
AM_INIT_AUTOMAKE
AC_CONFIG_SRCDIR(gwrdifpk.c)
AM_CONFIG_HEADER(config.h)
AC_CONFIG_MACRO_DIR([m4])
LT_INIT
AC_SUBST([LIBTOOL_DEPS])

AC_SUBST([BUFFER_SIZE])

#### ** (2)

# Checks for programs.
AC_PROG_CXX
AC_PROG_CC
AC_PROG_INSTALL
AC_PROG_MAKE_SET

AM_PROG_LEX

AC_PROG_YACC

AC_CHECK_PROG([HAVE_TEX], [tex], 1, 0) 
AC_CHECK_PROG([HAVE_DVIPS], [dvips], 1, 0) 
AC_CHECK_PROG([HAVE_PS2PDF], [ps2pdf], 1, 0) 
AC_CHECK_PROG([HAVE_TEXI2DVI], [texi2dvi], 1, 0) 
AC_CHECK_PROG([HAVE_MAKEINFO], [makeinfo], 1, 0) 
AC_CHECK_PROG([HAVE_CURL], [curl], 1, 0) 
AC_CHECK_PROG([HAVE_PDFTK], [pdftk], 1, 0) 

AC_ARG_VAR([HAVE_TEX], [tex exists])
AC_ARG_VAR([HAVE_DVIPS], [dvips exists])
AC_ARG_VAR([HAVE_PS2PDF], [ps2pdf exists])
AC_ARG_VAR([HAVE_TEXI2DVI], [texi2dvi exists])
AC_ARG_VAR([HAVE_MAKEINFO], [makeinfo exists])

AC_DEFINE_UNQUOTED([HAVE_CURL], $HAVE_CURL, 
                   [Define to 1, if `curl' is available, otherwise 0.])

AC_DEFINE_UNQUOTED([HAVE_PDFTK], $HAVE_PDFTK, 
                   [Define to 1, if `pdftk' is available, otherwise 0.])

AC_DEFINE_UNQUOTED([HAVE_TEX], $HAVE_TEX, 
                   [Define to 1, if `tex' is available, otherwise 0.])

AC_DEFINE_UNQUOTED([HAVE_DVIPS], $HAVE_DVIPS, 
                   [Define to 1, if `dvips' is available, otherwise 0.])

AC_DEFINE_UNQUOTED([HAVE_PS2PDF], $HAVE_PS2PDF, 
                   [Define to 1, if `ps2pdf' is available, otherwise 0.])

AC_DEFINE_UNQUOTED([HAVE_TEXI2DVI], $HAVE_TEXI2DVI, 
                   [Define to 1, if `texi2dvi' is available, otherwise 0.])

AC_DEFINE_UNQUOTED([HAVE_MAKEINFO], $HAVE_MAKEINFO, 
                   [Define to 1, if `makeinfo' is available, otherwise 0.])

if test -n "$BUFFER_SIZE"
then 
   AC_DEFINE_UNQUOTED([BUFFER_SIZE], $BUFFER_SIZE, [Set buffer size.])
else
   AC_DEFINE_UNQUOTED([BUFFER_SIZE], 2048, [Default buffer size.])
fi

# Checks for libraries.
#AC_CHECK_LIB(m, trunc)
AC_CHECK_LIB(mysqlclient, mysql_init)


# Checks for header files.
AC_HEADER_STDC
AC_CHECK_HEADERS([errno.h float.h limits.h stdlib.h unistd.h pthread.h fastcgi.h mysql.h])

# Checks for typedefs, structures, and compiler characteristics.
#AC_C_CONST
#AC_C_INLINE
#AC_TYPE_SIZE_T
#AC_STRUCT_TM
AC_CHECK_TYPES([unsigned long long, unsigned long, unsigned int])

# Checks for library functions.
#AC_FUNC_MALLOC
##AC_FUNC_STAT
#AC_SEARCH_LIBS(trunc, m)
#AC_CHECK_FUNCS([floor sqrt trunc])

AC_CONFIG_FILES([Makefile crypto/Makefile database/Makefile doc/Makefile elisp/Makefile
                 gpg_keys/Makefile gpgme_test/Makefile handles/Makefile src/Makefile])

# Checks for endianness.
#AC_C_BIGENDIAN

AC_CHECK_SIZEOF([int])
AC_CHECK_SIZEOF([long int])
#AC_CHECK_SIZEOF([void*])


AC_ARG_ENABLE([dummy],
AC_HELP_STRING([--enable-debug-compile],
[Enable conditionally compiled debugging output (this is the default).]),
[],[])

AC_ARG_ENABLE([debug-compile], 
[AC_HELP_STRING([--disable-debug-compile],
        [Disable conditionally compiled debugging output.])],
[if test $enableval == "yes"
then
echo "Enabling conditional compilation of debugging output"
AC_DEFINE([DEBUG_COMPILE], [1], 
  [Define to 0 or 1 to disable or enable conditional compilation of debugging output.])
else 
echo "Disabling conditional compilation of debugging output"
AC_DEFINE([DEBUG_COMPILE], [0], 
  [])
fi], 
[echo "Enabling conditional compilation of debugging output"
AC_DEFINE([DEBUG_COMPILE], [1], 
[])	
])

#### ** (2)

AC_OUTPUT

#### ** (2) End of 'configure.ac'

#### * (1) Local Variables for Emacs

#### Local Variables:
#### mode:Shell-Script
#### abbrev-mode:t
#### eval:(read-abbrev-file)
#### eval:(outline-minor-mode t)
#### outline-regexp:"#### [*\\f]+[ \\t]+([0-9]+)"
#### End:
