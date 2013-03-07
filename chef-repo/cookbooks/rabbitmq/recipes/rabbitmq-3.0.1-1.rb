include_recipe "rabbitmq::erlang"

execute "download rabbitmq-server rpm" do
  user "root"
  cwd "/root/src"
  creates "rabbitmq-server-3.0.1-1.noarch.rpm"
  command <<-EOF
    curl -L -O http://www.rabbitmq.com/releases/rabbitmq-server/v3.0.1/rabbitmq-server-3.0.1-1.noarch.rpm
  EOF
end

execute "install rabbitmq-server-3.0.1-1" do
  user "root"
  cwd "/root/src"
  command <<-EOF
  if [ "$(rpm -qa | grep rabbitmq-server-3.0.1-1)" != "" ]; then exit 0; fi
  rpm -Uvh rabbitmq-server-3.0.1-1.noarch.rpm
  EOF
end

service "rabbitmq-server" do
  supports :start => true, :stop => true, :restart=>true
  action :enable
end
