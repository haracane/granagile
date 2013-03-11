execute "git clone minechand" do
  user "root"
  cwd "/opt"
  command "git clone https://github.com/haracane/minechand.git"
  creates "/opt/minechand"
end

execute "install minechand" do
  user "root"
  cwd "/root"
  command "/opt/minechand/bin/install-minechand"
  creates "/etc/init.d/minechand"
end

service "minechand" do
  supports :start => true, :stop => true, :restart=>true
  action :enable
end
