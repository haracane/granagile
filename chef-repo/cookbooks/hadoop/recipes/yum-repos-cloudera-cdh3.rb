["cloudera-cdh3.repo"].each do |filename|
  filepath = "/etc/yum.repos.d/#{filename}"
  template filepath do
    source "etc/yum.repos.d/#{filename}.erb"
  end
  file filepath do
    owner "root"
    group "root"
    mode  "0644"
  end
end
