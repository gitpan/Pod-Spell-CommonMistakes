#
# This file is part of Pod-Spell-CommonMistakes
#
# This software is copyright (c) 2011 by Apocalypse.
#
# This is free software; you can redistribute it and/or modify it under
# the same terms as the Perl 5 programming language system itself.
#
use strict; use warnings;
package Pod::Spell::CommonMistakes::WordList;
BEGIN {
  $Pod::Spell::CommonMistakes::WordList::VERSION = '1.000';
}
BEGIN {
  $Pod::Spell::CommonMistakes::WordList::AUTHORITY = 'cpan:APOCAL';
}

# ABSTRACT: Holds the wordlist data for Pod::Spell::CommonMistakes

# auto-export our 2 subs
use base qw( Exporter );
our @EXPORT = qw( _check_case _check_common );

# TODO Figure out an autoimporter?
# apoc@blackhole:~/othergit/lintian/data/spelling$ cat corrections-case | perl -e 'while ( <STDIN> ) { next if $_ =~ /^#/; if ( $_ =~ /^(.+)\|\|(.+)$/ ) { print " \"$1\" => \"$2\",\n" } }'

# CASE LIST

#apoc@blackhole:~/othergit/lintian/data/spelling$ cat corrections-case
# Picky corrections, applied before lowercasing the word.  These are only
# applied to things known to be entirely English text, such as package
# descriptions, and should not be applied to files that may contain
# configuration fragments or more informal files such as debian/copyright.
#
# The format of each line is:
# mistake||correction

my %case = (
 "apache" => "Apache",
 "api" => "API",
 "Api" => "API",
 "D-BUS" => "D-Bus",
 "d-bus" => "D-Bus",
 "dbus" => "D-Bus",
 "debian" => "Debian",
 "Debian-Edu" => "Debian Edu",
 "debian-edu" => "Debian Edu",
 "Docbook" => "DocBook",
 "docbook" => "DocBook",
 "english" => "English",
 "french" => "French",
 "EMacs" => "Emacs",
 "Gconf" => "GConf",
 "gconf" => "GConf",
 "german" => "German",
 "Gnome" => "GNOME",
 "gnome" => "GNOME",
 "Gnome-VFS" => "GnomeVFS",
 "Gnome-Vfs" => "GnomeVFS",
 "GnomeVfs" => "GnomeVFS",
 "gnome-vfs" => "GnomeVFS",
 "gnomevfs" => "GnomeVFS",
 "gnu" => "GNU",
 "Gnu" => "GNU",
 "Gobject" => "GObject",
 "gobject" => "GObject",
 "Gstreamer" => "GStreamer",
 "gstreamer" => "GStreamer",
 "GTK" => "GTK+",
 "gtk+" => "GTK+",
 "Http" => "HTTP",
 "kde" => "KDE",
 "meta-package" => "metapackage",
 "MYSQL" => "MySQL",
 "Mysql" => "MySQL",
 "mysql" => "MySQL",
 "linux" => "Linux",
 "Latex" => "LaTeX",
 "latex" => "LaTeX",
 "oAuth" => "OAuth",
 "OCAML" => "OCaml",
 "Ocaml" => "OCaml",
 "ocaml" => "OCaml",
 "OpenLdap" => "OpenLDAP",
 "Openldap" => "OpenLDAP",
 "openldap" => "OpenLDAP",
 "Postgresql" => "PostgreSQL",
 "postgresql" => "PostgreSQL",
 "python" => "Python",
 "russian" => "Russian",
 "SkoleLinux" => "Skolelinux",
 "skolelinux" => "Skolelinux",
 "SLang" => "S-Lang",
 "S-lang" => "S-Lang",
 "s-lang" => "S-Lang",
 "spanish" => "Spanish",
 "subversion" => "Subversion",
 "TCL" => "Tcl",
 "tcl" => "Tcl",
 "TEX" => "TeX",
 "Tex" => "TeX",
 "TeTeX" => "teTeX",
 "Tetex" => "teTeX",
 "tetex" => "teTeX",
 "TeXLive" => "TeX Live",
 "TeX-Live" => "TeX Live",
 "TeXlive" => "TeX Live",
 "TeX-live" => "TeX Live",
 "texlive" => "TeX Live",
 "tex-live" => "TeX Live",
 "TK" => "Tk",
 "tk" => "Tk",
 "Xemacs" => "XEmacs",
 "XEMacs" => "XEmacs",
 "XFCE" => "Xfce",
 "XFce" => "Xfce",
 "xfce" => "Xfce",
);

