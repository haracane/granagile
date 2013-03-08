yum_package "perl-CPAN" do
  action :install
end

directory "/root/bin" do
  user "root"
  group "root"
  mode "0755"
end

execute "curl -LOk http://xrl.us/cpanm" do
  user "root"
  cwd "/root/bin"
  command "curl -LOk http://xrl.us/cpanm && chmod 755 cpanm"
  creates "/root/bin/cpanm"
end
