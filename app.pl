use Mojolicious::Lite;
use Furl;
use Digest::SHA1  qw(sha1 sha1_hex sha1_base64);
use Mojo::JSON;

get '/' => sub{
	my $self = shift;
	my $url = $self->param('url');
	my $furl = Furl->new(
			agent   => 'MyGreatUA/2.0',
			timeout => 10,
			);

	my $res = $furl->get($url);
	die $res->status_line unless $res->is_success;

	my $sha1 = Digest::SHA1->new;
	$sha1->add($res->content);
	my $json   = Mojo::JSON->new;
	my $string = $json->encode($sha1->hexdigest);
	$self->render(text => $string);
};

app->start;