sub _check_case {
	my $words = shift;

	# Holds the failures we saw
	my %err;

	foreach my $w ( @$words ) {
		if ( exists $case{ $w } ) {
			$err{ $w } = $case{ $w };
		}
	}

	return \%err;
}

# COMMON LIST

#apoc@blackhole:~/othergit/lintian/data/spelling$ cat corrections
# All spelling errors that have been observed "in the wild" in package
# descriptions are added here, on the grounds that if they occurred once they
# are more likely to occur again.
#
# Misspellings of "compatibility", "separate", and "similar" are particularly
# common.
#
# Be careful with corrections that involve punctuation, since the check is a
# bit rough with punctuation.  For example, I had to delete the correction of
# "builtin" to "built-in".
#
# The format of each line is:
# mistake||correction
#
# Note that corrections involving multiple word mistakes or case errors
# should be included in the appropriate data file, rather than here.

my %common = (
 "abandonning" => "abandoning",
 "abigious" => "ambiguous",
 "abitrate" => "arbitrate",
 "abov" => "above",
 "absense" => "absence",
 "absolut" => "absolute",
 "absoulte" => "absolute",
 "acceleratoin" => "acceleration",
 "accelleration" => "acceleration",
 "accesing" => "accessing",
 "accesnt" => "accent",
 "accessable" => "accessible",
 "accidentaly" => "accidentally",
 "accidentually" => "accidentally",
 "accomodate" => "accommodate",
 "accomodates" => "accommodates",
 "accout" => "account",
 "acess" => "access",
 "acessable" => "accessible",
 "ackowledge" => "acknowledge",
 "ackowledged" => "acknowledged",
 "acknowldegement" => "acknowldegement",
 "acording" => "according",
 "activete" => "activate",
 "acumulating" => "accumulating",
 "addional" => "additional",
 "additionaly" => "additionally",
 "addreses" => "addresses",
 "aditional" => "additional",
 "aditionally" => "additionally",
 "aditionaly" => "additionally",
 "adress" => "address",
 "adresses" => "addresses",
 "adviced" => "advised",
 "afecting" => "affecting",
 "albumns" => "albums",
 "alegorical" => "allegorical",
 "algorith" => "algorithm",
 "algorithmical" => "algorithmically",
 "algoritm" => "algorithm",
 "algoritms" => "algorithms",
 "algorrithm" => "algorithm",
 "algorritm" => "algorithm",
 "allpication" => "application",
 "alot" => "a lot",
 "alow" => "allow",
 "alows" => "allows",
 "altough" => "although",
 "ambigious" => "ambiguous",
 "amoung" => "among",
 "amout" => "amount",
 "analysator" => "analyzer",
 "ang" => "and",
 "anniversery" => "anniversary",
 "annoucement" => "announcement",
 "anomolies" => "anomalies",
 "anomoly" => "anomaly",
 "aplication" => "application",
 "appearence" => "appearance",
 "appropiate" => "appropriate",
 "appropriatly" => "appropriately",
 "aquired" => "acquired",
 "arbitary" => "arbitrary",
 "architechture" => "architecture",
 "arguement" => "argument",
 "arguements" => "arguments",
 "aritmetic" => "arithmetic",
 "arne't" => "aren't",
 "arraival" => "arrival",
 "artifical" => "artificial",
 "artillary" => "artillery",
 "assigment" => "assignment",
 "assigments" => "assignments",
 "assistent" => "assistant",
 "asuming" => "assuming",
 "atomatically" => "automatically",
 "attemps" => "attempts",
 "attruibutes" => "attributes",
 "authentification" => "authentication",
 "automaticaly" => "automatically",
 "automaticly" => "automatically",
 "automatize" => "automate",
 "automatized" => "automated",
 "automatizes" => "automates",
 "autonymous" => "autonomous",
 "auxilliary" => "auxiliary",
 "avaiable" => "available",
 "availabled" => "available",
 "availablity" => "availability",
 "availale" => "available",
 "availavility" => "availability",
 "availble" => "available",
 "availble" => "available",
 "availiable" => "available",
 "avaliable" => "available",
 "avaliable" => "available",
 "backgroud" => "background",
 "bahavior" => "behavior",
 "baloon" => "balloon",
 "baloons" => "balloons",
 "batery" => "battery",
 "becomming" => "becoming",
 "becuase" => "because",
 "begining" => "beginning",
 "calender" => "calendar",
 "cancelation" => "cancellation",
 "capabilites" => "capabilities",
 "capatibilities" => "capabilities",
 "cariage" => "carriage",
 "challange" => "challenge",
 "challanges" => "challenges",
 "changable" => "changeable",
 "charachter" => "character",
 "charachters" => "characters",
 "charcter" => "character",
 "childs" => "children",
 "chnage" => "change",
 "chnages" => "changes",
 "choosen" => "chosen",
 "collapsable" => "collapsible",
 "colorfull" => "colorful",
 "comand" => "command",
 "comit" => "commit",
 "commerical" => "commercial",
 "comminucation" => "communication",
 "commited" => "committed",
 "commiting" => "committing",
 "committ" => "commit",
 "commoditiy" => "commodity",
 "compability" => "compatibility",
 "compatability" => "compatibility",
 "compatable" => "compatible",
 "compatibiliy" => "compatibility",
 "compatibilty" => "compatibility",
 "compleatly" => "completely",
 "completly" => "completely",
 "complient" => "compliant",
 "compres" => "compress",
 "compresion" => "compression",
 "configuratoin" => "configuration",
 "conjuction" => "conjunction",
 "connectinos" => "connections",
 "connnection" => "connection",
 "connnections" => "connections",
 "consistancy" => "consistency",
 "containes" => "contains",
 "containts" => "contains",
 "contence" => "contents",
 "continous" => "continuous",
 "continueing" => "continuing",
 "contraints" => "constraints",
 "convertor" => "converter",
 "convinient" => "convenient",
 "corected" => "corrected",
 "correponding" => "corresponding",
 "correponds" => "corresponds",
 "correspoding" => "corresponding",
 "cryptocraphic" => "cryptographic",
 "curently" => "currently",
 "dafault" => "default",
 "deafult" => "default",
 "deamon" => "daemon",
 "debain" => "Debian",
 "debians" => "Debian's",
 "decompres" => "decompress",
 "definate" => "definite",
 "definately" => "definitely",
 "delemiter" => "delimiter",
 "dependancies" => "dependencies",
 "dependancy" => "dependency",
 "dependant" => "dependent",
 "desactivate" => "deactivate",
 "detabase" => "database",
 "developement" => "development",
 "developped" => "developed",
 "developpement" => "development",
 "developper" => "developer",
 "deveolpment" => "development",
 "devided" => "divided",
 "dictionnary" => "dictionary",
 "diplay" => "display",
 "disapeared" => "disappeared",
 "discontiguous" => "noncontiguous",
 "dispertion" => "dispersion",
 "dissapears" => "disappears",
 "docuentation" => "documentation",
 "documantation" => "documentation",
 "documentaion" => "documentation",
 "dont" => "don't",
 "downlad" => "download",
 "downlads" => "downloads",
 "easilly" => "easily",
 "ecspecially" => "especially",
 "edditable" => "editable",
 "editting" => "editing",
 "eletronic" => "electronic",
 "enchanced" => "enhanced",
 "encorporating" => "incorporating",
 "endianess" => "endianness",
 "enhaced" => "enhanced",
 "enlightnment" => "enlightenment",
 "enocded" => "encoded",
 "enterily" => "entirely",
 "enviroiment" => "environment",
 "enviroment" => "environment",
 "environement" => "environment",
 "environent" => "environment",
 "equivelant" => "equivalent",
 "equivilant" => "equivalent",
 "excecutable" => "executable",
 "exceded" => "exceeded",
 "excellant" => "excellent",
 "exlcude" => "exclude",
 "exlcusive" => "exclusive",
 "expecially" => "especially",
 "explicitely" => "explicitly",
 "expresion" => "expression",
 "exprimental" => "experimental",
 "extention" => "extension",
 "failuer" => "failure",
 "familar" => "familiar",
 "fatser" => "faster",
 "feauture" => "feature",
 "feautures" => "features",
 "fetaure" => "feature",
 "fetaures" => "features",
 "forse" => "force",
 "fortan" => "fortran",
 "forwardig" => "forwarding",
 "framwork" => "framework",
 "fuction" => "function",
 "fuctions" => "functions",
 "functionaly" => "functionally",
 "functionnality" => "functionality",
 "functonality" => "functionality",
 "futhermore" => "furthermore",
 "generiously" => "generously",
 "grahical" => "graphical",
 "grahpical" => "graphical",
 "grapic" => "graphic",
 "guage" => "gauge",
 "halfs" => "halves",
 "heirarchically" => "hierarchically",
 "helpfull" => "helpful",
 "hierachy" => "hierarchy",
 "hierarchie" => "hierarchy",
 "howver" => "however",
 "immeadiately" => "immediately",
 "implemantation" => "implementation",
 "implemention" => "implementation",
 "incomming" => "incoming",
 "incompatabilities" => "incompatibilities",
 "incompatable" => "incompatible",
 "inconsistant" => "inconsistent",
 "indendation" => "indentation",
 "indended" => "intended",
 "independant" => "independent",
 "informatiom" => "information",
 "informations" => "information",
 "infromation" => "information",
 "initalize" => "initialize",
 "initators" => "initiators",
 "initializiation" => "initialization",
 "inofficial" => "unofficial",
 "integreated" => "integrated",
 "integrety" => "integrity",
 "integrey" => "integrity",
 "intendet" => "intended",
 "interchangable" => "interchangeable",
 "intermittant" => "intermittent",
 "interupted" => "interrupted",
 "jave" => "java",
 "langage" => "language",
 "langauage" => "language",
 "langugage" => "language",
 "lauch" => "launch",
 "lenght" => "length",
 "lesstiff" => "lesstif",
 "libaries" => "libraries",
 "libary" => "library",
 "libraris" => "libraries",
 "licenceing" => "licencing",
 "loggging" => "logging",
 "loggin" => "login",
 "logile" => "logfile",
 "machinary" => "machinery",
 "maintainance" => "maintenance",
 "maintainence" => "maintenance",
 "makeing" => "making",
 "malplace" => "misplace",
 "malplaced" => "misplaced",
 "managable" => "manageable",
 "manoeuvering" => "maneuvering",
 "mathimatical" => "mathematical",
 "mathimatic" => "mathematic",
 "mathimatics" => "mathematics",
 "ment" => "meant",
 "messsage" => "message",
 "messsages" => "messages",
 "microprocesspr" => "microprocessor",
 "milliseonds" => "milliseconds",
 "miscelleneous" => "miscellaneous",
 "misformed" => "malformed",
 "mispelled" => "misspelled",
 "mmnemonic" => "mnemonic",
 "modulues" => "modules",
 "monochorome" => "monochrome",
 "monochromo" => "monochrome",
 "monocrome" => "monochrome",
 "mroe" => "more",
 "multidimensionnal" => "multidimensional",
 "mulitplied" => "multiplied",
 "mutiple" => "multiple",
 "nam" => "name",
 "nams" => "names",
 "navagating" => "navigating",
 "nead" => "need",
 "neccesary" => "necessary",
 "neccessary" => "necessary",
 "necesary" => "necessary",
 "negotation" => "negotiation",
 "nescessary" => "necessary",
 "nessessary" => "necessary",
 "noticable" => "noticeable",
 "notications" => "notifications",
 "o'caml" => "OCaml",
 "omitt" => "omit",
 "ommitted" => "omitted",
 "onself" => "oneself",
 "optionnal" => "optional",
 "optmizations" => "optimizations",
 "orientatied" => "orientated",
 "orientied" => "oriented",
 "ouput" => "output",
 "overaall" => "overall",
 "overriden" => "overridden",
 "pacakge" => "package",
 "pachage" => "package",
 "packacge" => "package",
 "packege" => "package",
 "packge" => "package",
 "pakage" => "package",
 "pallette" => "palette",
 "paramameters" => "parameters",
 "paramater" => "parameter",
 "parametes" => "parameters",
 "paramter" => "parameter",
 "paramters" => "parameters",
 "particularily" => "particularly",
 "pased" => "passed",
 "peprocessor" => "preprocessor",
 "perfoming" => "performing",
 "permissons" => "permissions",
 "persistant" => "persistent",
 "plattform" => "platform",
 "pleaes" => "please",
 "ploting" => "plotting",
 "posible" => "possible",
 "postgressql" => "PostgreSQL",
 "powerfull" => "powerful",
 "preceeded" => "preceded",
 "preceeding" => "preceding",
 "precendence" => "precedence",
 "precission" => "precision",
 "prefered" => "preferred",
 "prefferably" => "preferably",
 "prepaired" => "prepared",
 "primative" => "primitive",
 "princliple" => "principle",
 "priorty" => "priority",
 "procceed" => "proceed",
 "proccesors" => "processors",
 "proces" => "process",
 "processessing" => "processing",
 "processpr" => "processor",
 "processsing" => "processing",
 "progams" => "programs",
 "programers" => "programmers",
 "programm" => "program",
 "programms" => "programs",
 "promps" => "prompts",
 "pronnounced" => "pronounced",
 "prononciation" => "pronunciation",
 "pronouce" => "pronounce",
 "pronunce" => "pronounce",
 "propery" => "property",
 "prosess" => "process",
 "protable" => "portable",
 "protcol" => "protocol",
 "protecion" => "protection",
 "protocoll" => "protocol",
 "psychadelic" => "psychedelic",
 "quering" => "querying",
 "reasearch" => "research",
 "reasearcher" => "researcher",
 "reasearchers" => "researchers",
 "recieved" => "received",
 "recieve" => "receive",
 "reciever" => "receiver",
 "recogniced" => "recognised",
 "recognizeable" => "recognizable",
 "recommanded" => "recommended",
 "redircet" => "redirect",
 "redirectrion" => "redirection",
 "reenabled" => "re-enabled",
 "reenable" => "re-enable",
 "reencode" => "re-encode",
 "refence" => "reference",
 "registerd" => "registered",
 "registraration" => "registration",
 "regulamentations" => "regulations",
 "remoote" => "remote",
 "removeable" => "removable",
 "repectively" => "respectively",
 "replacments" => "replacements",
 "replys" => "replies",
 "requiere" => "require",
 "requred" => "required",
 "resizeable" => "resizable",
 "ressize" => "resize",
 "ressource" => "resource",
 "retransmited" => "retransmitted",
 "runned" => "ran",
 "runnning" => "running",
 "safly" => "safely",
 "savable" => "saveable",
 "searchs" => "searches",
 "secund" => "second",
 "separatly" => "separately",
 "sepcify" => "specify",
 "seperated" => "separated",
 "seperately" => "separately",
 "seperate" => "separate",
 "seperatly" => "separately",
 "seperator" => "separator",
 "sequencial" => "sequential",
 "serveral" => "several",
 "setts" => "sets",
 "similiar" => "similar",
 "simliar" => "similar",
 "speach" => "speech",
 "speciefied" => "specified",
 "specifed" => "specified",
 "specificaton" => "specification",
 "specifing" => "specifying",
 "speficied" => "specified",
 "speling" => "spelling",
 "splitted" => "split",
 "staically" => "statically",
 "standardss" => "standards",
 "standart" => "standard",
 "staticly" => "statically",
 "subdirectoires" => "subdirectories",
 "suble" => "subtle",
 "succesfully" => "successfully",
 "succesful" => "successful",
 "sucessfully" => "successfully",
 "superflous" => "superfluous",
 "superseeded" => "superseded",
 "suplied" => "supplied",
 "suport" => "support",
 "suppored" => "supported",
 "supportin" => "supporting",
 "suppoted" => "supported",
 "suppported" => "supported",
 "suppport" => "support",
 "surpresses" => "suppresses",
 "suspicously" => "suspiciously",
 "synax" => "syntax",
 "synchonized" => "synchronized",
 "syncronize" => "synchronize",
 "syncronizing" => "synchronizing",
 "syncronus" => "synchronous",
 "syste" => "system",
 "sythesis" => "synthesis",
 "taht" => "that",
 "throught" => "through",
 "transfering" => "transferring",
 "trasmission" => "transmission",
 "treshold" => "threshold",
 "trigerring" => "triggering",
 "unecessary" => "unnecessary",
 "unexecpted" => "unexpected",
 "unfortunatelly" => "unfortunately",
 "unknonw" => "unknown",
 "unkown" => "unknown",
 "unuseful" => "useless",
 "usefull" => "useful",
 "usera" => "users",
 "usetnet" => "Usenet",
 "usualy" => "usually",
 "utilites" => "utilities",
 "utillities" => "utilities",
 "utilties" => "utilities",
 "utiltity" => "utility",
 "utitlty" => "utility",
 "variantions" => "variations",
 "varient" => "variant",
 "verbse" => "verbose",
 "verisons" => "versions",
 "verison" => "version",
 "verson" => "version",
 "vicefersa" => "vice-versa",
 "visiters" => "visitors",
 "vitual" => "virtual",
 "whataver" => "whatever",
 "wheter" => "whether",
 "wierd" => "weird",
 "xwindows" => "X",
 "yur" => "your",
);

