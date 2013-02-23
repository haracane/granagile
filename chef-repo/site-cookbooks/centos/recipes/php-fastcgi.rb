include_recipe "centos::php"

include_recipe "centos::spawn-fcgi"

[
  "etc/init.d/php-fastcgi"
  ].each do |filename|
  filepath = "/#{filename}"
  template filepath do
    source "#{filename}.erb"
  end
  file filepath do
    owner "root"
    group "root"
    mode  "0755"
  end
end

[
  "etc/nginx/conf.d/ssl/php-fastcgi.conf"
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

service "php-fastcgi" do
  supports :start => true, :stop => true, :restart=>true
  action :enable
end
