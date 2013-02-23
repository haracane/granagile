include_recipe "centos::yum-repos-epel"

package "spawn-fcgi" do
  action :install
end
