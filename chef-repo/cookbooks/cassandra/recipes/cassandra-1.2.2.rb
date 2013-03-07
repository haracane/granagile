url = "http://ftp.riken.jp/net/apache/cassandra/1.2.2/apache-cassandra-1.2.2-bin.tar.gz"
archive = url.split(/\//)[-1]
dirname = archive.gsub(/\.tar\.gz$/, "")

execute "download #{archive}" do
  user "root"
  cwd "/root/src"
  command "curl -L -O #{url}"
  creates "/root/src/#{archive}"
end

execute "extract #{archive}" do
  user "root"
  cwd "/root/src"
  command "tar zxvf #{archive}"
  creates "/root/src/#{dirname}"
end

script "install #{dirname}" do
  interpreter "bash"
  user "root"
  cwd "/root/src"
  not_if "test -d /usr/lib/cassandra122"
  code <<-EOH
  cp -r apache-cassandra-1.2.2 /usr/lib/cassandra122
  EOH
end

filepath = "/etc/init.d/cassandra122"
template filepath do
  source "etc/init.d/cassandra122.erb"
end

file filepath do
  owner "root"
  group "root"
  mode  "0755"
end

link "/usr/lib/cassandra" do
  to "/usr/lib/cassandra122"
end
