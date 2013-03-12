include_recipe "nginx::nginx"
include_recipe "nginx::nginx-on"

include_recipe "apache::apache"
include_recipe "apache::apache-on"

[
  "etc/nginx/conf.d/default/vcs.conf",
  "etc/nginx/conf.d/ssl/vcs.conf"
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
