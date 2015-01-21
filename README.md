# Ye Olde TAG parser from Antiquity

In which an ancient parser is resurrected.

Anoop Sarkar

# Old README

    Begin
    Title:          TAG parser (lem)
    Version:        0.14.0
    Entered-date:   Wed Aug 22 18:09:01 EDT 2001
    Description:    A parser written in ANSI C for parsing using the XTAG
                    English grammar.
    Keywords:       TAG XTAG NLP
    Author:         Anoop Sarkar <anoop at linc.cis.upenn.edu>
    Maintained-by:  Anoop Sarkar <anoop at linc.cis.upenn.edu>
    Home-page:      http://www.cis.upenn.edu/~xtag/
    Bugs:           Please send bugs to the tagplus mailing list
                    To join the mailing list, go to the XTAG web page:
                    http://www.cis.upenn.edu/~xtag/
    Primary-site:   ftp://ftp.cis.upenn.edu/pub/xtag/lem/
    Alternate-site:
    Platform:       Tested on SunOS 5.7 and Linux 2.2
    Copying-policy: GPL
    End             

Install instructions:
--------------------

Get one of the following files from ftp://ftp.cis.upenn.edu/pub/xtag/lem/ 

* lem-0.14.0.i686.tgz
      Binary version for i686 (Intel) Linux distributions.

      Extract the files with the following command: 
      % gzip -dc lem-0.14.0.i686.tgz | tar xvf -
      % cd lem-0.14.0.i686
      % make install

* lem-0.14.0.sun4u.tgz
      Binary version for ultrasparc machines running SunOS 5.7 or later.

      Extract the files with the following command: 
      % gzip -dc lem-0.14.0.sun4u.tgz | tar xvf -
      % cd lem-0.14.0.sun4u
      % make install

* lem-0.14.0.tgz 
  Full source code installation. You will have to compile it to run on
  your platform. The following packages are required before you can
  compile and install this package:
      - Berkeley DB version 3.1.xx available from http://www.sleepycat.com/
      - Perl version 5 or later
      - egcs 1.1b or later
      - Tcl/Tk version 4.0 or later
 
  Extract the files with the following command: 
      % gzip -dc lem-0.14.0.tgz | tar xvf -
      % cd lem-0.14.0

  Read INSTALL.src for installation instructions.

If you have problems with running "make install", use instead the
command "env PWD=`pwd` make -e install". Also, check the values defined
in the file Makefile in the current directory to see if the locations
for various binaries matches your system configuration.

--------------------
Anoop Sarkar
anoop at sfu.ca

