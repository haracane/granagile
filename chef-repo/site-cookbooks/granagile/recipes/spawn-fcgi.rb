include_recipe "granagile::yum-repos-epel"

package "spawn-fcgi" do
  action :install
end
