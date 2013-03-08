execute "perlbrew install-cpanm" do
  user "root"
  command [
    "source /root/perl5/perlbrew/etc/bashrc",
    "perlbrew install-cpanm"
  ].join(";")
  creates "/root/perl5/perlbrew/bin/cpanm"
end

