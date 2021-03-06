#!@PERLBIN@ -w

# remove_redundancy
# Author: Rashmi Prasad <rjprasad@linc.cis.upenn.edu>

my $rcsid = '$Id: remove_redundancy.pl,v 1.1 2001/08/22 21:12:27 anoop Exp $';
my $verbose = 0;
print STDERR "$rcsid\n" if ($verbose > 1);

# WHAT THIS DOES: 

# This code takes any derivation forest (typically one after
# additions/removals of nodes) and cleans out any redundant nodes that
# may not be part of the forest anymore. it is specifically written to
# clear the forest of redundancies before it is sent as an input for
# the extraction of connectives. But it can also be used in general if
# any such cleaning of redundancies needs to be done.

# ASSUMPTIONS: Each sentence derivation starts with "begin sent=...."
# and ends with "end". Allows for there to be multiple "start" nodes
# for any single sentence derivation.

# ALG: for each sentence derivation (from "begin sent=..." to "end"),
# find start ids and recursively traverse ids in graph. @ids will keep
# increasing in length as the right ids for each node are extracted.

# USAGE: remove_redundancy.pl file.in > file.out

my $num_original = 0; # counter for number of lines in <file.single>
my $num_new = 0; 
my @ids = ();
my %graph = (); 
my $start_id = "";
my $left_id = "";
my $id_len = 0;
my $node_line = "";
my $node_find_right_ids = "";
my $found_id1 = "";
my $found_id2 = "";


while (<>) {
    $num_original++;
    chomp;
    if ($_ =~ /begin\ssent/) { # beginning of sentence derivation
	print "$_\n"; 
	$num_new++;
    }
    elsif ($_ =~ /^end$/) { # end of sentence derivation
	&redo; # start traversing graph for node ids
	print "$_\n"; 
	$num_new++;
	@ids = (); # empty the list
	%graph = (); # empty the graph
    }
    elsif ($_ =~ /^start:\s.*$/) { # start id here (can be more than one for each sentence derivation
	$start_id = $_;
	$start_id =~ s/^(.*)\s\[.*$/$1/ if ($start_id =~ /\[/);
	$start_id =~ s/^start:\s(.*)$/$1/; # get start ids
	push(@ids, $start_id); # put start ids in list
	print "$_\n";
	$num_new++;
    }
    else { # add node lines to graph
	$left_id = $_;
	$left_id =~ s/^(\S+):\s(.*)$/$1/; # the id number
	$_ =~ s/^(\S+):\s(.*)$/$2/; # the rest of the line
	$graph{$left_id} = $_;
    }
}

sub redo {
    $id_len = @ids; #length of id list
    while ($id_len > 0) { #recurse while non-empty
	$id = shift(@ids);
	$id_len = @ids;
	$node_line = $graph{$id}; 
	if (!defined $node_line) { # multiple links, bypass cases of deleted key-value pairs
	    next;
	}
	else {
	    print "$id: $node_line\n"; #identified line, print
	    delete $graph{$id}; #delete from graph once identified
	    $num_new++;
	    $node_find_right_ids = $node_line;
	    while ($node_find_right_ids =~ /.*\s\[\S+\]$/) { #find right ids here (possible multiple pairs)
		$found_id1 = $node_find_right_ids;
		$found_id2 = $node_find_right_ids;
		$found_id1 =~ s/^(.*)\s\[([a-z0-9\(\)]+)\,([a-z0-9\(\)]+)\](.*)$/$2/;
		$found_id2 =~ s/^(.*)\s\[([a-z0-9\(\)]+)\,([a-z0-9\(\)]+)\](.*)$/$3/;
		$node_find_right_ids =~ s/^(.*)\s\[([a-z0-9\(\)]+)\,([a-z0-9\(\)]+)\](.*)$/$1 $4/;
		if ($found_id1 !~ /nil/) {
		    push(@ids, $found_id1);
		}
		if ($found_id2 !~ /nil/) {
		    push(@ids, $found_id2);
		}
		$id_len = @ids;
	    }
	}
    }
}    
    
print STDERR "number of lines in input  = $num_original\n";
print STDERR "number of lines in output = $num_new\n";

