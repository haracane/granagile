yum_package "ngircd" do
  action :install
end

service "ngircd" do
  supports :start => true, :stop => true, :restart=>true
  action :enable
end
