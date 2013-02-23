include_recipe "centos::yum-repos-epel"

package "python-devel" do
  action :install
end
