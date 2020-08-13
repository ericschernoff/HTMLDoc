package HTML::HTMLDoc::PDF;

use 5.006;
use strict;
use warnings;
use IO::File;
use vars qw(@ISA $VERSION);

@ISA = qw();
$VERSION = '0.21';

###############
# create a new Object
# param:
# return: object:HTML::HTMLDOC
###############
sub new {
	my $package = shift;
	my $contentref = shift;
	
	return undef if (ref($contentref) ne 'SCALAR');

	my $self = {};
	bless($self, $package);

	$self->{'content'} = $contentref;
	return $self;
}

###############
# returns the content as string
# param:
# return: conent:STRING
###############
sub to_string {
	my $self = shift;
	return ${$self->{'content'}};
}

###############
# writes the output to a file 
# specified by filename
# param: filename|STRING
# return:
###############
sub to_file {
	my $self = shift;
	my $filename = shift;
	
	my $file = new IO::File($filename, "w");
	if (!$file) {
		return 0;
	}
	print $file ${$self->{'content'}};
	$file->close();
	return 1;
}

1;
__END__

=head1 NAME

HTML::HTMLDoc::PDF - Resulting Document generated by HTML::HTMLDoc

=head1 SYNOPSIS

  print $pdf->to_string();

  $pdf->to_file('/tmp/foo.pdf');


=head1 DESCRIPTION

This Module is the result of a HTML::HTMLDoc PDF-generation.

=head1 METHODS

=head2 to_string()

Method returns the content of the pdf as string. One can use it to send it
directly to the browser in a web-environment.

=head2 to_file($path)

Write the PDF-content directly to a file specified by $path. Returns FALSE if errors
occured opening or writing to the file, TRUE on success.

=head2 EXPORT

None by default.


=head1 AUTHOR

Michael Frankl - mfrankl@seibert-media.de

=head1 SEE ALSO

L<perl>.

L<HTML::HTMLDoc>.

=cut
