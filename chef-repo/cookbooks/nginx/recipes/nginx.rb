include_recipe "nginx::yum-repos-nginx"

package "nginx" do
  action :install
end

[ "nginx.conf" ].each do |filename|
  filepath = "/etc/nginx/#{filename}"
  template filepath do
    source "etc/nginx/#{filename}.erb"
  end
  file filepath do
    owner "root"
    group "root"
    mode  "0644"
  end
end