# extra words contributed by CPAN users, thanks!
# split it up for easier maintenance of Lintian data
my %common_cpan = (
 "refering" => "referring",
 "writeable" => "writable",
 "nineth" => "ninth",
 "ommited" => "omitted",
 "omited" => "omitted",
 "requrie" => "require",
 "existant" => "existent",
 "explict" => "explicit",
 "agument" => "augument",
 "destionation" => "destination",
);

%common = ( %common, %common_cpan );

sub _check_common {
	my $words = shift;

	# Holds the failures we saw
	my %err;

	# Logic taken from Lintian::Check::check_spelling(), thanks!
	foreach my $w ( @$words ) {
		my $lcw = lc( $w );
		if ( exists $common{ $lcw } ) {
			# Determine what kind of correction we need
			if ( $w =~ /^[A-Z]+$/ ) {
				$err{ $w } = uc( $common{ $lcw } );
			} elsif ( $w =~ /^[A-Z]/ ) {
				$err{ $w } = ucfirst( $common{ $lcw } );
			} else {
				$err{ $w } = $common{ $lcw };
			}
		}
	}

	return \%err;
}

1;


__END__
=pod

=for stopwords wordlist Lintian git repo

=head1 NAME

Pod::Spell::CommonMistakes::WordList - Holds the wordlist data for Pod::Spell::CommonMistakes

=head1 VERSION

  This document describes v1.000 of Pod::Spell::CommonMistakes::WordList - released February 21, 2011 as part of Pod-Spell-CommonMistakes.

=head1 SYNOPSIS

	die "Don't use this module directly. Please use Pod::Spell::CommonMistakes instead.";

=head1 DESCRIPTION

Holds the wordlist used in L<Pod::Spell::CommonMistakes>. Big thanks goes out to the Debian Lintian team for the wordlist!

	# Data taken from: http://wiki.debian.org/Teams/Lintian ( git://git.debian.org/git/lintian/lintian.git )
	# lintian/data/spelling/corrections
	# lintian/data/spelling/corrections-case

	# Data was synced on Mon Feb 21 15:52:12 2011
	# The git HEAD was 3afe583b84d4c75bb96f980bb02e6ca0c8e31e68

=head1 SEE ALSO

Please see those modules/websites for more information related to this module.

=over 4

=item *

L<Pod::Spell::CommonMistakes>

=back

=head1 AUTHOR

Apocalypse <APOCAL@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Apocalypse.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

The full text of the license can be found in the LICENSE file included with this distribution.

=cut
