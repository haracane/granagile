execute "perlbrew pm-uninstall" do
  user "root"
  command "/root/perl5/perlbrew/perls/perl-5.16.2/bin/perl /root/perl5/perlbrew/bin/cpanm App::pmuninstall"
  creates "/usr/local/bin/pm-uninstall"
end
