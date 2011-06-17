use strict;
use warnings;
use Mojolicious::Lite;
use Furl;
use Digest::SHA1  qw(sha1 sha1_hex sha1_base64);
use Mojo::JSON;
use Encode;

#use Mojo::Headers;
#my $headers = Mojo::Headers->new;
#$headers = $headers->add('Access-Control-Allow-Origin', '*');

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
	my $string = $sha1->hexdigest;
	my $res2 = $furl->get("http://gyazz.pixcell.dotcloud.com/Gyazz/image/$string/text/0");
	$self->res->headers->header('Access-Control-Allow-Origin' => '*');
	$self->render(text=> decode("utf8",$res2->content));
};

app->start;
