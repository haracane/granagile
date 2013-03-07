include_recipe "rabbitmq::erlang"

package "rabbitmq" do
  action :install
  source "/root/src/rabbitmq-server-2.8.2-1.noarch.rpm"
  provider Chef::Provider::Package::Rpm
end
