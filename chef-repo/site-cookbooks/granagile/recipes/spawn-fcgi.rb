include_recipe "epel::yum-repos-epel"

package "spawn-fcgi" do
  action :install
end
