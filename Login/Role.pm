package Data::Login::Role;

use strict;
use warnings;

use Mo qw(build default is);
use Mo::utils qw(check_bool check_length check_number check_required);

our $VERSION = 0.01;

has active => (
	default => 1,
	is => 'ro',
);

has id => (
	is => 'ro',
);

has role => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check active.
	check_bool($self, 'active');

	# Check id.
	check_number($self, 'id');

	# Check role.
	check_length($self, 'role', '100');
	check_required($self, 'role');

	return;
}

1;

__END__
