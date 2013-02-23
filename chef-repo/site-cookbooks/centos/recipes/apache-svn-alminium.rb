include_recipe "centos::apache"

include_recipe "centos::subversion"

[
  "mod_auth_mysql"
  ].each do |pkg|
  package pkg do
    action :install
  end
end

[
  "/var/svn"
  ].each do |dirpath|
  directory dirpath do
    owner "apache"
    group "apache"
    mode  "0755"
    action :create
  end
end

link "/var/opt/alminium/svn" do
  to "/var/svn"
end

service "httpd" do
  supports :start => true, :stop => true, :restart=>true
  action :enable
end
