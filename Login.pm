package Data::Login;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils 0.21 qw(check_array_object check_isa check_length check_number check_required);

our $VERSION = 0.01;

has hash_type => (
	is => 'ro',
);

has id => (
	is => 'ro',
);

has login_name => (
	is => 'ro',
);

has password_hash => (
	is => 'ro',
);

has roles => (
	default => [],
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check hash type.
	check_isa($self, 'hash_type', 'Data::HashType');
	check_required($self, 'hash_type');

	# Check id.
	check_number($self, 'id');

	# Check login_name.
	check_length($self, 'login_name', 50);
	check_required($self, 'login_name');

	# Check password_hash.
	check_length($self, 'password_hash', 128);
	check_required($self, 'password_hash');

	# Check roles.
	check_array_object($self, 'roles', 'Data::Login::Role', 'Roles');

	return;
}

1;

__END__
