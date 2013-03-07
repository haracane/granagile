service "httpd" do
  supports :start => true, :stop => true, :restart=>true
  action :enable
end
