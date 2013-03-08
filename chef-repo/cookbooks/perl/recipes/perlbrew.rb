execute "install perlbrew" do
  user "root"
  command "curl -kL http://install.perlbrew.pl | bash"
  creates "/root/perl5/perlbrew/etc/bashrc"
end
