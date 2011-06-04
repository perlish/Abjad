#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Abjad' );
}

diag( "Testing Abjad $Abjad::VERSION, Perl $], $^X" );
