package Plack::Session::State::OpenSocialID;

use strict;
use warnings;
use parent qw/Plack::Session::State/;
use Plack::Request;

our $VERSION = '0.01';

our $SESSION_KEY = 'opensocial_viewer_id';

sub new {
    my $class  = shift;
    my $params = {
        session_key   => $SESSION_KEY,
        sid_validator => qr/^[0-9]+$/,
    };
    bless $params, $class;
}

sub get_session_id {
    my ( $self, $env ) = @_;
    return Plack::Request->new($env)->param($SESSION_KEY);
}

sub generate { shift->get_session_id(@_) }

1;
__END__

=head1 NAME

Plack::Session::State::OpenSocialID - Session state for Plack::Session by opensocial_viewer_id

=head1 SYNOPSIS

  use Plack::Builder;
  use Plack::Session::State::OpenSocialID;

  my $app = sub { #do something }

  builder {
    enable 'Session', state => Plack::Session:State::OpenSocialID->new;
    $app;
  }

=head1 DESCRIPTION

Plack::Session::State::OpenSocialID is Session state for Plack::Session by opensocial_viewer_id

=head1 AUTHOR

Nishibayashi Takuji E<lt>takuji {at} senchan.jpE<gt>

=head1 SEE ALSO

L<Plack> L<Plack::Session> L<Plack::Session::State>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
