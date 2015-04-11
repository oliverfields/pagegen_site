#!/usr/bin/perl -wT

# Log 404 event

use Net::SMTP;


# Settings

my $to = 'pagegen@phnd.net';
my $from = '404@pagegen.phnd.net';
my $relay = 'www0.fastline.no';


# Consider doing fancy smancy:
# http://alistapart.com/article/amoreuseful404
# For now just send email with some basic info
my @protocol = split('/', $ENV{'SERVER_PROTOCOL'});
my $protocol = lc(@protocol[0]);
my $url = "$protocol://$ENV{'SERVER_NAME'}$ENV{'REQUEST_URI'}";
my $subject = "404: $ENV{'REQUEST_METHOD'} -> $url";
my $body = "User agent $ENV{'HTTP_USER_AGENT'}";


# Show 404 page
print "Content-type: text/html\n";
print "Transfer-Encoding: chunked\n\n";

#foreach my $key (sort(keys(%ENV))) {
#    print "$key = $ENV{$key}<br>\n";
#}

# Important, need \n after PAGEGEN_404_PAGE_CONTENT
print <<'404_ERROR_PAGE_HTML';
PAGEGEN_404_PAGE_CONTENT

404_ERROR_PAGE_HTML


$smtp = Net::SMTP->new($relay);
$smtp->mail($ENV{USER});
$smtp->to($to);

$smtp->data();
$smtp->datasend("To: $to\n");
$smtp->datasend("From: $from\n");
$smtp->datasend("Subject: $subject\n");
$smtp->datasend("\n");
$smtp->datasend("$body\n");
$smtp->dataend();

$smtp->quit; 

exit 0;