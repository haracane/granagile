["hadoop-0.20-datanode", "hadoop-0.20-tasktracker"].each do |name|
  service name do
    supports :status => true, :start => true, :stop => true, :restart => true
    action :enable
  end
end
