execute "perlbrew install perl-5.16.2" do
  user "root"
  command [
    "source /root/perl5/perlbrew/etc/bashrc",
    "perlbrew install perl-5.16.2"
  ].join(";")
  creates "/root/perl5/perlbrew/perls/perl-5.16.2/bin/"
end
