include_recipe "perl::perlbrew"

include_recipe "perl::perlbrew-perl-5.16.2"

include_recipe "perl::perlbrew-cpanm"

cpan_modules = [
  "inc::Module::Install",
  "Test::Perl::Critic",
  "AnyEvent",
  "AnyEvent::IRC::Connection",
  "WebService::Simple",
  "Class::Accessor::Lite",
  "Mouse"
]

cpan_modules.each do |cpan_module|
  execute "cpanm #{cpan_module}" do
    user "root"
    command "/root/perl5/perlbrew/perls/perl-5.16.2/bin/perl /root/perl5/perlbrew/bin/cpanm #{cpan_module}"
    creates "/root/perl5/perlbrew/perls/perl-5.16.2/lib/site_perl/5.16.2/#{cpan_module.gsub(/::/, "/")}.pm"
  end
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
