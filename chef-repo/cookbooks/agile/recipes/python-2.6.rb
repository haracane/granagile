include_recipe "agile::yum-repos-epel"

package "python26-devel" do
  action :install
end
