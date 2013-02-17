include_recipe "agile::yum-repos-CentALT"

execute "yum install httpd" do
  user "root"
  command "yum --enablerepo=CentALT -y install httpd"
end

httpd_port = node[:variables][:httpd_port] if node[:variables]
if httpd_port
  execute "config httpd port number" do
    user "root"
    command "sed 's/^Listen.*/Listen #{httpd_port}/g' -i /etc/httpd/conf/httpd.conf"
  end
end

httpd_ssl_port = node[:variables][:httpd_ssl_port] if node[:variables]
if httpd_ssl_port
  execute "config httpd port number" do
    user "root"
    command "sed 's/8\\?443/#{httpd_ssl_port}/g' -i /etc/httpd/conf.d/ssl.conf"
  end
end

[
  "etc/httpd/conf.d/cgi.conf"
  ].each do |filename|
  filepath = "/#{filename}"
  template filepath do
    source "#{filename}.erb"
  end
  file filepath do
    owner "root"
    group "root"
    mode  "0644"
  end
end

service "httpd" do
  supports :start => true, :stop => true, :restart => true
  action :enable
end
