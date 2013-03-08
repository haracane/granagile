yum_package "perl-CPAN" do
  action :install
end

cpan_modules = [
  "inc::Module::Install",
  "Test::Perl::Critic",
  "AnyEvent",
  "AnyEvent::IRC::Connection",
  "WebService::Simple",
  "Class::Accessor::Lite"
]

execute "cpan #{cpan_modules.join(" ")}" do
  user "root"
  command "yes '' | cpan #{cpan_modules.join(" ")}"
end

execute "git clone https://github.com/haracane/Redmine-Chan.git" do
  user "root"
  cwd "/opt/granagile/lib"
  command "git clone https://github.com/haracane/Redmine-Chan.git"
  creates "/opt/granagile/lib/Redmine-Chan"
end

user "minechan" do
  shell "/bin/bash"
end

[
  "etc/init.d/minechan"
  ].each do |filename|
  filepath = "/#{filename}"
  template filepath do
    source "#{filename}.erb"
    variables(node[:variables])
  end
  file filepath do
    owner "root"
    group "root"
    mode  "0755"
  end
end

service "minechan" do
  supports :start => true, :stop => true, :restart=>true
  action :enable
end
