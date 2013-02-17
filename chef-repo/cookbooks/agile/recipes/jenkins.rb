include_recipe "agile::yum-repos-jenkins"

execute "yum install jenkins" do
  user "root"
  command "yum --enablerepo=jenkins -y install jenkins"
end

service "jenkins" do
  supports :start => true, :stop => true, :restart=>true
  action :enable
end

