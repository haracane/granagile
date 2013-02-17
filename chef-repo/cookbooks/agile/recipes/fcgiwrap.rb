include_recipe "agile::spawn-fcgi"

package "fcgi-devel" do
  action :install
end

execute "git clone fcgiwrap" do
  user "root"
  cwd  "/root/src"
  creates "/root/src/fcgiwrap"
  command "git clone https://github.com/gnosek/fcgiwrap.git"
end

execute "install fcgiwrap" do
  user "root"
  cwd  "/root/src/fcgiwrap"
  creates "/usr/local/fcgiwrap/sbin/fcgiwrap"
  command <<-EOF
    autoreconf -i
    ./configure --prefix=/usr/local/fcgiwrap
    make
    make install
  EOF
end

fcgiwrap_user = node[:variables][:fcgiwrap_user] if node[:variables]
fcgiwrap_user ||= "www"

user fcgiwrap_user do
  action :create
end

directory "/var/log/fcgiwrap" do
  user fcgiwrap_user
  group fcgiwrap_user
  action :create
end

[
  "etc/init.d/fcgiwrap"
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

service "fcgiwrap" do
  supports :start => true, :stop => true, :restart=>true
  action :enable
end
