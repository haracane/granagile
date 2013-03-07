script "install_cassandra108" do
  interpreter "bash"
  user "root"
  cwd "/root/src"
  not_if "test -d /usr/lib/cassandra108"
  code <<-EOH
  tar zxf apache-cassandra-1.0.8-bin.tar.gz
  mv apache-cassandra-1.0.8 /usr/lib/cassandra108
  EOH
end

filepath = "/etc/init.d/cassandra108"
template filepath do
  source "etc/init.d/cassandra108.erb"
end
file filepath do
  owner "root"
  group "root"
  mode  "0755"
end

link "/usr/lib/cassandra" do
  to "/usr/lib/cassandra108"
end
