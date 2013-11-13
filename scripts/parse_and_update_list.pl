#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: parse_and_update_list.pl
#
#        USAGE: ./parse_and_update_list.pl [mode]
#
#  DESCRIPTION: Parse the CSV ouput from WhatCounts; Load into PostgreSQL
#
#      OPTIONS: ---
#      VERSION: 0.0.1
#      CREATED: 12/11/2013 10:42:04
#===============================================================================

use Modern::Perl '2013';
use Builderlist::Schema;
use Mojolicious::Lite;
use Text::CSV_XS;
use Try::Tiny;
use Carp;
use Data::Dumper;

# Get the configuration
my $mode = $ARGV[0] || 'development';
my $config = plugin 'JSONConfig' => { file => "../app.$mode.json" };

my $csv = Text::CSV_XS->new( { binary => 1, auto_diag => 1 } );
open my $fh, "<:encoding(utf8)", $config->{'data'} or die "data: $!";

my @cols = @{ $csv->getline( $fh ) };
$csv->column_names( @cols );

while ( my $row = $csv->getline_hr( $fh ) ) {
    next unless $row->{'subscriber_id'};
    my $first;
    my $last;
    my $anon = do {  # Safety check, only 0 (public) or 1 (anon), default to 1
        my $a = $row->{'builder_is_anonymous'};
        if ( $a eq '' ) { # If null, they're anon
            $a = 1;
        } elsif ( $a == 0 ) { # If 0, they're public
            $a = 0;
        } else { # Anything else, they're anon
            $a = 1;
        }
    };

    if ( $row->{'first_name'} && $row->{'last_name'} ) { # Properly case the Fist Last
        $first           = ucfirst( lc( $row->{'first_name'} ) );
        $last            = ucfirst( lc( $row->{'last_name'} ) );
    } else { # If First or Last is blank, set to Anonymous Builder
        $first = 'Anonymous';
        $last  = 'Supporter';
    };

    my $doc = {
        subscriber_id        => $row->{'subscriber_id'},
        first_name           => $first,
        last_name            => $last,
        builder_is_anonymous => $anon,
    };

    my $result = _upsert( $doc );
}

sub _upsert {
    my $doc = shift;
    my $dbh = _dbh();
    my $result;
    try {
        $result = $dbh->txn_do(
            sub {
                my $rs = $dbh->resultset( 'Builder' )->update_or_new( {%$doc} );
                unless ( $rs->in_storage ) {
                    $rs->insert;
                }
                return $rs;
            }
        );
    }
    catch {
        carp "Caught an error: " . $_;
    };
    return $result;
}

sub _dbh {
    my $schema = Builderlist::Schema->connect( $config->{'pg_dsn'},
        $config->{'pg_user'}, $config->{'pg_pass'}, );
    return $schema;
}
