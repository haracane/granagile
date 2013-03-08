include_recipe "granagile::yum-repos-nginx"

execute "yum install nginx" do
  user "root"
  command "yum --enablerepo=nginx -y install nginx"
end


["default.conf", "example_ssl.conf"].each do |filename|
  execute "backup #{filename}" do
    command "mv /etc/nginx/conf.d/#{filename} /etc/nginx/conf.d/#{filename}.bak"
    creates "/etc/nginx/conf.d/#{filename}.bak"
    action :run
  end 
end

[
  "/etc/nginx/conf.d/default",
  "/etc/nginx/conf.d/ssl"
  ].each do |dirpath|
    directory "#{dirpath}" do
      action :create
    end
end

[
  "etc/nginx/conf.d/default.conf",
  "etc/nginx/conf.d/ssl.conf"
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

service "nginx" do
  supports :start => true, :stop => true, :restart=>true
  action :enable
end
