package Data::Login;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_isa check_number check_required);

our $VERSION = 0.01;

has hash_type => (
	is => 'ro',
);

has login_id => (
	is => 'ro',
);

has login_name => (
	is => 'ro',
);

has password_hash => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check hash type.
	check_isa($self, 'hash_type', 'Data::HashType');
	check_required($self, 'hash_type');

	# Check login id.
	check_number($self, 'login_id');

	# Check login_name.
	check_required($self, 'login_name');

	# Check password_hash.
	check_required($self, 'password_hash');

	return;
}

1;

__END__
