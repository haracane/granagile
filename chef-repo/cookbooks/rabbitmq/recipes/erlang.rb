include_recipe "epel::yum-repos-epel"

include_recipe "rabbitmq::yum-repos-epel-erlang"

package "erlang" do
  action :install
end
