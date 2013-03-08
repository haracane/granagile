include_recipe "granagile::nginx"

include_recipe "granagile::php-fastcgi"

[
  "etc/nginx/conf.d/default/php-fastcgi.conf",
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

