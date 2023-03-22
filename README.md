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

Update: Mar 22, 2023
--------------------

Most of the functionality cannot be restored to what it was,
especially the use of Berkeley DB, the use of java for feature
checking, among a few other features of the original parser.

However, the parser can be compiled using `clang` after the
recent updates. These are the steps to follow after cloning
this repository:

    make compile-src-makefiles
    cd src/parser; make all; cd ../../
    make install-xtag-grammar

Then you can run the parser on a sample input text file as follows:

    cat test/sample | src/parser/parser.bin data/english/english.grammar lib/xtag.prefs

Ignore the following warnings:

    Warning from synerror: error in parsing syntax db output: syntax error

The output format follows the nodes in the elementary tree and shows
the attachments using labels, e.g. the tree `alphaNXN[John]` is
attached to the `NP_0` node of the tree `alphaW0nx0Vnx1[read]` and
the attachment is represented using the label `0x6000061a9a90`. The
labels are arbitrary and will change each time you run the parser
on the same sentence. Top and bottom parts of a node in an elementary
tree are represented separately.

    begin sent="John read the book that Mary bought ."
    start: 0x60000614b2f0 [#S_TOPFEATS]
    0x60000614b2f0: alphaW0nx0Vnx1[read]<S_q/top><-><initroot><S_q/>[] [0x600006149f90,(nil)][0x60000615d310,0x60000614aee0]
    0x600006149f90: alphaW0nx0Vnx1[read]<S_q/bot><-><internal><S_q/>[] [0x6000061265d0,0x600006148820]
    0x6000061265d0: alphaW0nx0Vnx1[nil]<NP_0/top><-><internal><S_q/>[] [0x6000061a9a90,(nil)]
    0x6000061a9a90: alphaNXN[John]<NP/top><-><initroot><NP/>[] [0x6000061b13b0,(nil)]
    0x6000061b13b0: alphaNXN[John]<NP/bot><-><internal><NP/>[] [0x6000061ba800,(nil)]
    0x6000061ba800: alphaNXN[John]<N/top><-><internal><NP/>[] [0x60000604c190,(nil)]
    0x60000604c190: alphaNXN[John]<N/bot><-><internal><NP/>[<#N.m_3sg #N.m_WH- #N.m_refl- #N.m_decreas- #N.m_definite+ #N.m_GEN- #N.m_quan- >]

Install instructions:
--------------------

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
> Anoop Sarkar
> anoop at sfu.ca

