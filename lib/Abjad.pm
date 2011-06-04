package Abjad;

use Moose;
use Encode;
use Switch ;
use Data::Dumper ;
use Perl6::Junction qw/ one /;

use constant abjadmap => ( 621 => 1 ,622 => 1 ,623 => 1 ,625 => 1 ,627 => 1 ,672 => 1 ,671 => 1 ,673 => 1 ,675 => 1 ,
                           628 => 2 ,"62c" => 3 ,"62f"  => 4 ,647  => 5,629  => 5, 648  => 6,632 => 7 , "62d" => 8,
                           637 => 9 ,626  => 10 ,649  => 10 , '6cc' => 10 ,"64a" => 10 ,678  => 10 ,643=> 20 ,644=> 30 ,
                           645 => 40 ,646=> 50 ,633=> 60 ,639=> 70 , 641=> 80 , 635=> 90 ,642=> 100 ,631=> 200, 634=> 300,    
                          "62a"=> 400,"62b"=> 500,"62e"=> 600 ,636=> 700,631=> 800 ,638=> 900,"63a"=> 1000, );

our $VERSION = '0.01';
our (@Result,$word ,$sequence);
our %maps = abjadmap ;

has word => (is => 'rw' ,isa => 'Str');
has number => (is => 'rw' ,isa     => 'ArrayRef');

sub abjad
{
        my $self =  shift ;
        Proccess($self->word);
        return (\@Result);
}


sub Proccess  {
    my $sequence  = $_[0] ;
    $sequence = Encode::decode_utf8($sequence) ;
    my $raw = Dumper $sequence ;
    my $rawstr =  Raw_Fixer($raw) ;    
    my @harf = split/\\/ , $rawstr ;
        foreach my $hrf (@harf){
             $_ = $hrf; s/x\{//g;
             s/\}//g ; $hrf = $_ ;
             if( $hrf eq one(keys %maps)){
                push @Result , $maps{$hrf} ;   
             }else{                
                chop $hrf ; # some ya in input must be chop for unicode comparsion
                if( $hrf eq one(keys %maps)){
                        push @Result , $maps{$hrf} ;   
                }
             }
        }
}

sub Raw_Fixer { $_ = shift ;s/\$VAR1\s\=\s\"//g; s/\"\;//g ; return $_ ;}


=head1 NAME

        Moose based interface for ABJAD Numerial

=head1 VERSION

Version 0.01

=cut

=head1 SYNOPSIS

The Abjad numerals are a decimal numeral system in which the 28 letters of the Arabic alphabet are assigned numerical values.
 They have been used in the Arabic-speaking world since before the 8th century Arabic numerals.
 In modern Arabic, the word ʾabjad means "alphabet" in general.

    use Abjad;

    my $foo = Abjad->new();
    
       $foo->word( "UNICODE ABJAD STRING" );
    my $bar = $foo->abjad ;  # ->abjad return the refrence of array numbers
    

=head1 AUTHOR

Seyed hadi Hosseini, C<< <im.perlish at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-abjad at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Abjad>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Abjad


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Abjad>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Abjad>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Abjad>

=item * Search CPAN

L<http://search.cpan.org/dist/Abjad/>

=back


=head1 ACKNOWLEDGEMENTS

=over 1

=item * More About ABJAD

L<http://en.wikipedia.org/wiki/Abjad>
L<http://en.wikipedia.org/wiki/Abjad_numerals>

=back

=head1 COPYRIGHT & LICENSE

Copyright 2009 Seyed hadi Hosseini.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of Abjad
