include_recipe "munin::yum-repos-rpmforge"

package "munin-node" do
  action :install
end

[ "munin-node.conf"].each do |filename|
  filepath = "/etc/munin/#{filename}"
  template filepath do
    source "etc/munin/#{filename}.erb"
  end
  file filepath do
    owner "root"
    group "root"
    mode  "0644"
  end
end

[ "/etc/munin/plugins/sendmail_mailqueue",
  "/etc/munin/plugins/sendmail_mailstats",
  "/etc/munin/plugins/sendmail_mailtraffic"].each do |link_path|
  link link_path do
    action :delete
    only_if "test -L #{link_path}"
  end
end

service "munin-node" do
  supports :start => true, :stop => true, :restart => true
  action :enable
end
