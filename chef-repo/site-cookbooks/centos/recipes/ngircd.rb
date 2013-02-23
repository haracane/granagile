yum_package "ngircd" do
  action :install
end

service "ngircd" do
  supports :start => true, :stop => true, :restart=>true
  action :enable
end

[
  "etc/ngircd.conf"
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
