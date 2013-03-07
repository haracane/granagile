include_recipe "epel::yum-repos-epel"

package "python-devel" do
  action :install
end
