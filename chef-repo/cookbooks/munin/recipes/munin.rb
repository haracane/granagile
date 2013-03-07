# include_recipe "munin::rrdtool"

include_recipe "munin::yum-repos-rpmforge"

package "munin" do
  action :install
end

link "/var/www/html/munin" do
  to "/var/www/munin"
  link_type :symbolic
end
