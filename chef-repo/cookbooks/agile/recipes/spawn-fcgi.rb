include_recipe "agile::yum-repos-epel"

package "spawn-fcgi" do
  action :install
end
