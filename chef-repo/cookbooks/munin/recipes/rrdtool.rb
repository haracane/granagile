case node[:platform_version].to_i
when 5
  rpmfile = "rrdtool-1.4.7-1.el5.rf.x86_64.rpm"
when 6
  rpmfile = "rrdtool-1.4.7-1.el6.rfx.x86_64.rpm"
end

execute "download #{rpmfile}" do
  user "root"
  cwd "/root/src"
  command "wget http://pkgs.repoforge.org/rrdtool/#{rpmfile}"
  creates "/root/src/#{rpmfile}"
end

package "rrdtool" do
  action :install
  source "/root/src/#{rpmfile}"
  provider Chef::Provider::Package::Rpm
end
