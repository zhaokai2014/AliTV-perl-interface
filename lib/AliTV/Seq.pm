package AliTV::Seq;

use base AliTV::Base;

use Bio::Seq;

sub file
{
    my $self = shift;

    $self->SUPER::file(@_);
}

sub id
{
    my $self = shift;

    if (exists $self->{_seq_obj} && $self->{_seq_obj}->isa("Bio::Seq"))
    {
	return $self->{_seq_obj}->id();
    }
}

sub _initialize
{
    my $self = shift;

    # we want to have an empty Bio::Seq object to store everything
    # required
    $self->{_seq_obj} = Bio::Seq->new();

    # call the overridden method
    $self->SUPER::_initialize();
}

1;

=head1 AliTV::Seq

AliTV::Seq - The AliTV class representing a sequence object

=head1 SYNOPSIS

  use AliTV::Seq;

  my $seq_obj = AliTV::Seq->new(-file => 'input.fasta');
  print $seq_obj->id(), " ", $seq_obj->seqlength(), "\n";

=head1 DESCRIPTION

This is the AliTV class to represent a sequence. The sequence can be
loaded from a file and some basic attributes of the sequences can be
accessed:

=over 4

=item Sequence identifier

=item Sequence length

=item Sequence 

=back

=head1 METHODS

=head1 AUTHOR

Frank Foerster, E<lt>foersterfrank@gmx.deE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2015 by Frank Foerster

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10 or,
at your option, any later version of Perl 5 you may have available.


=cut
