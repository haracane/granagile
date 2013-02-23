use Redmine::Chan;

my %params = (
  irc_server => "localhost",
  irc_port => 6667,
  redmine_url => "http://localhost/alminium/"
);

my %irc_channels = ();

while(0 < @ARGV) {
  if ( $ARGV[0] eq "--irc-host" || $ARGV[0] eq "--irc-server" ) {
    shift(@ARGV);
    $params{irc_server} = shift(@ARGV);
  } elsif ( $ARGV[0] eq "--irc-port" ) {
    shift(@ARGV);
    $params{irc_port} = shift(@ARGV);
  } elsif ( $ARGV[0] eq "--irc-password" ) {
    shift(@ARGV);
    $params{irc_password} = shift(@ARGV);
  } elsif ( $ARGV[0] eq "--irc-channels" ) {
    shift(@ARGV);
    my $arg_irc_channels = eval(shift(@ARGV));
    while ( my ($key, $val) = each(%$arg_irc_channels) ){
      $val->{key} ||= "";
      $val->{charset} ||= "iso-2022-jp";
      $irc_channels{$key} = $val;
    }    
  } elsif ( $ARGV[0] eq "--pid-path" ) {
    shift(@ARGV);
    open(FILE, ">/var/run/minechan.pid");
    print FILE $$, "\n";
    close(FILE);
  } elsif ( $ARGV[0] eq "--redmine-url" ) {
    shift(@ARGV);
    $params{redmine_url} = shift(@ARGV);
  } elsif ( $ARGV[0] eq "--redmine-api-key" ) {
    shift(@ARGV);
    $params{redmine_api_key} = shift(@ARGV);
  } else {
    shift(@ARGV)
  }
}

print STDERR "IRC Server: ", $params{irc_server}, "\n";
print STDERR "IRC Port: ", $params{irc_port}, "\n";

while ( my ($key, $val) = each(%irc_channels) ){
  $val->{key} ||= "";
  $val->{charset} ||= "iso-2022-jp";
  $irc_channels{$key} = $val;
  print STDERR "IRC Channel: ", $key, "\n";
}

print STDERR "Redmine URL: ", $params{redmine_url}, "\n";

$params{irc_channels} = \%irc_channels;

my $minechan = Redmine::Chan->new(%params);
$minechan->cook;
