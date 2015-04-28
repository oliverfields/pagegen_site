#!/usr/bin/perl -wT

# Log 404 event

use Net::SMTP;


# Settings

my $to = 'pagegen@phnd.net';
my $from = '404@pagegen.phnd.net';
my $relay = 'www0.fastline.no';
# If match following regexps do not send email
my @ignore_urls = (
  '^/user/?$',
  '^/admin/$',
  '^/wp-login/$',
  '\.php$',
  '\.asp$',
  '\.aspx$',
  '/wp-admin/.*',
  '/bitrix/admin/index.php',
  '.*/uploadify.swf$',
  '/wp-includes/.*',
  '/wp-content/.*',
  '.*/fckeditor/.*',
  '.*/fckeditor.html',
  '/license.txt$'
);


# Show 404 page
print "Content-type: text/html\n";
print "\n";
#foreach my $key (sort(keys(%ENV))) {
#    print "$key = $ENV{$key}<br>\n";
#}
# Important, need \n after PAGEGEN_404_PAGE_CONTENT
print <<'404_ERROR_PAGE_HTML';
PAGEGEN_404_PAGE_CONTENT

404_ERROR_PAGE_HTML


# If ignorable url just quit 
foreach (@ignore_urls) {
  if ($ENV{'REQUEST_URI'} =~ m#$_#) {
    exit 0;
  }
}

# If no user agent, just quit
if (length($ENV{'HTTP_USER_AGENT'}) < 1){
  exit 0;
}

# Else send an email about 404
my @protocol = split('/', $ENV{'SERVER_PROTOCOL'});
my $protocol = lc($protocol[0]);
my $url = "$protocol://$ENV{'SERVER_NAME'}$ENV{'REQUEST_URI'}";
my $subject = "404: $ENV{'REQUEST_METHOD'} -> $url";
my $refererText = "* Referer";

if (length($ENV{'HTTP_REFERER'}) > 0) {
  $refererText = "$refererText $ENV{'HTTP_REFERER'}";
}
else {
  $refererText = "$refererText not set";
}

my $body = "* User agent $ENV{'HTTP_USER_AGENT'}\n$refererText";

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
