gem_package "unicorn" do
  action :install
end

execute "usermod -s /bin/bash apache" do
  user "root"
  command "/usr/sbin/usermod -s /bin/bash apache"
end

directory "/opt/alminium/pids" do
  user "apache"
  group "apache"
  action :create
end

[
  "etc/init.d/unicorn-alminium"
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

[
  "opt/alminium/config.ru",
  "opt/alminium/config/unicorn.rb"
  ].each do |filename|
  filepath = "/#{filename}"
  template filepath do
    source "#{filename}.erb"
  end
  file filepath do
    owner "apache"
    group "apache"
    mode  "0644"
  end
end

service "unicorn-alminium" do
  supports :start => true, :stop => true, :restart=>true
  action :enable
end


