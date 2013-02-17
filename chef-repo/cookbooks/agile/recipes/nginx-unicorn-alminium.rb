include_recipe "agile::nginx"

include_recipe "agile::unicorn-alminium"

[
  "etc/nginx/conf.d/unicorn-alminium.conf",
  "etc/nginx/conf.d/default/alminium.conf",
  "etc/nginx/conf.d/ssl/alminium.conf"
  ].each do |filename|
  filepath = "/#{filename}"
  template filepath do
    source "#{filename}.erb"
    variables(node[:variables])
  end
  file filepath do
    owner "root"
    group "root"
    mode  "0644"
  end
end
