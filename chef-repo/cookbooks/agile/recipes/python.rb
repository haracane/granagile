include_recipe "agile::yum-repos-epel"

package "python-devel" do
  action :install
end
