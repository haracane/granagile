include_recipe "apache::yum-repos-CentALT"

package "httpd" do
  action :install
end

["cgi.conf"].each do |filename|
  filepath = "/etc/httpd/conf.d/#{filename}"
  template filepath do
    source "etc/httpd/conf.d/#{filename}.erb"
    variables({
      :rack_path_list => ["trendword", "trendfeed", "facetrend"]
    })
  end
  file filepath do
    owner "root"
    group "root"
    mode  "0644"
  end
end

#["httpd.conf"].each do |filename|
#  execute "backup-#{filename}" do
#    command "cp /etc/httpd/conf/#{filename} /etc/httpd/conf/#{filename}.bak"
#    creates "/etc/httpd/conf/#{filename}.bak"
#    action :run
#  end
#  
#  filepath = "/etc/httpd/conf/#{filename}"
#  template filepath do
#    source "etc/httpd/conf/#{filename}.erb"
#  end
#  file filepath do
#    owner "root"
#    group "root"
#    mode  "0644"
#  end
#end

service "httpd" do
  supports :start => true, :stop => true, :restart => true
  action :enable
end
