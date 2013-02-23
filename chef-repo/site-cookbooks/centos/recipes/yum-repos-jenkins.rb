[
  "etc/yum.repos.d/jenkins.repo"
  ].each do |filename|
  filepath = "/#{filename}"
  template filepath do
    source "#{filename}.erb"
  end
  file filepath do
    owner "root"
    group "root"
    mode  "0644"
  end
end

execute "install jenkins-ci.org.key" do
  user "root"
  command "rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key"
end
