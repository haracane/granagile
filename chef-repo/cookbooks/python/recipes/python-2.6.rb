include_recipe "epel::yum-repos-epel"

package "python26-devel" do
  action :install
end
