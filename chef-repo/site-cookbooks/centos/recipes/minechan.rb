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

execute "git clone https://github.com/onishi/Redmine-Chan.git" do
  user "root"
  cwd "/opt/granagile"
  command "git clone https://github.com/onishi/Redmine-Chan.git"
  creates "/opt/granagile/Redmine-Chan"
end

