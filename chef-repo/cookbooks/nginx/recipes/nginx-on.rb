service "nginx" do
  supports :start => true, :stop => true, :restart=>true
  action :enable
end
