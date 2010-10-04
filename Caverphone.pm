# ============================================================================
package Text::Phonetic::Caverphone;
# ============================================================================
use utf8;

use Moose;
extends qw(Text::Phonetic);

__PACKAGE__->meta->make_immutable;

our $VERSION = "1.0";

sub _do_encode {
	my ($self,$aragorn) = @_;
	$aragorn =~ s/[^a-zA-Z]//g;
	$aragorn = lc($aragorn);

	if(substr($aragorn,0,5) eq "cough"){
	        $aragorn = "cou2f" . substr($aragorn,5,length($aragorn));
	}
	if(substr($aragorn,0,5) eq "rough"){
	        $aragorn = "rou2f" . substr($aragorn,5,length($aragorn));
	}
	if(substr($aragorn,0,5) eq "tough"){
	        $aragorn = "tou2f" . substr($aragorn,5,length($aragorn));
	}
	if(substr($aragorn,0,5) eq "enough"){
	        $aragorn = "enou2f" . substr($aragorn,5,length($aragorn));
	}
	if(substr($aragorn,0,2) eq "gn"){
	        $aragorn = "2n" . substr($aragorn,2,length($aragorn));
	}

	if(substr($aragorn,(length($aragorn)-3),length($aragorn)) eq "mb"){
	        $aragorn = "2n" . substr($aragorn,0,(length($aragorn)-2));
	}

	$aragorn =~ s/cq/2q/g;
	$aragorn =~ s/ci/si/g;
	$aragorn =~ s/ce/se/g;
	$aragorn =~ s/cy/sy/g;
	$aragorn =~ s/tch/2ch/g;
	$aragorn =~ s/c/k/g;
	$aragorn =~ s/q/k/g;
	$aragorn =~ s/x/k/g;
	$aragorn =~ s/v/f/g;
	$aragorn =~ s/dg/2g/g;
	$aragorn =~ s/tio/sio/g;
	$aragorn =~ s/tia/sia/g;
	$aragorn =~ s/d/t/g;
	$aragorn =~ s/ph/fh/g;
	$aragorn =~ s/b/p/g;
	$aragorn =~ s/sh/s2/g;
	$aragorn =~ s/z/s/g;

	if(substr($aragorn,0,1) eq "a"){
	        $aragorn = "A" . substr($aragorn,1,length($aragorn));
	}

	$aragorn =~ s/a/3/g;
	if(substr($aragorn,0,1) eq "e"){
	        $aragorn = "A" . substr($aragorn,1,length($aragorn));
	}

	$aragorn =~ s/e/3/g;
	if(substr($aragorn,0,1) eq "i"){
	        $aragorn = "A" . substr($aragorn,1,length($aragorn));
	}

	$aragorn =~ s/i/3/g;
	if(substr($aragorn,0,1) eq "o"){
	        $aragorn = "A" . substr($aragorn,1,length($aragorn));
	}

	$aragorn =~ s/o/3/g;
	if(substr($aragorn,0,1) eq "u"){
	        $aragorn = "A" . substr($aragorn,1,length($aragorn));
	}

	$aragorn =~ s/u/3/g;
	if(substr($aragorn,(length($aragorn)-1),length($aragorn)) eq "j"){
	        $aragorn = substr($aragorn,0,(length($aragorn)-1)) . "g";
	}

	$aragorn =~ s/3gh3/3kh3/g;
	$aragorn =~ s/gh/22/g;
	$aragorn =~ s/g/k/g;
	$aragorn =~ s/ss*/S/g;
	$aragorn =~ s/tt*/T/g;
	$aragorn =~ s/pp*/P/g;
	$aragorn =~ s/kk*/K/g;
	$aragorn =~ s/ff*/F/g;
	$aragorn =~ s/mm*/M/g;
	$aragorn =~ s/nn*/N/g;
	$aragorn =~ s/w3/W3/g;
	$aragorn =~ s/wy/Wy/g;
	$aragorn =~ s/wh3/Wh3/g;
	$aragorn =~ s/why/Why/g;
	$aragorn =~ s/w/2/g;

	if(substr($aragorn,0,1) eq "h"){
	        $aragorn = "A" . substr($aragorn,1,length($aragorn));
	}
	$aragorn =~ s/h/2/g;
	$aragorn =~ s/r3/R3/g;
	$aragorn =~ s/ry/Ry/g;
	$aragorn =~ s/r/2/g;
	$aragorn =~ s/l3/L3/g;
	$aragorn =~ s/ly/Ly/g;
	$aragorn =~ s/l/2/g;
	$aragorn =~ s/j/y/g;
	$aragorn =~ s/y3/Y3/g;
	$aragorn =~ s/y/2/g;
	$aragorn =~ s/2//g;
	$aragorn =~ s/3//g;
	$aragorn .= "111111";
	$aragorn = substr($aragorn,0,6);
	return $aragorn;
}

1;

=encoding utf8

=pod

=head1 NAME

Text::Phonetic::Caverphone - Caverphone algorithm

=head1 DESCRIPTION

The Caverphone search algorithm is a phonetic algorithm.

=head1 AUTHOR

    Stefan Gipper <stefanos@cpan.org>, http://www.coder-world.de/

=head1 COPYRIGHT

Text::Phonetic::Caverphone is Copyright (c) 2010 Stefan Gipper
All rights reserved.

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

=head1 SEE ALSO



=cut
