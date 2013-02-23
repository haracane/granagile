include_recipe "centos::yum-repos-epel"

package "python26-devel" do
  action :install
end
